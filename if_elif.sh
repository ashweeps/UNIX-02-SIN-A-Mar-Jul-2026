#!/bin/bash

#Stores the first argument provided by the user in the USER_INPUT variable.
USER_INPUT="${1}"

#1
#Checks if the user did not provide any argument.
if [[ -z "${USER_INPUT}" ]]; then

#Prints an error message when the argument is missing.
echo "You must provide an argument!"

#Stops the script with exit code 1, meaning there was an error.
exit 1

#Ends the first if condition.
fi

#2
#Checks if the argument provided by the user is a regular file.
if [[ -f "${USER_INPUT}" ]]; then

#Prints a message saying the argument is a file.
echo "${USER_INPUT} is a file."
echo "Hola"
#3
#If it is not a file, checks if the argument is a directory.
elif [[ -d "${USER_INPUT}" ]]; then

#Prints a message saying the argument is a directory.
echo "${USER_INPUT} is a directory."

#Runs this block if the argument is not a file and not a directory.
else

#4
#Prints a message saying the argument is neither a file nor a directory.
echo "${USER_INPUT} is not a file or a directory."

#Ends the second if condition.
fi