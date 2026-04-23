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
/ #para buscar (ejemplo: /clone)
l #para ir hacia adelante
L #para ir hacia atras 
#Open the complete manual for the git clone command, with its description, options, and how to use it.
man git-clone
#Creates a shallow clone with the history limited to the specified number of commits. This implies `--single-branch` unless `--no-single-branch` is used to obtain histories closer to the branches. If you want to shallow clone submodules, you can also use `--shallow-submodules`.
--depth
u #users
g #group
o #others 
r #read
w #write
x #excute 
# - = means its a archive 1) rw - Owner permissions 2) rw - Group permissions 3) rw - Other user permissions
-rw-rw-rw-
#creates an empty file named script.sh.
touch script.sh
#gives execute permission to everyone.
chmod +x script.sh
#gives execute permission only to the owner
chmod u+x script.sh
#removes read permission for others.
chmod o-r secreto.txt
#the owner can read and write; group and others have no permissions.
chmod u+rw,go-rwx privado
#tries to write to a protected file, but may fail because the redirection (>) does not use sudo.
sudo echo "holaa" > /etc/archivo_protegido
#correctly writes to a protected file using administrator permissions.
echo "holaa" | sudo tee /etc/archivo_protegido > /dev/null
#lists the files in the /etc directory.
ls /etc
#displays the content of the file.
cat /etc/archivo_protegido
#Run as administrator a command that appends the text "chao" to the file
sudo sh -c 'echo "chao" >> /etc/archivo_protegido' 
#Displays the contents of the file with the "chao" on the screen.
cat /etc/archivo_protegido
