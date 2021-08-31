create database shared_db;
\c shared_db;
\i postgresql1.sql;
grant all privileges on database shared_db to root;

create database apim_db;
\c apim_db;
\i postgresql2.sql
grant all privileges on database apim_db to root;
