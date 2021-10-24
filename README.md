# Welcome to repository: SQL with Sakila Database

![Badge](https://img.shields.io/static/v1?label=Database&message=MySQL&color=blue&style=for-the-badge&logo=MySQL)   ![Badge](https://img.shields.io/static/v1?label=Language&message=SQL&color=blue&style=for-the-badge) ![Badge](https://img.shields.io/static/v1?label=Repository_stage&message=progressing&color=yellow&style=for-the-badge)


### Index

##### 1. [Abstract](#Abstract)
##### 2. [Data Definition Language - DDL](#DDL)
##### 3. [Data Manipulation Language - DML](#DML)
##### 4. [Data Query Language - DQL](#DQL)
##### 5. [Data Transaction Language - DTL](#DTL)
##### 6. [Data Control Language - DCL](#DCL)


### 1. Abstract <a name="Abstract"/>

That repository aims: (I) Exemplify technics about how to use Structured Query Language (SQL). (II) Use native functions utils to: concatenate, count, calculate, get current time and others. (III) Introduce joins using two or three tables.

[Download Sakila Database](https://dev.mysql.com/doc/index-other.html)

### 2. Data Definition Language <a name="DDL"/>
Exemples: CREATE, ALTER, DROP, [...].
Used to interact with database object structures.

```SQL

CREATE DATABASE SECURITY_ENTERPRISE DEFAULT CHARACTER SET UTF8;

---------------------------------------------------------------------------

USE SECURITY_ENTERPRISE;

---------------------------------------------------------------------------

CREATE TABLE USER (
    USER_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(45),
    LAST_NAME VARCHAR(45),
    EMAIL VARCHAR(45),
    P_ASSW0RD TEXT,
    CREATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP()
);

---------------------------------------------------------------------------

DROP DATABASE SECURITY_ENTERPRISE;

```


### 3. Data Manipulation Language <a name="DML"/>
Exemples: INSERT, DELETE, UPDATE, [...].
Used to realize interact with data.

```SQL

INSERT INTO
    USER (FIRST_NAME, LAST_NAME, EMAIL, P_ASSW0RD)
VALUES
    ("FIRST_NAME", "LAST_NAME", "exemple@exemple.com", MD5("password"));

---------------------------------------------------------------------------

UPDATE USER SET FIRST_NAME = "LUIZ" WHERE USER_ID = 1;

---------------------------------------------------------------------------

DELETE FROM USER WHERE USER_ID = 1;

```


### 4. Data Query Language <a name="DQL"/>
Exemples: SELECT.
Used to get data, make joins, etc.

```SQL

SELECT
    CITY.CITY,
    COUNTRY.COUNTRY
FROM
    COUNTRY
RIGHT JOIN
    CITY ON CITY.COUNTRY_ID = COUNTRY.COUNTRY_ID
WHERE COUNTRY.COUNTRY = "BRAZIL"
ORDER BY CITY.CITY DESC;

```

### 5. Data Transaction Language <a name="DTL"/>
Exemples: BEGIN TRANSACTION, COMMIT, ROLLBACK, [...].
Utils to make and validate (or not) important or big changes according response events. 

```SQL

START TRANSACTION;
    -- ALL TRANSACTION CODE
    [...];
COMMIT;

START TRANSACTION;
    -- ALL TRANSACTION CODE;
    [...];
ROLLBACK;

```


### 6. Data Control Language <a name="DCL"/>
Exemples: DENY, REVOKE, GRANT, [...].

```SQL

GRANT ALL ON SECURITY_ENTERPRISE.* TO 'admin'@'localhost';

```

--------------------------------------------------------------

[SQL classification - StackOverflow](https://pt.stackoverflow.com/questions/262867/o-que-s%C3%A3o-as-siglas-ddl-dml-dql-dtl-e-dcl)

[SQL classification - Geeks for Geeks](https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/)