#!/bin/bash
#
#  Define the starting search point:
#
start="."

#
#  Loop over directories looking for VOB files
#
while read file
do
  DIR=$(dirname "$file")
  if [ ! -d "$DIR/watermark" ]
     then
     mkdir "$DIR/watermark"
  fi  
  ORIGINAL=`basename "$file" .MTS`
  NEWNAME=${ORIGINAL}.mp4
  
 ffmpeg -y -i "$file" -r 30000/1001 -threads 4 -b:v 12M -bt 14M -vcodec libx264 -pass 1 -preset faster -vf "movie=watermark-1280x720.png [watermark]; [in][watermark] overlay=0:0 [out]" -an "$DIR/watermark/$NEWNAME" </dev/null
 ffmpeg -y -i "$file" -r 30000/1001 -threads 4 -b:v 12M -bt 14M -vcodec libx264 -pass 2 -preset faster -vf "movie=watermark-1280x720.png [watermark]; [in][watermark] overlay=0:0 [out]" -acodec libfaac -ac 2 -ar 48000 -ab 192k "$DIR/watermark/$NEWNAME"  </dev/null
done < <(find $start \( -iname \*.MTS \))

