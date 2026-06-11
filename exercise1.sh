#!/bin/bash
#Defines the file as a Bash script.
#!/bin/bash

#Stores the first argument in the FIRST_NAME variable.
FIRST_NAME="${1}"

#Stores the second argument in the LAST_NAME variable.
LAST_NAME="${2}"

#Creates an empty file named output.txt.
touch output.txt

#Writes the current date into output.txt using day-month-year format.
date +"%d-%m-%Y" > output.txt

#Adds the first name and last name to the end of output.txt.
echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt

#Copies output.txt into a backup file named backup.txt.
cp output.txt backup.txt

#Displays the content of output.txt.
cat output.txt

#To run our script
chmod u+x exercise1.sh

# ./exercise1.sh Ashley Espinoza
# This command starts the script and sends "Ashley" and "Espinoza" as input values.

