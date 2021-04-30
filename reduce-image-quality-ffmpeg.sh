# Reduce image quality
mkdir processed; for f in ./*.jpg; do ffmpeg -i "$f" -q:v 10 "processed/$f"; done
