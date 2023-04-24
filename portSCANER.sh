#!/bin/bash

# Define the target website
target="google.com"

# Check if the website is up using ping
if ping -c 1 $target &> /dev/null
then
    echo "Website is up, scanning ports..."
    # Scan the ports using Nmap and save the output to a file
    nmap -p- $target > nmap_output.txt
    
    # Display the open ports in the terminal
    echo "Open ports:"
    grep -E '^[0-9]+/tcp' nmap_output.txt | cut -d '/' -f 1 | tr '\n' ' '
else
    echo "Website is down"
fi
