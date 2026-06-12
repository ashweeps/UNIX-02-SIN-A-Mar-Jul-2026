#!/bin/bash

#Starts a for loop that goes through every file whose name begins with example_file.
for file in example_file*; do

#Checks if the current file is named example_file1.
if [[ "${file}" == "example_file1" ]]; then

#Prints a message saying the first file will be skipped.
echo "Skipping the first file"

#Skips the rest of the loop for example_file1 and moves to the next file.
continue

#Ends the if condition.
fi

#Writes a random number into the current file.
echo "${RANDOM}" > "${file}"

#Ends the for loop.
done