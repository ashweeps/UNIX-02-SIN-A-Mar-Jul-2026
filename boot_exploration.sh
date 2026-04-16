#Shows all files in the directory, including hidden ones.
#It does the same thing as ls -a, it's the long form of the command
ls -a = ls -all
#It displays file sizes in a readable format, for example: KB, MB, GB.
ls -h
#It displays a detailed list of all files, including hidden ones with sizes in a readable format.
ls -l -a -h
#It displays all files in the directory, including hidden ones, in list format, with detailed information such as permissions, size, and date, using easy-to-read formats. It's the same as the previous command.
ls -lah
#Create a directory called -rf. The -- indicates that what follows is a name and not an option.
mkdir -- -rf
#Removes a directory named -rf (only works if it is empty).
rmdir -- -rf
#It shows the help for the ls command, with all its options and how to use them.
ls --help
#Open the complete manual for the ls command, with its description, options, and detailed usage.
man ls
