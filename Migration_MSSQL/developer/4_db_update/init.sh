#!/bin/sh

echo "hi"
sqlcmd -S 172.18.0.2 -U SA -P 1234*Password -Q 'select @@VERSION'
sqlcmd -S 172.18.0.2 -U SA -P 1234*Password -d apim_db -i '/update.sql'
