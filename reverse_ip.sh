#!/bin/bash

# Function to reverse an IP address
reverse_ip() {
    echo $1 | awk -F '.' '{print $4"."$3"."$2"."$1}'
}

# Function to handle incoming requests
handle_request() {
    original_ip=$(echo $1 | cut -d' ' -f2)
    reversed_ip=$(reverse_ip $original_ip)
    echo "Reverse IP: $reversed_ip"
}

# Start a simple web server using netcat
while true; do
    # Listen on port 8080 for incoming requests
    nc -l -p 8080 -c 'handle_request "$1"'
done
