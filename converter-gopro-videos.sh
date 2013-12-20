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

 ffmpeg -y -i "$file" -r 30000/1001 -threads 4 -b:v 4500K -bt 5000K -vcodec libx264 -filter:v yadif -pass 1 -preset fast -an "$DIR/converted/$NEWNAME" </dev/null
 ffmpeg -y -i "$file" -r 30000/1001 -threads 4 -b:v 4500K -bt 5000K -vcodec libx264 -filter:v yadif -pass 2 -preset fast -acodec libfaac -ac 2 -ar 48000 -ab 192k "$DIR/converted/$NEWNAME"  </dev/null
done < <(find $start \( -iname \*.mp4 \))
