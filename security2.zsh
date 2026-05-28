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
ls -la ~/antes_de_newgrp.txt