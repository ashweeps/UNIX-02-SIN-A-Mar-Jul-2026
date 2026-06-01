#This command moves the terminal to the user’s home directory and the symbol ~ represents the home folder of the current user.
cd ~
#This command creates a file called swapex inside the /tmp directory. It uses /dev/zero as the input source, which generates empty data. The option bs=1M sets the block size to 1 megabyte. The option count=50 writes 50 blocks. As a result, the command creates a 50 MB file.
dd if=/dev/zero of=/tmp/swapex bs=1M count=50

#This command moves the terminal to the Documents directory inside the user’s home folder.
cd ~/Documents
#This command moves the file people.csv into the Work folder.
mv people.csv Work
#This command lists the contents of the Work folder to check if the file was moved correctly.
ls Work
#This command moves three files, numbers.txt, letters.txt, and alpha.txt, into the School folder.
mv numbers.txt letters.txt alpha.txt School
#This command lists the contents of the School folder to check if the files were moved correctly.
ls School
#This command lists the contents of the current directory. It helps verify which files and folders are still there.
ls
#This command renames the file animals.txt to zoo.txt.
mv animals.txt zoo.txt
#This command creates an empty text file named linux.txt.
touch linux.txt
#This command deletes the file linux.txt from the current directory.
rm linux.txt
#This command tries to list the file linux.txt. Since the file was deleted, Linux should show an error saying the file does not exist.
ls linux.txt
#This command deletes the Work folder and everything inside it. The option -r means recursive, so it removes the folder with its contents.
rm -r Work
#This command tries to list the Work folder. Since the folder was deleted, Linux should show an error saying the directory does not exist.
ls Work