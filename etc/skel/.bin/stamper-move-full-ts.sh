#!/bin/bash
# Configured Custom Action: ~/.bin/stamper-move.sh %f  "%n" 

TS="$(date +"%Y-%m-%d_%H-%M-%S")"

for f in "$@"
do

   dir=$(dirname "$f")
   fullfilename=$(basename "$f")
   extension="${fullfilename##*.}"
   filename="${fullfilename%.*}"

   # append timestamp
   mv "$f" "$dir/$filename-$TS.$extension"

   # prepend timestamp
   # mv "$f" "$dir/$TS-$filename.$extension"

done

exit 0