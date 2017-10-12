# [Joint Gap Detection and Inpainting of Line Drawings](http://hi.cs.waseda.ac.jp/~iizuka/projects/inpainting/)
Kazuma Sasaki, [Satoshi Iizuka](http://hi.cs.waseda.ac.jp/~iizuka/index_eng.html), [Edgar Simo-Serra](http://hi.cs.waseda.ac.jp/~esimo/), [Hiroshi Ishikawa](http://www.f.waseda.jp/hfs/indexE.html)

## Overview

This code provides an implementation of the research paper:

```
  Kazuma Sasaki, Satoshi Iizuka, Edgar Simo-Serra, and Hiroshi Ishikawa.
  "Joint Gap Detection and Inpainting of Line Drawings".
  IEEE Conference on Computer Vision and Pattern Recognition (CVPR), 2017.
```

We propose a data-driven approach for detecting and completing the missing
regions in images of line drawings using a deep convolutional neural network.
Our method automatically detects gaps and completes them with correct thickness
and curvature without any user interaction.

See our [project page](http://hi.cs.waseda.ac.jp/~iizuka/projects/inpainting/) for more detailed information.

## License
```
  Copyright (C) <2017> <Kazuma Sasaki, Satoshi Iizuka, Edgar Simo-Serra, Hiroshi Ishikawa>

  This work is licensed under the Creative Commons
  Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy
  of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or
  send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
  
  Kazuma Sasaki, Waseda University
  milky_kaid.lc@ruri.waseda.jp
  Satoshi Iizuka, Waseda University
  iizuka@aoni.waseda.jp, http://hi.cs.waseda.ac.jp/~iizuka/index_eng.html
  Edgar Simo-Serra, Waseda University
  esimo@aoni.waseda.jp, http://hi.cs.waseda.ac.jp/~esimo/ 
```

## Dependencies

- [Torch7](http://torch.ch/docs/getting-started.html)
- [nn](https://github.com/torch/nn)
- [image](https://github.com/torch/image)

## Usage

First, download the inpainting model by running the download script:

```
./download_model.sh
```

Basic usage is:

```
th main.lua --input <input_image_path> [ --output <output_image_path> ]
```

For example:

```
th main.lua --input samples/eval2.png
```

### Notes
- This is developed on a linux machine running Ubuntu 16.04 during late 2016.
- Please note that the model is slow on large images and may run out of memory. 
- Provided model is under a non-commercial creative commons license.


## Citing

If you use this code please cite:

```
 @InProceedings{SasakiCVPR2017,
  author = {Kazuma Sasaki and Satoshi Iizuka and Edgar Simo-Serra and Hiroshi Ishikawa},
  title = {{Joint Gap Detection and Inpainting of Line Drawings}},
  booktitle = "Proceedings of the Conference on Computer Vision and Pattern Recognition (CVPR)",
  year = 2017,
}
```
