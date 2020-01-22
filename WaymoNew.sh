#!/bin/bash

clear
echo "     ***************************************************************"
echo "     ***************************************************************"
echo ""                                                                     
echo "			Waymo Enterprises"
echo ""
echo "     ***************************************************************"
echo "     ***************************************************************"

echo "Welcome to waymo enterprises. Please choose an option to proceed"
echo "1  Create a user"
echo "2  Display user account details"
echo "3  Display group account"
echo "4  Mount your share"
echo "5  Unmount your share"
echo "6  Delete a file"
echo "7  Take a backup of your document"
echo "8  Create a hardlink"

read -p  "Make your choice: " var
case $var in
	1) 
	echo "Please, enter your username: "
	read Username
	echo "Please, enter your password: "
	read Password
	sudo useradd $Username
	sudo passwd $Username $Passwd
	;;
	
   	2) 
	echo "Please enter your username: "
	read Username
	id $Username
 	getent passwd $Username
	cat /etc/passwd | grep $Username
	;;
	
	3)
	read -p "Please, enter the groupname :" GroupName
	grep "^$GroupName" /etc/group
	;;


	4)
	read -p "Please, enter your username: " Username
	read -p "Please, enter the name of the shared folder: " Sharename
	read -p "Please, enter the ip address of the source computer: " IpSource
	sudo mount -t cifs -o username="$Username" //$IpSource/$Sharename /mnt/mountpnt
	;;

	5)
	umount /mnt/mountpnt
	echo "Share unmounted"
	;;

	6)
	echo "These are your current directories and files: "
	ls -lt
	read -p "Please, enter filename: " FileName
	echo "Your file $FileName  will now be removed"
	sleep 2
	rm $FileName
	ls -lt
	;;

	7)
	read -p "Please, enter filename: " FileName
	read -p "Please, enter a name for your backup: " BackupName
	tar -cvf $BackupName $FileName
	gzip $BackupName
	sudo cp "$BackupName.gz" /mnt/mountpnt
	;;

	8)
	read -p "Please, enter the filename: " FileName
	read -p "Please, enter a name for the hardlink: " HardLinkName
	ln $FileName $HardLinkName
	;;
	

esac
	 
