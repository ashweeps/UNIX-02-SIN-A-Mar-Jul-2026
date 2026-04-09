#This command is used to list, create, or delete branches in a Git repository.
git branch
#This command is used to switch between branches or restore files.
git checkout 
#Used to create a new directory (folder) named proyecto.
mkdir proyecto
#Used to change the current directory to the folder called proyecto.
cd proyecto/
#It takes you to the proyecto folder inside the /workspaces/UNIX-02-SIN-A-Mar-Jul-2026 directory.
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto
#Used to return to the home directory of the current user.
cd
#Used to navigate to the home directory using the tilde (~), which represents the user’s home folder.
cd ~ 
#Used to change the current directory to the home directory by using the $HOME environment variable.
cd $HOME
#Used to display the value of the PATH environment variable, which contains a list of directories where the system looks for executable files.
echo $PATH
#Se utiliza para listar todos los archivos y directorios (incluidos los ocultos) con información detallada y números de inodo.
ls -lai 
#Used to display the manual (help documentation) for the ls command.
man ls 
#Used to list all files and directories, including hidden ones.Furthermore, using `ls --all` is the same as using `ls -a`.
ls --all = ls -a
#It is used to move to the parent directory, one level above the current directory.
cd ..
#current directory
.
#parent directory
..
#Explanation of the result of the -lai
#Indicates the total number of disk blocks used by the contents of the directory.
total 8
1572909 drwxrwxrwx+ 2 codespace codespace 4096 Apr  9 12:20 .
1572874 drwxrwxrwx+ 5 codespace root      4096 Apr  9 12:20 ..
#1572909 inode number
#d: is a directory
#rwxrwxrwx+: permissions
#owner, group, and others: can read, write, and execute (full access)
#+: has extended permissions (ACL)
#2: number of links (in this case, only . and ..)
#codespace: owner user. group
#4096 → size
#Apr 9 12:20: last modification
#1572909 drwxrwxrwx+ 2 codespace codespace 4096 Apr 9 12:20 .
#. : current directory
#5: number of links (because the parent directory has more subfolders)
#root: group
#4096: size
#.. : parent directory (top level)

#Used to display detailed information about the current directory
stat .
#Device: Indicate the device where the file or directory is stored.
#Inode: It is the inode number, a unique identifier within the file system.
#It is the number of links that point to that directory.
Device: 7,4  Inode: 1572909     Links: 2