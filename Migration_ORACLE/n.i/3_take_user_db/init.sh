#!/bin/sh

echo "hi"
sqlplus -V
sqlplus apim_db/apim_db@172.18.0.2:1521/PWD < apim.sql
sqlplus shared_db/shared_db@172.18.0.2:1521/PWD < shared.sql

