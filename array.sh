#!/bin/bash 
# Sets an array 
IP_ADDRESSES=(192.168.1.1 192.168.1.2 192.168.1.3) 
# Prints all elements in the array 
echo "${IP_ADDRESSES[*]}" 
# Prints only the first element in the array 
echo "${IP_ADDRESSES[0]}"
# Delete the second IP address from the array
unset IP_ADDRESSES[1]
# Print all elements in the array
echo "${IP_ADDRESSES[*]}"
# Replace the first IP address with a new value
IP_ADDRESSES[0]="192.168.1.10"
# Print all elements in the array
echo "${IP_ADDRESSES[*]}"
# Print only the first element in the array
echo "${IP_ADDRESSES[0]}"