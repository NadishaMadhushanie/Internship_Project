#!/bin/sh

sqlplus -V
sqlplus apim_db/apim_db@172.18.0.2:1521/PWD < am.sql
sqlplus shared_db/shared_db@172.18.0.2:1521/PWD < reg-index.sql

