#Displays the current user’s information, including the user ID (UID), group ID (GID), and all the groups the user belongs to.
id
#Shows the name of the current user’s primary group.
id -gn
#Creates an empty file named test_grupo_heredado.txt in the home directory.
touch ~/test_grupo_heredado.txt
#Displays detailed information about the file, including permissions, owner, group, size, and last modification date.
ls -la ~/test_grupo_heredado.
#Shows the name of the current user’s primary group.
id -gn
#Displays a message showing the current group by using command substitution with $(id -gn).
echo "Grupo actual: $(id -gn)"
#Creates an empty file named antes_de_newgrp.txt in the home directory.
touch ~/antes_de_newgrp.txt
#Displays detailed information about the file, including permissions, owner, group, size, and modification date.
ls -la ~/antes_de_newgrp.
#Updates the package list from the Kali Linux repositories to check for the latest available versions.
apt update
#Checks for available package upgrades and updates installed packages if needed.
apt upgrade
#Downloads and installs the necessary packages for Linux utilities and group management, including util-linux-extra and uidmap.
apt install util-linux-extra uidmap
#Creates a new group called desarrolladores.
groupadd desarrolladores
#Changes the current active group to desarrolladores.
newgrp desarrolladores
#Displays the name of the current active group.
id -gn
#Displays a message showing the new active group using command substitution.
echo "Nuevo grupo activo: $(id -gn)"
#Creates an empty file named dentro_de_newgrp.txt inside the home directory while the active group is desarrolladores.
touch ~/dentro_de_newgrp.txt
#Displays detailed information about the file, including permissions, owner, active group, size, and modification date.
ls -la ~/dentro_de_newgrp.txt
#Creates the directory proyecto_dev/src and any missing parent directories using the -p option.
mkdir -p ~/proyecto_dev/src
#Terminates the current shell session or exits the newgrp environment, restoring the previous active primary group.
exit
#Displays the name of the current active primary group after leaving the newgrp session.
id -gn
#Prints a message showing the restored active group by using command substitution with the id -gn command.
echo "Grupo restaurado: $(id -gn)"
#Displays detailed information for both files in order to compare the group ownership inherited before and after using the newgrp command.
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt
#Creates a new group called grupo_restringido.
groupadd grupo_restringido
#Opens the group administration utility to manage the members and password of the grupo_restringido group.
gpasswd grupo_restringido