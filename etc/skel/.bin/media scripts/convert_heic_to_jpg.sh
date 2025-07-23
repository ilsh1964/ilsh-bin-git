#!/usr/bin/bash
for FILE in *.heic
do
   PREFIX=$(echo $FILE | cut -d"." -f1)
   magick $FILE $PREFIX.jpg
done
