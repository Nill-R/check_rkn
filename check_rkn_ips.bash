
#!/bin/bash
IP=`curl -s -X POST -d '["198.51.100.1", "198.51.100.43"]' http://localhost:9999/check_ips|jq . |grep true|awk '{ print $1 }'|tr -d '"'|tr -d ':'`
if [ -n "$IP" ]; then
        telegram-send "$IP in RKN blacklist"
   else
        exit 0
fi
