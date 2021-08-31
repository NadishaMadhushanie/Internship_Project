#!/bin/sh

flag=1

while [ $flag == 1 ]
do

	echo "Database types..."
	echo "1) MYSQL"
	echo "2) ORACLE"
        echo "3) POSTGRESQL"
        echo "4) MSSQL"
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
                "3")
			dbType="POSTGRESQL"
			defaultPort="5432"
			;;
                "4")
			dbType="MSSQL"
			defaultPort="1433"
			;;
		*)
			dbType="Invalid"
			;;
	esac
	
	if [ $dbType == "MYSQL" ] ;
	then
		echo "If you like to continue with mysql 5.7 version, use the Migration_MYSQL folder....."

		flag=0

        elif [ $dbType == "ORACLE" ] ;
	then
		echo "If you like to continue with oracle 19.3.0-ee version, use the Migration_ORACLE folder....."

		flag=0

        elif [ $dbType == "POSTGRESQL" ] ;
	then
		echo "Continue with the Migration_PostgreSQL folder....."

		flag=0

       elif [ $dbType == "MSSQL" ] ;
	then
		echo "Continue with the Migration_MSSQL folder....."

		flag=0

	else
	
		echo "Enter a valid database type!!!"
	
        fi
done
