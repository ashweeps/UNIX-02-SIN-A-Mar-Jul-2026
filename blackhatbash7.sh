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

head log.txt
awk 'NR < 10' log.txt

grep "42.236.10.117" log.txt 
awk '{print $7}' log.txt 
grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/Mozilla/Godzilla/g' log.txt
grep "Mozilla" log.txt
grep "Godzilla" log.txt

sed '1d' newlog.txtI
sed -i '1d' newlog.txt
diff log.txt newlog.txt

sed '37d' newlog.txtI
sed -i '37d' newlog.txt
diff log.txt newlog.txt

sed 's/ //g' log.txt > newlog1.txt
sed '8,10d' newlog1.txt
sed -n '10,15 p' log.txt

sleep 300 &
jobs
fg %1
bg %1

nohup ./exercise_solution.sh mysite google.com > nohup.out 2>&1 &
#Runs the script in the background and saves normal output and errors in nohup.out.
pgrep -af exercise_solution.sh
#Checks if exercise_solution.sh is still running and shows the full process command.
cat nohup.out
cat results.csv
