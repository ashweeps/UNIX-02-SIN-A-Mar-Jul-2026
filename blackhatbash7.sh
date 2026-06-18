#!/bin/bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt
ps | grep TTY
ps | grep -i tty
grep -v "35.237.4.214" log.txt
grep -o "35.237.4.214" log.txt

awk '{print $1}' log.txt
cat log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt
awk '{print $1,$NF}' log.txt

touch example_csv.txt
#Creates the CSV file and writes each comma-separated line into it.
echo "Hola,Ashley,cami" > example_csv.txt

#Adds the first data line to the CSV file.
echo "Taylor,Swift,Quito" >> example_csv.txt

#Adds the second data line to the CSV file.
echo "Holaa,Ashley,Pau" >> example_csv.txt

awk -F',' '{print $1}' example_csv.txt