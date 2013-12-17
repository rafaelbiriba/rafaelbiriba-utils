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
  if [ ! -d "$DIR/converted" ]
     then
     mkdir "$DIR/converted"
  fi
  ORIGINAL=`basename "$file" .mp4`
  NEWNAME=${ORIGINAL}.mp4

 ffmpeg -y -i "$file" -r 30000/1001 -threads 4 -b:v 3M -bt 4M -vcodec libx264 -filter:v yadif -pass 1 -preset faster -an "$DIR/converted/$NEWNAME" </dev/null
 ffmpeg -y -i "$file" -r 30000/1001 -threads 4 -b:v 3M -bt 4M -vcodec libx264 -filter:v yadif -pass 2 -preset faster -acodec libfaac -ac 2 -ar 48000 -ab 192k "$DIR/converted/$NEWNAME"  </dev/null
done < <(find $start \( -iname \*.mp4 \))
