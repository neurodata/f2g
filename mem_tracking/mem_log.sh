#!/bin/bash -e

while true; do
    echo "$(free -m | grep cache: | sed 's/-\/+ buffers\/cache://g')"
    sleep 1
done
