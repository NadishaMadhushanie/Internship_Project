/*create user shared_db identified by shared_db;
alter session set current_schema = shared_db;
source /mysql1.sql;
grant all on shared_db.* TO 'root'@'%' identified by 'pwd';
*/

/*alter session set "_ORACLE_SCRIPT"=true;
create user root identified by pwd;
GRANT CONNECT,RESOURCE to root WITH ADMIN OPTION;
CONNECT root/pwd
alter session set current_schema = root;

CREATE TABLE IDN_BASE_TABLE (PRODUCT_NAME VARCHAR2 (20),PRIMARY KEY (PRODUCT_NAME));
/*source /mysql2.sql
grant all on apim_db.* TO 'root'@'%' identified by 'pwd';




--------------------------------------
-- CREATE USER apimuser IDENTIFIED BY wso2;
-- GRANT CONNECT,RESOURCE to apimuser WITH ADMIN OPTION;
-- CONNECT apimuser/wso2
@mysql2.sql
*/















/*alter session set "_ORACLE_SCRIPT"=true;
create user apim_db identified by apim_db;
alter session set current_schema = apim_db;
connect sys/pwd as sysdba
GRANT CONNECT,RESOURCE to sys WITH ADMIN OPTION;
@mysql2.sql
select * from IDN_BASE_TABLE;
*/


alter session set "_ORACLE_SCRIPT"=true;
create user shared_db identified by shared_db account unlock;
alter session set current_schema = shared_db;
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE TRIGGER, CREATE PROCEDURE TO shared_db;
alter user shared_db quota unlimited on USERS;
@/oracle1.sql;

create user apim_db identified by apim_db account unlock;
alter session set current_schema = apim_db;
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE TRIGGER, CREATE PROCEDURE TO apim_db;
alter user apim_db quota unlimited on USERS;
@/oracle2.sql;

