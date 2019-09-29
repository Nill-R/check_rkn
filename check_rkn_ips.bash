#!/bin/bash

IP1='"104.31.93.48", "104.31.92.48"'
IP2='"18.130.154.47"'
HOST=`hostname`
DATE=`date`
IP=`curl -s -X POST -d "[$IP1,$IP2]" http://localhost:9999/check_ips|jq . |grep true|awk '{ print $1 }'|tr -d '"'|tr -d ':'`

if [ -n "$IP" ]; then
        printf "$IP\n Is in RKN blacklist\n Sending by telegram-send from host $HOST \n $DATE" |telegram-send --stdin
   else
        exit 0
fi
