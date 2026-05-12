#Shows or changes the default file permissions for new files and directories.
umask
#Creates a new empty file
touch
#Creates a new directory
mkdir 
#Updates the package list from the repositories.
apt-get update
#Upgrades installed packages to newer versions.
apt updgrade
#Installs the ACL package for advanced permissions management.
apt-get install acl
#Changes the owner of the current directory and all its contents to the current user.
chown -R $(whoami).
#Removes all ACL permissions from the current directory and its contents recursively.
setfacl -bnR .
#Sets very restrictive default permissions for new files and directories.
#Only the owner can read, write, and access them. Other users have no permissions.
umask 077
#Creates a new empty file called secreto.txt.
touch secreto.txt
#Creates a new directory called privado.
mkdir privado 
#Displays files and directories in a long format, including permissions, owner, size, and modification date.
ls -l
#Sets default permissions so the owner can write files, while group members and other users can only read them.
umask 022
#Shows the name of the current user.
whoami
#Writes the text "Hola" into a file called mi_archivo. If the file does not exist, it creates it.
echo "Hola" > mi_archivo
#Displays detailed information about mi_archivo, including permissions, owner, size, and modification date.
ls -l mi_archivo
#Creates a new user called luna, creates a home directory for the user (-m), and sets /usr/bin/zsh as the default shell.
useradd -m -s /usr/bin/zsh luna
#Changes the owner of mi_archivo to the user luna.
chown luna mi_archivo
#Displays the groups of the current user.
groups
#Creates a new group called grupo_test.
groupadd grupo_test
#Shows the content of the system group file.
cat /etc/group
#Creates a new empty file called comun.
touch comun 
#Displays detailed information about the file comun.
ls -l comun
#Modify the user luna and add it to the grupo_test group without removing its other groups
usermod -a -G grupo_test luna
#Check which groups the user luna belongs to
groups luna
#Display detailed information and permissions of the file comun
ls -l comun
#