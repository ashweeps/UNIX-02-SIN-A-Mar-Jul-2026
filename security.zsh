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
#Changes the owner and the group associated with a file. This command assigns the file mi_archivo to the user luna and to the group grupo_test, allowing them to manage and access the file according to the assigned permissions.
chown luna:grupo_test mi_archivo
#Displays detailed information about the file, including file permissions, number of links, owner name, group name, file size, and last modification date.
ls -l mi_archivo
#This output indicates that the file mi_archivo has read and write permissions for the owner (luna), read-only permissions for the group (grupo_test) and other users, a file size of 5 bytes, and it was last modified on May 12 at 17:14.
-rw-r--r-- 1 luna grupo_test 5 may 12 17:14 mi_archivo
#*Attempts to execute the `chown` command with administrator privileges using `sudo`. The error appears because the `sudo` command is not installed or available in the current shell environment.**
sudo chown -R luna:grupo_test proyecto
#Changes the owner and group of the directory `proyecto` and all its contents recursively. The option `-R` means that the ownership changes apply to every file and subdirectory inside `proyecto`.**
chown -R luna:grupo_test proyecto
#Displays the contents of the directory `proyecto` recursively, showing all files and subdirectories contained inside it.**
ls -IR proyecto
#This output indicates that inside the directory `proyecto` there is a file named `readme` and a subdirectory named `sub`.**
readme  sub
#View the numeric identity of the current user. User Numeric ID, primary group, secondary groups.
id
#See all system users
cat /etc/passwd | head -10
#Displays the groups associated with the user stored in the variable $Luna.
groups $Luna
#Displays the user ID (UID) of the current user.
id -u
#Displays the primary group ID (GID) of the current user.
id -g
#Displays all group IDs associated with the current user.
id -G
#Searches for lines containing the word codespace inside the /etc/group file, which stores information about system groups.
cat /etc/group | grep codespace
#Creates a new directory named proyecto_unix inside the user’s home directory.
mkdir ~/proyecto_unix/
#Displays detailed information about the contents of the directory proyecto_unix, including hidden files and directory details.
ls -la ~/proyecto_unix/
#Creates a new group named desarrolladores in the system.
groupadd desarrolladores
#Creates a new group named operaciones with the group ID (GID) 2000.
groupadd -g 2000 operaciones
#Creates a system group named servicios_web, usually used for system services or applications.
groupadd --system servicios_web
#Searches the /etc/group file for the groups desarrolladores, operaciones, or servicios_web and displays their information.
grep "desarrolladores\|operaciones\|sevicios_web"/etc/group
#Uses extended regular expressions to search the /etc/group file for the groups desarrolladores, operaciones, or servicios_web.
grep -E "desarrolladores|operaciones|servicios_web" /etc/group
#Searches the /etc/login.defs file for the configuration values GID_MIN, GID_MAX, and SYS_GID, which define the range of group IDs used by the system.
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
#Creates a new user group named marketing with the group ID (GID) 2100.
addgroup --gid 2100 marketing
#Creates a system group named cache_web, usually used for system services or background processes.
addgroup --system cache_web
#Searches the /etc/group file for the groups diseno, marketing, or cache_web and displays their information.
grep "diseno\|marketing\|cache_web" /etc/group

