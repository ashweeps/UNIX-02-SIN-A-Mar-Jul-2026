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
