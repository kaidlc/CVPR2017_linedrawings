#!/bin/bash

# md5sum dd26e0e243259cce0f8d1cefacef34f6
# sha1sum 
FILENAME="cvpr2017_linedrawings.t7"
FILEURL="http://hi.cs.waseda.ac.jp/~sasaki/data/cvpr2017_linedrawings.t7"
FILEMD5="7834cfac30dc10b7cec78bfc28989114"

echo "Downloading the inpainting model (44M)..."
wget --continue -O "$FILENAME" -- "$FILEURL"

echo "Checking integrity (md5sum)..."
OS=`uname -s`
if [ "$OS" = "Darwin" ]; then
  CHECKSUM=`cat $FILENAME | md5`
  else
  CHECKSUM=`md5sum $FILENAME | awk '{ print $1 }'`
fi

if [ "$CHECKSUM" != "$FILEMD5" ]; then
  echo "Integrity check failed. File is corrupt!"
  echo "Try running this script again and if it fails remove '$FILENAME' before trying again."
  exit 1
fi 
echo -e "Download finished successfully!"
