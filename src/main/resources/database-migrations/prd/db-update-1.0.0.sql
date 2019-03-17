--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: D:/Users/jesus/Projects/barlingo/workspace/ci-cd-test/src/main/resources/liquibase-diff-changeLog.xml
--  Ran at: 16/03/19 21:45
--  Against: root@localhost@jdbc:mysql://localhost:3306/barlingo_uat_db?useSSL=false&serverTimezone=UTC
--  Liquibase version: 3.4.1
--  *********************************************************************

--  Create Database Lock Table
CREATE TABLE DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

--  Initialize Database Lock Table
DELETE FROM DATABASECHANGELOGLOCK;

INSERT INTO DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

--  Lock Database
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'Jesus-Port (192.168.56.1)', LOCKGRANTED = '2019-03-16 21:45:44.794' WHERE ID = 1 AND LOCKED = 0;

--  Create Database Change Log Table
CREATE TABLE DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL);

--  Changeset D:/Users/jesus/Projects/barlingo/workspace/ci-cd-test/src/main/resources/liquibase-diff-changeLog.xml::1552769136530-1::jesus (generated)
CREATE TABLE users (id INT AUTO_INCREMENT NOT NULL, address VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, name VARCHAR(255) NOT NULL, phone VARCHAR(255) NULL, surname VARCHAR(255) NOT NULL, username VARCHAR(30) NOT NULL, CONSTRAINT PK_USERS PRIMARY KEY (id));

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('1552769136530-1', 'jesus (generated)', 'D:/Users/jesus/Projects/barlingo/workspace/ci-cd-test/src/main/resources/liquibase-diff-changeLog.xml', NOW(), 1, '7:51bd5b09bae302e9f39dcf4b450d0ed3', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.1');

--  Release Database Lock
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

