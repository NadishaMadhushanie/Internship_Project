#!/bin/sh

mysql --version
mysql -uroot -ppwd -h 172.18.0.2 -P 3306 apim_db < apim.sql
mysql -uroot -ppwd -h 172.18.0.2 -P 3306 shared_db < shared.sql

