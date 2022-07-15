#!/bin/bash
#
#  Define the starting search point:
#
while IFS= read -r -d $'\0' file ; do {
  DIR=$(dirname "$file")
  if [ ! -d "$DIR/converted" ]
     then
     mkdir "$DIR/converted"
  fi
  ORIGINAL=`basename "$file" .mp4`
  NEWNAME=${ORIGINAL}.mp4

  ffmpeg -y -i "$file" -b:v 42000k -c:v libx264 -pass 1 -preset fast -an "$DIR/converted/$NEWNAME" </dev/null
  ffmpeg -y -i "$file" -b:v 42000k -c:v libx264 -pass 2 -preset fast -c:a aac -b:a 384k "$DIR/converted/$NEWNAME" </dev/null
};
done < <(find "./" -not -type d -maxdepth 1 -iname "*.mp4" -print0)
