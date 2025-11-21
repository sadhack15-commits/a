#!/bin/bash

# Start SSH
service ssh start

# Start web terminal (không cần login)
ttyd -p 10000 -W bash &

# Keep alive - ping mỗi 5 phút để không sleep
while true; do
    curl -s http://localhost:10000 > /dev/null
    sleep 300
done
