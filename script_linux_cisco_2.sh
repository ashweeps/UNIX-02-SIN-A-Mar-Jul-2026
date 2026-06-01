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

#This command copies the passwd file from the /etc directory into the current directory. The dot . means the current folder.
cp /etc/passwd .
#This command searches for the word sysadmin inside the passwd file. If the word exists, Linux shows the matching line.
grep sysadmin passwd
#The basic characteristics of regular expressions:
#This symbol matches any single character.
.
#This symbol matches any character included inside the brackets.
[ ]
#This symbol matches any character except the character included after the ^ symbol.
[^ ]
#This symbol matches zero or more repetitions of the previous character.
*
#This symbol matches the beginning of a line when it is placed at the start of the pattern. If it is not at the beginning, Linux treats it as a normal ^ character.
^
#This symbol matches the end of a line when it is placed at the end of the pattern. If it is not at the end, Linux treats it as a normal $ character.
$
#Extended regular expressions, which must be used with the egrep command or the -E option with the grep command
#This symbol matches one or more repetitions of the previous pattern.
+
#This symbol makes the previous pattern optional.
?
#This symbol specifies a minimum number, maximum number, or exact number of matches for the previous pattern.
{ }
#This symbol works as a logical OR. It matches one pattern or another pattern.
|
#These symbols create a group inside the regular expression. They help combine patterns and apply rules to the whole group.
( )

#This command adds a new user line to the passwd file. The symbol >> appends the text at the end of the file without deleting previous content.
echo "sysadmin:x:1001:1001:System Administrator:/home/sysadmin:/bin/bash" >> passwd
#This command searches for the word sysadmin inside the passwd file. It shows the line where this word appears.
grep sysadmin passwd
#This command searches for the exact word root inside the passwd file.
grep 'root' passwd
#This command searches for lines in /etc/passwd that start with root. The symbol ^ means beginning of the line.
grep '^root' /etc/passwd
#This command displays the content of the file alpha-first.txt.
cat alpha-first.txt
#This command searches for lines that end with the letter r. The symbol $ means end of the line.
grep 'r$' alpha-first.txt
#This command displays the content of the file red.txt.
cat red.txt
#This command searches for words or lines with r, then any two characters, and then f. The dot . represents any single character.
grep 'r..f' red.txt
#This command searches for words or lines with r, then any two characters, and then d.
grep 'r..d' red.txt
#This command searches for lines with at least four characters. Each dot represents one character.
grep '....' red.txt
#This command searches inside /etc/passwd for text with r, then any two characters, and then t.
grep 'r..t' /etc/passwd
#This command displays the content of the file profile.txt.
cat profile.txt
#This command searches for lines that contain at least one number from 0 to 9.
grep '[0-9]' profile.txt
#This command searches for lines that contain at least one character that is not a number. The symbol ^ inside brackets means not.
grep '[^0-9]' profile.txt
#This command searches for a real dot character. The brackets make the dot literal, so it does not mean any character.
grep '[.]' profile.txt
#This command displays the content of the file red.txt again.
cat red.txt
#This command searches for words or lines with r, followed by zero or more e characters, and then d. It matches patterns such as rd, red, reed, or reeed.
grep 're*d' red.txt
#This command searches for words or lines with r, followed by zero or more o or e characters, and then d. It matches patterns such as rd, rod, red, rood, or reed.
grep 'r[oe]*d' red.txt
#This command searches for zero or more z characters. Because zero matches are valid, it may match many lines.
grep 'z*' red.txt
#This command searches for zero or more e characters. Because zero matches are valid, it may match many lines.
grep 'e*' red.txt
#This command searches for one or more e characters. The first e is required, and e* means zero or more extra e characters.
grep 'ee*' red.txt
#It searches for the word red, but no file name was given. Linux will wait for text input from the keyboard.
grep 'red'
#This command moves the terminal to the user’s home directory.
cd ~

#This command switches to the root user account. The dash - loads the root user environment.
su -
#This command shuts down the system immediately. It needs root permissions.
shutdown now
#This command shows the current date and time of the system.
date
#This command tries to schedule a shutdown at 02:60. This is incorrect because minutes only go from 00 to 59.
shutdown 02:60
#Shutdown in 1 minute and shows the message Goodbye World! to logged-in users.
shutdown +1 "Goodbye World!"

#This command shows the network configuration of the system. It displays information such as the IP address, network interfaces, and connection status.
ifconfig
#This command sends 4 test packets to the IP address 192.168.1.2. It checks if the computer can reach that device through the network. The option -c 4 limits the test to 4 packets.
ping -c 4 192.168.1.2
# This command sends 4 test packets to the IP address 192.168.1.3. It checks if there is network communication with that device. The option -c 4 stops the command after 4 packets.
ping -c 4 192.168.1.3

#This command shows the processes running in the current terminal session. It displays basic information such as process ID, terminal, CPU time, and command name.
ps
#This command shows all processes running on the system.The option -e means every process.
ps -e
#This command shows all processes with full details. The option -e shows every process. The option -f shows the full format, including user, process ID, parent process ID, start time, and command.
ps -ef

#This command updates the local package list from the software repositories. It helps the system know which packages and versions are available.
sudo apt-get update
#This command searches for packages related to the word cow. It helps find the cowsay package before installing it.
apt-cache search cow
#The sudo command gives administrator permissions to install software.
sudo apt-get install cowsay
#This command runs the cowsay program.It shows the text NDG Linux Unhatched inside a speech bubble with a cow.
cowsay 'NDG Linux Unhatched'
#Updates the package list again. It refreshes the information from the repositories.
sudo apt-get update
#upgrades installed packages to newer versions.
sudo apt-get upgrade
#Removes cowsay from the system. The purge option removes the package and its configuration files.
sudo apt-get purge cowsay

#Changes the password of the current user.
passwd
#Shows the password status for the sysadmin user. In my case, the user is codespace.
passwd -S sysadmin
#Switches to the root user account.
su root
#Changes the password of the sysadmin user from the root account.
passwd sysadmin
#Closes the current root session and returns to the previous user.
exit

#Lists the contents of the Documents directory.
ls Documents
#Lists the contents of the current directory.
ls
#Tries to list fakefile. It should show an error because the file does not exist.
ls fakefile
#Displays the content of the file food.txt in the terminal.
cat food.txt
#Redirects the output of food.txt into newfile1.txt and creates or overwrites the file.
cat food.txt > newfile1.txt
#Displays the content of newfile1.txt to check the redirected output.
cat newfile1.txt
#Prints the word Hello in the terminal.
echo "Hello"
#Overwrites newfile1.txt with the text I like food.
echo "I like food." > newfile1.txt
#Displays newfile1.txt to verify its new content.
cat newfile1.txt
#Appends the text This food is good. to the end of newfile1.txt.
echo "This food is good." >> newfile1.txt
#Displays newfile1.txt to verify the appended content.
cat newfile1.txt

#Opens or creates the file newfile.txt using the vi editor.
vi newfile.txt
#Moves one character to the left in vi command mode.
h
#Moves one line down in vi command mode.
j
#Moves one line up in vi command mode.
k
#Moves one character to the right in vi command mode.
l
#Moves one word forward in vi command mode.
w
#Moves one word backward in vi command mode.
b
#Moves to the beginning of the current line.
^
#Moves to the end of the current line.
$

#cut (delete)
d
#copy (yank)
y
#paste (put)
p | P

#Deletes the current line in vi.
dd
#Deletes three lines starting from the current line.
3dd
#Deletes the current word in vi.
dw
##Deletes three words starting from the current cursor position in vi.
d3w
#Deletes four characters to the left of the cursor in vi.
d4h
#Changes the current line and enters insert mode in vi.
cc
#Changes the current word and enters insert mode.
cw
#Changes three words starting from the current cursor position and enters insert mode in vi.
c3w
#Changes five characters to the left of the cursor and enters insert mode in vi.
c5h
#Copies the current line into the buffer.
yy
#Copies three lines into the buffer.
3yy
#Copies the current word into the buffer in vi.
yw
#Copies the text from the cursor to the end of the current line in vi.
y$
#Pastes the copied or deleted text after the cursor.
p
#Pastes the copied or deleted text before the cursor.
P
#Searches forward for a word or pattern in vi.
/word
#Moves to the next search result.
n
#Moves to the previous search result.
N
#Searches backward for a word or pattern in vi.
?word
#Enters insert mode after the cursor.
a
#Enters insert mode at the end of the line.
A
#Enters insert mode before the cursor.
i
#Enters insert mode at the beginning of the line.
I
#Opens a new line below and enters insert mode.
o
#Opens a new line above and enters insert mode.
O
#Saves the current file in vi.
:w
#Saves the file with another name.
:w filename
#Forces the file to save.
:w!
#Goes to the first line of the file.
:1
#Opens another file in vi.
:e filename
#Quits vi if there are no changes.
:q
#Quits vi without saving changes.
:q!
#Saves and quits vi.
:wq
#Saves and quits vi from command mode.
ZZ
