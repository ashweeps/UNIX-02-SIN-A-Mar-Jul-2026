#Defines the file as a Bash script.
#!/bin/bash

#Stores the first argument provided by the user in the IP_ADDRESS variable.
IP_ADDRESS="${1}"

#Starts a case statement to compare the IP_ADDRESS value against different patterns.
case ${IP_ADDRESS} in

#Checks if the IP address starts with 192.168.
192.168.*)

#Prints this message when the IP belongs to the 192.168.x.x network.
echo "Network is 192.168.x.x"

#Ends this case option.
;;

#Checks if the IP address starts with 10.0.
10.0.*)

#Prints this message when the IP belongs to the 10.0.x.x network.
echo "Network is 10.0.x.x"

#Ends this case option.
;;

#Matches any other IP address that did not match the previous patterns.
*)

#Prints this message when the network cannot be identified.
echo "Could not identify the network"

#Ends the default case option.
;;

#Ends the case statement.
esac

#Runs the script using an IP address from the 192.168.x.x network.
bash case_ip_address_check.sh 192.168.1.25

#Runs the script using an IP address from the 10.0.x.x network.
bash case_ip_address_check.sh 10.0.5.10

#Runs the script using a localhost IP address. It does not match 192.168 or 10.0.
bash case_ip_address_check.sh 127.0.0.1

#Runs the script using a public DNS IP address. It does not match 192.168 or 10.0.
bash case_ip_address_check.sh 8.8.8.8