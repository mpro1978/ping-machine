#!/bin/bash
# check and log if a host is reachable by ping 
# start im Hintergrund, logt erst nach erneuter Verbindung

#CONFIGURATION

#IP of host
WATCH_IP="192.168.178.66"
#path to logfile
LOGFILE="/home/markus/test/watchip.log"
#duration between pings
PAUSE=3
#how many failed pings before log
TESTS=2

#SCRIPT

#initialize
MISSED=0
touch $LOGFILE

while true; do
  if ! ping -c 1 -w 1 $WATCH_IP > /dev/null; then
    ((MISSED++))
  else
    if [ $MISSED -ge $TESTS ]; then
      echo `date` '-' $WATCH_IP "is up again." >> $LOGFILE;
    fi
    MISSED=0
  fi;
  if [ $MISSED -eq $TESTS ]; then
    echo `date` "-" $WATCH_IP "is down." >> $LOGFILE;
  fi
  sleep $PAUSE;
done
