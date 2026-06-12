#!/bin/bash

#Stores the file name output1.txt in the FILE variable.
FILE="output1.txt"

#Creates output1.txt if it does not exist.
touch "${FILE}"

#Starts an until loop that keeps running while output1.txt is empty.
until [[ -s "${FILE}" ]]; do

#Prints a message saying the file is still empty.
echo "${FILE} is empty..."

#Prints a message saying the script will check again after 2 seconds.
echo "Checking again in 2 seconds..."

#Pauses the script for 2 seconds before checking again.
sleep 2

#Ends the until loop.
done

#Prints this message when output1.txt has content.
echo "${FILE} appears to have some content in it!"

#Runs the until_loop.sh script from the terminal.
bash until_loop.sh

#Writes the text listo into output1.txt so the until loop can stop.
echo "listo" > output1.txt
