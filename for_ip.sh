#!/bin/bash
for ip_address in "$@"; do
 echo "Taking some action on IP address ${ip_address}"
 ping -c 1 "${ip_address}"
done
##Runs the for_ip.sh script and passes three loopback IP addresses as arguments.
#./for_ip.sh 127.0.0.1 127.1.1.1 127.10.10.10
