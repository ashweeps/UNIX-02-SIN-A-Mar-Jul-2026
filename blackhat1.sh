#!/usr/bin/env bash
bash --version
env
echo "$SHELL"
echo ${RANDOM} 10601
echo "${OSTYPE}" 
echo ${UID}

#Open the manual page for the ls command
man ls

ls -l 
ls -la
ls --help
ls -a 
mkdir directory1
mkdir directory2 directory3
ps -e -f 
ps -ef

# Run the script in restricted Bash mode
bash -r blackhat1.sh
# Check the script's syntax without running it
bash -n blackhat1.sh
# Run the script, displaying each command before execution
bash -x blackhat1.sh