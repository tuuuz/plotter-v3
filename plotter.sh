#!/bin/bash

FARMERKEY=$1
POOLKEY=$2
#echo $FARMERKEY,$POOLKEY

while [ ! -f /root/stoprun ]
do
  rm /tmp/*.tmp
  /root/chia-plotter/build/chia_plot -n 1 -r 4 -t /tmp/ -d /plots/ -p ${POOLKEY} -f ${FARMERKEY}
done
rm -f /root/stoprun
echo Stopfile found, exiting
