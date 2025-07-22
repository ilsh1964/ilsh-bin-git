#!/bin/bash
# Configured Custom Action: ~/.bin/stamper-copy.sh %f  "%n" 

TS="$(date +"%Y-%m-%d_%H-%M-%S")"

for f in "$@"
do

   dir=$(dirname "$f")
   fullfilename=$(basename "$f")
   extension="${fullfilename##*.}"
   filename="${fullfilename%.*}"

   # append timestamp
   cp "$f" "$dir/$filename-$TS.$extension"

   # prepend timestamp
   # cp "$f" "$dir/$TS-$filename.$extension"

done

exit 0