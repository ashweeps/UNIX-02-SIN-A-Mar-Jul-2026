#!/bin/bash
#Stores the name of the stop file in a variable.
SIGNAL_TO_STOP_FILE="stoploop"

#Starts a while loop that keeps running while the stoploop file does not exist.
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do

#Prints a message saying that the stoploop file has not been created yet.
echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."

#Prints a message saying the script will check again after 2 seconds.
echo "Checking again in 2 seconds..."

#Pauses the script for 2 seconds before repeating the loop.
sleep 2

#Ends the while loop.
done

#Prints this message when the stoploop file is found.
echo "File was found! Exiting..."