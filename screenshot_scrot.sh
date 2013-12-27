DATE=`date +%F`
mkdir -p /home/rafael/.screenshots/$DATE
env DISPLAY=:0  scrot -z /home/rafael/.screenshots/$DATE/%T.png > /home/rafael/.screenshots/log.txt
env DISPLAY=:0  scrot -z -d 20 /home/rafael/.screenshots/$DATE/%T.png > /home/rafael/.screenshots/log.txt
env DISPLAY=:0  scrot -z -d 40 /home/rafael/.screenshots/$DATE/%T.png > /home/rafael/.screenshots/log.txt
