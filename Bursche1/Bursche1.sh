#!/bin/bash
# Program name: pingall.sh
# Author: Tyler Nelson

##############################################################
# Set variables for color                                    #
##############################################################

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

##############################################################
# Print program header and date                              #
##############################################################

sleep 1
printf "\nPinging all hosts in hosts.txt and storing results in online.txt and offline.txt...\n\n"
sleep 1
date
# Versuch Uhrzeit in online.txt einzufügen... date >> online.txt
# Versuch Uhrzeit in offline.txteinzufügen... date >> offline.txt
# Das funktionierte zwar, war aber unübersichtlich und unpraktisch da ständig 2 Datein betrachtet werden mussten.

printf "\n"
sleep 1

##############################################################
# Begin loop                                                 #
##############################################################

cat ./hosts.txt | sort | while read output
do
  ping -c 1 "$output" &> /dev/null
  if [ $? -eq 0 ]; then
  printf "%-20s %s\n" $output [${GREEN}ONLINE${NORMAL}]
  printf "$output\n" >> /home/Logfiles/bursche1_online.txt


  else
  printf "%-20s %s\n" $output [${RED}OFFLINE${NORMAL}]
  printf "$output\n" >> /home/Logfiles/bursche1_offline.txt

  #printf "%-20s %s\n" $output `grep 'Serial Number: ' ./Computers/$output.txt | sed 's/Serial Number: //g'` >> ./home/Logfiles/bursche1_offline.txt
  fi
done

printf "\n"
sleep 1
# printf "Don't forget to delete online.txt and offline.txt before running the script again.\n\n"
