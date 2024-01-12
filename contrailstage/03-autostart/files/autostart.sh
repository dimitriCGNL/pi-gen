#!/bin/bash

while true; do
    # Run Python server
    # Note: change 'contailpi' to the username set in the config file
    python3 "/home/contrailpi/Raspberry_Pi_contrail/server.py" &
    SERVER_PID=$!

    # Run TypeScript Node
    # Note: change 'contailpi' to the username set in the config file
    npx ts-node /home/contrailpi/Raspberry_Pi_contrail/Firebase.ts &
    TS_NODE_PID=$!

    # Wait for either process to exit
    wait $SERVER_PID $TS_NODE_PID

    # If one process exits, kill the other
    if ps -p $SERVER_PID > /dev/null; then
        kill $SERVER_PID
    elif ps -p $TS_NODE_PID > /dev/null; then
        kill $TS_NODE_PID
    fi

    # Wait for processes to be killed
    wait $SERVER_PID 2>/dev/null
    wait $TS_NODE_PID 2>/dev/null

    # Sleep for a moment before restarting
    sleep 1
done
