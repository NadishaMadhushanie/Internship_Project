#!/bin/sh

echo "hi"
#mysql --version
#mysql -uroot -ppwd -h 172.18.0.2 -P 3306 apim_db < update.sql
sqlplus -V

sqlplus apim_db/apim_db@172.18.0.2:1521/PWD < update.sql

