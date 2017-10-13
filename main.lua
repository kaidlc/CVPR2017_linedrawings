require 'nn'
require 'image'

torch.setdefaulttensortype( 'torch.FloatTensor' )

-- Commandline options
cmd = torch.CmdLine()
cmd:addTime()
cmd:text()
cmd:option( '--model',     'cvpr2017_linedrawings.t7',    'Model to use' )
cmd:option( '--output',    'output.png',                  'Output image filename.' )
cmd:option( '--input',     'input.png',                   'Input image filename.' )
local opt = cmd:parse(arg or {})
print(opt)

-- Load model
print( 'Loading the model...')
local data = torch.load( opt.model )
local model = data.model
local imgmean = data.mean
local imgstd = data.std
model:evaluate()

-- All images should be loaded as 1 channel tensor
function load_image_gray ( imagepath )
   local img = image.load( imagepath, 1 )
   if img:size():size() == 2 then
      img = img:reshape(1,img:size(1),img:size(2))
   end
   return img
end

-- Simple post-processing with a sigmoid function
function post_process ( input , count)
   for i = 1, count do
      input = ( -10 ) * ( input - 0.5 )
      input = torch.cinv( 1 + torch.exp(input) )
   end
   return input 
end

print( 'Processing image...' )
input = load_image_gray( opt.input )

local nh = torch.round( input:size(3) )
local nw = torch.round( input:size(2) )
local gh = math.ceil( nh/16 )*16
local gw = math.ceil( nw/16 )*16
if gh ~= nh or gw ~= nw then
   local inputF = torch.Tensor( input:size(1), gw, gh ):fill(1)
   inputF[{{},{1,nw},{1,nh}}] = input
   input = inputF
end

input = ( input - imgmean ) / imgstd
input = input:reshape( 1, input:size(1), input:size(2), input:size(3) )

sys.tic()
image.save( opt.output, post_process( model:forward(input)[1], 1 ) )
print( string.format('Processing time:%.2f secs', sys.toc() ) )




