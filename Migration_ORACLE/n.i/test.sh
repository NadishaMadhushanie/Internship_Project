#!/bin/sh

flag=1

while [ $flag == 1 ]
do

	echo "Database types..."
	echo "1) MYSQL"
	echo "2) ORACLE"
	echo "Enter no. of your database type :"
	read -r num

	case $num in
		"1")
			dbType="MYSQL"
			defaultPort="3306"
			;;
		"2")
			dbType="ORACLE"
			defaultPort="1521"
			;;
		*)
			dbType="Invalid"
			;;
	esac
	
	if [ $dbType == "MYSQL" -o $dbType == "ORACLE" ] ;
	then
		echo "---click enter to use default values---"
		
		read -p "Enter your database host : " host
		host=${host:-localhost}
		echo $host

		read -p "Enter your database port : " port
		port=${port:-$defaultPort}
		echo $port

		read -p "Enter your database user : " user
		user=${user:-root}
		echo $user

		read -p "Enter your database password : " password
		password=${password:-pwd}
		echo $password

		flag=0

	else
	
		echo "Enter a valid database type!!!"
	fi
done
