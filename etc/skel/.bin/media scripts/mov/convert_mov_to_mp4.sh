#!/usr/bin/bash
for FILE in *.mov
do
   PREFIX=$(echo $FILE | cut -d"." -f1)
   ffmpeg -i $FILE -vcodec libx264 -crf 23 -preset slow -acodec aac -b:a 192k -movflags +faststart $PREFIX.mp4
done
