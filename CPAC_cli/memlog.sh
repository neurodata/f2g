# written by eric bridgeford

while true; do
    echo "$(free -m | grep buffers/cache | awk '{print $3}')"
    sleep 1
done

