#!/bin/bash 
#Shows active processes in real time, including CPU and memory usage.
top
#Runs the top command in the background, so the terminal stays available for other commands.
top &
touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "El comando lzl falló"
echo "Hello World!" > output.txt
cat output.txt
cho "Chao mundo!" > output.txt
cat output.tx
echo "Chao chao!">> output.txt
cat output.txt
ls -l / &> stdout_and_stderr.txt
cat stdout_and_stderr.txt
ls -l / &>> stdout_and_stderr.txt
ls -l / 1> stdout.txt 2> stderr.txt
lzl 2> error.txt
cat error.txt
cat < output.txt
cat << EOF 
Black Hat Bash 
by No Starch Press
EOF