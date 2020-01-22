#!/bin/bash

#script to see if there is a user account

read -p "Enter the username: " UserName

var=$(grep -ic $UserName /etc/passwd)

if 
	[ $var -eq 1 ]
then
	echo "Welcome"
	
else
	echo "bye"

fi
