#!/bin/bash

#Stores the first argument in the NAME variable.
#This value identifies the test name, for example mysite.
NAME="${1}"

#Stores the second argument in the DOMAIN variable.
#This value is the domain or host that the script will ping.
DOMAIN="${2}"

#Stores the name of the CSV file where the result will be saved.
OUTPUT_FILE="results.csv"

#Checks if NAME or DOMAIN is empty.
#The -z test returns true when a variable has no value.
#The || operator means OR, so the error runs if either argument is missing.
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then

#Prints an error message explaining that the script needs two arguments.
echo "You must provide two arguments to this script."

#Shows an example of the correct way to run the script.
#${0} represents the script name.
echo "Example: ${0} mysite nostarch.com"

#Stops the script with exit code 1.
#Exit code 1 means the script failed because something was wrong.
exit 1

#Ends the argument validation condition.
fi

#Writes the CSV header into results.csv.
#The > symbol creates the file or overwrites it if it already exists.
echo "status,name,domain,timestamp" > "${OUTPUT_FILE}"

#Runs ping one time against the domain.
#The -c 1 option sends only one ping packet.
#The &> /dev/null part hides both normal output and error output.
#If ping succeeds, the then block runs.
if ping -c 1 "${DOMAIN}" &> /dev/null; then

#Writes a success row into the CSV file.
#The >> symbol appends the line without deleting the header.
#$(date) inserts the current date and time.
echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"

#Runs this block if the ping command fails.
else

#Writes a failure row into the CSV file.
#This saves the test even when the domain does not respond.
echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"

#Ends the ping condition.
fi

sleep 100
