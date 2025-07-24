#!/usr/bin/bash
for FILE in *.dng
do
   PREFIX=$(echo $FILE | cut -d"." -f1)
   echo $FILE
   echo $PREFIX.png
   dcraw -c -w -6 $FILE | convert - $PREFIX.png
done
