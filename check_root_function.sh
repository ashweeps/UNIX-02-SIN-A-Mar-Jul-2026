#!/bin/bash

#Explains that the function checks if the current effective user ID is zero.
#EUID means Effective User ID. It identifies the user permissions that the script is using while it runs.
#In Linux, the root user has EUID 0. If EUID is 0, the script is running with administrator privileges.
#This is important because some commands need root permissions to install software, change system files, or manage users.
# This function checks if the current user ID equals zero.

#Creates a function named check_if_root.
check_if_root(){

#Checks if the current Effective User ID is equal to 0.
#The -eq operator compares two numbers.
if [[ "${EUID}" -eq "0" ]]; then

#Returns 0 if the user is root.
#In Bash, return 0 means success or true.
return 0

#Runs this block if the EUID is not 0.
else

#Returns 1 if the user is not root.
#In Bash, return 1 means failure or false.
return 1

#Ends the if condition inside the function.
fi

#Ends the check_if_root function.
}

#Calls the check_if_root function and checks its return value.
#If the function returns 0, the then block runs.
if check_if_root; then

#Prints this message when the script is running as root.
echo "User is root!"

#Runs this block if the function returns 1.
else

#Prints this message when the script is not running as root.
echo "User is not root!"

#Ends the final if condition.
fi