uname_a # Give the computer information
linux/Documentation/lockingwhich gpg # Give the location of the gpg binary
gpg --version # It tells us the version of gpg and additional information
gpg --full-generate-key # To generate public key and private key
gpg --list-keys #To see the keys
gpg -armor --export # To export the keys
gpg --list-secret-keys --keyid-format=long # To list and view the private keys
gpg --armor --export-secret-keys HASH # Export your private key and convert it into text to copy
gpg --armor --export<ashley2007egmail.com> mi_llave_publica.asc #Export your public key
gpg --import CAMILLA.asc #Export a key from a file
echo "Tqm, Camillaaa">doc_no_cifrado.txt # The file is created and the text is redirected to a file
gpg --output doc_cifrado.txt --encrypt --recipient camiloscas.30.lascano@gmail.com doc_cifrado.txt # Encrypt the content and use the other person's public key
gpg --decrypt doc_cifrado.txt # This command is used to decrypt an encrypted file.
which gpg / gpg --version # Used to find where GPG is installed on your system.
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt #Use GNU Privacy Guard to digitally sign a text file; it does not encrypt the content, it only signs it.
cat doc_no_cifrado_firmado.txt #Display the contents of the signed file in the terminal.
gpg --verify doc_no_cifrado_firmado_binariocamilla.txt #Verify if the digital signature is valid and if the file has not been modified.
gpg --edit-key #It allows you to edit and manage a GPG key.
#Then we put the number depending on the level of confidence, in my case, I put 4, which is who believes that person verifies identities correctly and we also put the letter q
 gpg --sign-key #It allows you to edit and manage a GPG key.
 gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt #Verify the digital signature of the file and confirm if it is valid and has not been altered.}
 gpg --verify doc_no_cifrado_firmadocamilla.txt #Verify the file's digital signature and check if it is authentic and has not been modified.
 gpg --output firma_separada_doc_no_cifrado.sig --detach-sign doc_no_cifrado.txt #Create a separate digital signature from the original file and save it in .sig format.
 gpg --verify camilla_firma_separada_doc_no_cifrado.sig camilla_doc_no_cifrado.txt #Verify the separate signature using the original file to confirm that it is authentic and has not been modified.
 gpg --output doc_cifrado_y_firmado.txt --encrypt --sign --recipient XXXXXXX doc_no_cifrado.txt #Encrypt and sign the file, sending it securely to the indicated recipient.
 gpg --output doc_cifrado_y_firmado_descifrado_y_validado.txt --decrypt camilla_doc_cifrado_y_firmado.txt #Decrypt the file and verify the signature, saving the original content.
 cat doc_cifrado_y_firmado_y_validado.txt # Displays the contents of the decrypted and verified file in the terminal.

#I forgot that we are working on the other script called boot.sh and I had already started it here, but I copied the same changes and saved it and continued in the other one. :(
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
#
cd /boot-files/initramfs 
#

