create database shared_db;
use shared_db;
source /mysql1.sql;
grant all on shared_db.* TO 'root'@'%' identified by 'pwd';

create database apim_db;
use apim_db;
source /mysql2.sql
grant all on apim_db.* TO 'root'@'%' identified by 'pwd';
