#!/bin/sh
TRANSMISSION_BIN="/storage/.kodi/addons/service.downloadmanager.transmission/bin/transmission-remote"
TORRENTLIST=`$TRANSMISSION_BIN --list | awk '{print $1}' | grep '[0-9]' | tr -d '*'`
DATE=""`date "+%Y-%m-%d %H:%M:%S"`

echo "$DATE >> Starting running..."
for TORRENTID in $TORRENTLIST; do
  echo "* Torrent ID $TORRENTID: Verifing..."

  DL_COMPLETED=`$TRANSMISSION_BIN --torrent $TORRENTID --info | grep "Percent Done: 100%"`
  STATE_STOPPED=`$TRANSMISSION_BIN --torrent $TORRENTID --info | grep "State: Stopped\|Finished\|Idle"`

  if [ "$DL_COMPLETED" != "" ] && [ "$STATE_STOPPED" != "" ]; then
    $TRANSMISSION_BIN --torrent $TORRENTID --verify >/dev/null 2>&1
    sleep 10
    ERROR=`$TRANSMISSION_BIN --torrent $TORRENTID --info | grep "Error: No data found! Ensure"`

    if [ "$ERROR" != "" ]; then
      echo "Torrent #$TORRENTID is completed and already moved."
      echo "Removing torrent from list."
      $TRANSMISSION_BIN --torrent $TORRENTID --remove >/dev/null 2>&1
    else
      echo "No errors found... Trying to start it..."
      $TRANSMISSION_BIN --torrent $TORRENTID --start >/dev/null 2>&1
    fi
  else
    echo "Torrent #$TORRENTID is not completed. Ignoring."
  fi
  echo "* * * * * * * * * * * * * * * * * * * *"
done
echo "----------------------------------------------------------------------"
