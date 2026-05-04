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
#Used to display the current user (username) who is logged into the system.
whoami
#when each file was modified
ls -lt
#Display the beginning of the /etc directory listing, filtering to show only the first 20 entries.
ls /etc |head -20
#Display the end of the /etc directory listing, filtering to show only the last 20 entries.
ls /etc |tail -20


 #Updates package lists and installs development tools and system programs automatically without asking for confirmation.
 #gcc, make — kernel compilation and BusyBox libncurses-dev — interactive configuration menus (menuconfig) flex, bison, bc — required by the kernel compilation process cpio — to create the initramfs libelf-dev, libssl-dev — kernel dependencies syslinux — the boot manager dosfstools — to create the FAT file system qemu-system-x86 — to test the image without real hardware
sudo apt update sudo apt install -y git vim make gcc libncurses-dev flex bison bc \   cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 
#Downloads a copy of the Linux source code with only the latest version (shallow clone).
git clone --depth 1 https://github.com/torvalds/linux.git 
#Changes the current directory to the “linux” folder you just downloaded.
cd linux 
# Shows information about the CPU, like architecture, cores, and processor details.
lscpu
#Opens a text-based menu to configure the Linux kernel options before building it.
make menuconfig 
#Compiles the project using 2 parallel jobs to make the process faster.
make -j 2 
#Creates a new directory called “boot-files” in a system location with administrator permissions.
sudo mkdir /boot-files 
#Copies the compiled kernel file “bzImage” into the “boot-files” directory.
sudo cp arch/x86/boot/bzImage /boot-files/ 
#Moves one level up to the parent directory.
cd ..
#Lists all files in /boot-files with full details, including hidden files.
ls -la /boot-files
#Downloads the BusyBox source code with only the latest version.
git clone --depth 1 https://git.busybox.net/busybox 
#Changes the current directory to the “busybox” folder.
cd busybox 
#Opens a menu in the terminal to configure BusyBox options before compiling it.
make menuconfig 
#Builds BusyBox using 2 parallel tasks to speed up the compilation process.
make -j 2
#Creates a new directory called “initramfs” inside /boot-files with administrator permissions.
sudo mkdir /boot-files/initramfs 
#Installs BusyBox files into the /boot-files/initramfs directory using root permissions.
sudo make CONFIG_PREFIX=/boot-files/initramfs install 
#Changes the current directory to /boot-files/initramfs.
cd /boot-files/initramfs 
#Deletes the file “linuxrc” with administrator permissions.
sudo rm linuxrc 
#Gives execute permission to the file “init” so it can run as a program.
sudo chmod +x init 
#Creates an initramfs archive from the current directory and saves it as “init.cpio”.
sudo find . | sudo cpio -o -H newc > ../init.cpio
#Moves one level up to the parent directory.
cd ..
#Switches to the root user with full administrator access.
sudo su
#Creates a 50 MB file called “boot” filled with zeros.
dd if=/dev/zero of=boot bs=1M count=50 
#Formats the file “boot” with a FAT filesystem.
mkfs -t fat boot 
#Installs the Syslinux bootloader on the “boot” file.
syslinux boot 
#Creates two directories called “m” and “mount”.
mkdir m mount 
#Mounts the “boot” file into the “m” directory.
boot m 
#Copies the kernel and initramfs files into the mounted directory.
cp bzImage init.cpio m 
#Unmounts the “m” directory safely.
umount m 

