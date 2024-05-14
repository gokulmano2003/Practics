2631.3527]
(c) Microsoft Corporation. All rights reserved.

C:\Users\ADMIN>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 26
Server version: 8.0.37 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| gokul              |
| information_schema |
| mysql              |
| performance_schema |
| players            |
| sys                |
+--------------------+
6 rows in set (0.10 sec)

mysql> use gokul;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_gokul |
+-----------------+
| details         |
| emailverify     |
| krishna         |
| native          |
| product         |
| raj             |
| student         |
+-----------------+
7 rows in set (0.04 sec)

mysql> create table primary(
    -> id INTO PRIMARY KEY AUTO_INCREMENT,
    -> NAME VARCHAR(20) NOT NULL,
    -> LAST_NAME CHAT(25) NOT NULL,
    -> PHONENUMBER BIGINT UNIQUE,
    -> GENDER CHAR(1) CHECK(GENDER IN ('M','F')),
    -> NATIONALITY VARCHAR(21) DEFAULTV'INDIAN'
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primary(
id INTO PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(20) NOT NULL,
LAST_NAM' at line 1
mysql> create table contactprimary(
    -> id INT PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(20) NOT NULL,
    -> last_name CHAR(20) NOT NULL,
    -> phonenumber BIGINT UNIQUE,
    -> nationality VARCHAR(10) DEFAULT 'INDIAN',
    -> gender CHAR(1) CHECK(gender IN ('m','f'))
    -> );
Query OK, 0 rows affected (0.27 sec)

mysql> desc contactprimary;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(20) | NO   |     | NULL    |                |
| last_name   | char(20)    | NO   |     | NULL    |                |
| phonenumber | bigint      | YES  | UNI | NULL    |                |
| nationality | varchar(10) | YES  |     | INDIAN  |                |
| gender      | char(1)     | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
6 rows in set (0.04 sec)

mysql> insert into contactprimary values(1,"Gokul_Raj","P",6384579273,"m");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into contactprimary(name,,last_name,phonenumber,gender)values("Gokul Raj","P",6384579273,"m");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',last_name,phonenumber,gender)values("Gokul Raj","P",6384579273,"m")' at line 1
mysql> insert into contactprimary(name,last_name,phonenumber,gender)values("Gokul Raj","P",6384579273,"m");
Query OK, 1 row affected (0.02 sec)

mysql> select * from contactprimary;
+----+-----------+-----------+-------------+-------------+--------+
| id | name      | last_name | phonenumber | nationality | gender |
+----+-----------+-----------+-------------+-------------+--------+
|  1 | Gokul Raj | P         |  6384579273 | INDIAN      | m      |
+----+-----------+-----------+-------------+-------------+--------+
1 row in set (0.01 sec)

mysql> insert into contactprimary(name,last_name,phonenumber,gender)values(" Raj","A",6334579273,"F");
Query OK, 1 row affected (0.18 sec)

mysql> select * from contactprimary;
+----+-----------+-----------+-------------+-------------+--------+
| id | name      | last_name | phonenumber | nationality | gender |
+----+-----------+-----------+-------------+-------------+--------+
|  1 | Gokul Raj | P         |  6384579273 | INDIAN      | m      |
|  2 |  Raj      | A         |  6334579273 | INDIAN      | F      |
+----+-----------+-----------+-------------+-------------+--------+
2 rows in set (0.03 sec)

mysql> insert into contactprimary(name,last_name,phonenumber,gender,nationality)values("Gokul Raj","P",6384579293,"m","american");
Query OK, 1 row affected (0.03 sec)

mysql> select * from contactprimary;
+----+-----------+-----------+-------------+-------------+--------+
| id | name      | last_name | phonenumber | nationality | gender |
+----+-----------+-----------+-------------+-------------+--------+
|  1 | Gokul Raj | P         |  6384579273 | INDIAN      | m      |
|  2 |  Raj      | A         |  6334579273 | INDIAN      | F      |
|  3 | Gokul Raj | P         |  6384579293 | american    | m      |
+----+-----------+-----------+-------------+-------------+--------+
3 rows in set (0.00 sec)

mysql> desc contactprimary
    -> ;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(20) | NO   |     | NULL    |                |
| last_name   | char(20)    | NO   |     | NULL    |                |
| phonenumber | bigint      | YES  | UNI | NULL    |                |
| nationality | varchar(10) | YES  |     | INDIAN  |                |
| gender      | char(1)     | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
6 rows in set (0.15 sec)

mysql> alter table contactprimary
    -> add column rollno int;
Query OK, 0 rows affected (0.38 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc contactprimary
    -> ;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(20) | NO   |     | NULL    |                |
| last_name   | char(20)    | NO   |     | NULL    |                |
| phonenumber | bigint      | YES  | UNI | NULL    |                |
| nationality | varchar(10) | YES  |     | INDIAN  |                |
| gender      | char(1)     | YES  |     | NULL    |                |
| rollno      | int         | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
7 rows in set (0.03 sec)

mysql> alter table contactprimary
    -> drop column rollno;
Query OK, 0 rows affected (0.26 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc contactprimary;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(20) | NO   |     | NULL    |                |
| last_name   | char(20)    | NO   |     | NULL    |                |
| phonenumber | bigint      | YES  | UNI | NULL    |                |
| nationality | varchar(10) | YES  |     | INDIAN  |                |
| gender      | char(1)     | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
6 rows in set (0.04 sec)

mysql> alter table contactprimary
    -> modify column nationality varchar(15);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc contactprimary;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(20) | NO   |     | NULL    |                |
| last_name   | char(20)    | NO   |     | NULL    |                |
| phonenumber | bigint      | YES  | UNI | NULL    |                |
| nationality | varchar(15) | YES  |     | NULL    |                |
| gender      | char(1)     | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)

mysql> select * from contactprimary;
+----+-----------+-----------+-------------+-------------+--------+
| id | name      | last_name | phonenumber | nationality | gender |
+----+-----------+-----------+-------------+-------------+--------+
|  1 | Gokul Raj | P         |  6384579273 | INDIAN      | m      |
|  2 |  Raj      | A         |  6334579273 | INDIAN      | F      |
|  3 | Gokul Raj | P         |  6384579293 | american    | m      |
+----+-----------+-----------+-------------+-------------+--------+
3 rows in set (0.01 sec)

mysql> update contactprimary
    -> set name='hari'
    -> where id=3;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from contactprimary;
+----+-----------+-----------+-------------+-------------+--------+
| id | name      | last_name | phonenumber | nationality | gender |
+----+-----------+-----------+-------------+-------------+--------+
|  1 | Gokul Raj | P         |  6384579273 | INDIAN      | m      |
|  2 |  Raj      | A         |  6334579273 | INDIAN      | F      |
|  3 | hari      | P         |  6384579293 | american    | m      |
+----+-----------+-----------+-------------+-------------+--------+
3 rows in set (0.00 sec)

mysql>
mysql> DROP TABLE IF EXISTS emp;
Query OK, 0 rows affected, 1 warning (0.17 sec)

mysql>
mysql> CREATE TABLE emp (
    ->   empno decimal(4,0) NOT NULL,
    ->   ename varchar(10) default NULL,
    ->   job varchar(9) default NULL,
    ->   mgr decimal(4,0) default NULL,
    ->   hiredate date default NULL,
    ->   sal decimal(7,2) default NULL,
    ->   comm decimal(7,2) default NULL,
    ->   deptno decimal(2,0) default NULL
    -> );
Query OK, 0 rows affected (0.23 sec)

mysql>
mysql> DROP TABLE IF EXISTS dept;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql>
mysql> CREATE TABLE dept (
    ->   deptno decimal(2,0) default NULL,
    ->   dname varchar(14) default NULL,
    ->   loc varchar(13) default NULL
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> INSERT INTO dept VALUES ('10','ACCOUNTING','NEW YORK');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO dept VALUES ('30','SALES','CHICAGO');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| gokul              |
| information_schema |
| mysql              |
| performance_schema |
| players            |
| sys                |
+--------------------+
6 rows in set (0.04 sec)

mysql> use gokul;
Database changed
mysql> show tabls;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'tabls' at line 1
mysql> show tables;
+-----------------+
| Tables_in_gokul |
+-----------------+
| contactprimary  |
| dept            |
| details         |
| emailverify     |
| emp             |
| krishna         |
| native          |
| product         |
| raj             |
| student         |
+-----------------+
10 rows in set (0.03 sec)

mysql> select * from dept;
+--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.02 sec)

mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.01 sec)

mysql> drop table emp;
Query OK, 0 rows affected (0.14 sec)

mysql> drop table dept;
Query OK, 0 rows affected (0.05 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| gokul              |
| information_schema |
| mysql              |
| performance_schema |
| players            |
| sys                |
+--------------------+
6 rows in set (0.01 sec)

mysql> create databases employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databases employee' at line 1
mysql> create database employee;
Query OK, 1 row affected (0.02 sec)

mysql>
mysql> DROP TABLE IF EXISTS emp;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql>
mysql> CREATE TABLE emp (
    ->   empno decimal(4,0) NOT NULL,
    ->   ename varchar(10) default NULL,
    ->   job varchar(9) default NULL,
    ->   mgr decimal(4,0) default NULL,
    ->   hiredate date default NULL,
    ->   sal decimal(7,2) default NULL,
    ->   comm decimal(7,2) default NULL,
    ->   deptno decimal(2,0) default NULL
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql>
mysql> DROP TABLE IF EXISTS dept;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql>
mysql> CREATE TABLE dept (
    ->   deptno decimal(2,0) default NULL,
    ->   dname varchar(14) default NULL,
    ->   loc varchar(13) default NULL
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> INSERT INTO dept VALUES ('10','ACCOUNTING','NEW YORK');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO dept VALUES ('30','SALES','CHICAGO');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| employee           |
| gokul              |
| information_schema |
| mysql              |
| performance_schema |
| players            |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> use employee;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql>
mysql> DROP TABLE IF EXISTS emp;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql>
mysql> CREATE TABLE emp (
    ->   empno decimal(4,0) NOT NULL,
    ->   ename varchar(10) default NULL,
    ->   job varchar(9) default NULL,
    ->   mgr decimal(4,0) default NULL,
    ->   hiredate date default NULL,
    ->   sal decimal(7,2) default NULL,
    ->   comm decimal(7,2) default NULL,
    ->   deptno decimal(2,0) default NULL
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> DROP TABLE IF EXISTS dept;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql>
mysql> CREATE TABLE dept (
    ->   deptno decimal(2,0) default NULL,
    ->   dname varchar(14) default NULL,
    ->   loc varchar(13) default NULL
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> INSERT INTO dept VALUES ('10','ACCOUNTING','NEW YORK');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO dept VALUES ('30','SALES','CHICAGO');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');
Query OK, 1 row affected (0.01 sec)

mysql> show tables;
+--------------------+
| Tables_in_employee |
+--------------------+
| dept               |
| emp                |
+--------------------+
2 rows in set (0.00 sec)

mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.00 sec)

mysql> select from ename;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from ename' at line 1
mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.03 sec)

mysql> select  ename from;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select  ename from emp;
+--------+
| ename  |
+--------+
| SMITH  |
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| BLAKE  |
| CLARK  |
| SCOTT  |
| KING   |
| TURNER |
| ADAMS  |
| JAMES  |
| FORD   |
| MILLER |
+--------+
14 rows in set (0.00 sec)

mysql> select  ename,sal,comm from emp;
+--------+---------+---------+
| ename  | sal     | comm    |
+--------+---------+---------+
| SMITH  |  800.00 |    NULL |
| ALLEN  | 1600.00 |  300.00 |
| WARD   | 1250.00 |  500.00 |
| JONES  | 2975.00 |    NULL |
| MARTIN | 1250.00 | 1400.00 |
| BLAKE  | 2850.00 |    NULL |
| CLARK  | 2450.00 |    NULL |
| SCOTT  | 3000.00 |    NULL |
| KING   | 5000.00 |    NULL |
| TURNER | 1500.00 |    0.00 |
| ADAMS  | 1100.00 |    NULL |
| JAMES  |  950.00 |    NULL |
| FORD   | 3000.00 |    NULL |
| MILLER | 1300.00 |    NULL |
+--------+---------+---------+
14 rows in set (0.00 sec)

mysql> select  ename,sal,comm,sal+comm from emp;
+--------+---------+---------+----------+
| ename  | sal     | comm    | sal+comm |
+--------+---------+---------+----------+
| SMITH  |  800.00 |    NULL |     NULL |
| ALLEN  | 1600.00 |  300.00 |  1900.00 |
| WARD   | 1250.00 |  500.00 |  1750.00 |
| JONES  | 2975.00 |    NULL |     NULL |
| MARTIN | 1250.00 | 1400.00 |  2650.00 |
| BLAKE  | 2850.00 |    NULL |     NULL |
| CLARK  | 2450.00 |    NULL |     NULL |
| SCOTT  | 3000.00 |    NULL |     NULL |
| KING   | 5000.00 |    NULL |     NULL |
| TURNER | 1500.00 |    0.00 |  1500.00 |
| ADAMS  | 1100.00 |    NULL |     NULL |
| JAMES  |  950.00 |    NULL |     NULL |
| FORD   | 3000.00 |    NULL |     NULL |
| MILLER | 1300.00 |    NULL |     NULL |
+--------+---------+---------+----------+
14 rows in set (0.01 sec)

mysql> select  ename,sal,comm,sal+comm as totalcontribution from emp;
+--------+---------+---------+-------------------+
| ename  | sal     | comm    | totalcontribution |
+--------+---------+---------+-------------------+
| SMITH  |  800.00 |    NULL |              NULL |
| ALLEN  | 1600.00 |  300.00 |           1900.00 |
| WARD   | 1250.00 |  500.00 |           1750.00 |
| JONES  | 2975.00 |    NULL |              NULL |
| MARTIN | 1250.00 | 1400.00 |           2650.00 |
| BLAKE  | 2850.00 |    NULL |              NULL |
| CLARK  | 2450.00 |    NULL |              NULL |
| SCOTT  | 3000.00 |    NULL |              NULL |
| KING   | 5000.00 |    NULL |              NULL |
| TURNER | 1500.00 |    0.00 |           1500.00 |
| ADAMS  | 1100.00 |    NULL |              NULL |
| JAMES  |  950.00 |    NULL |              NULL |
| FORD   | 3000.00 |    NULL |              NULL |
| MILLER | 1300.00 |    NULL |              NULL |
+--------+---------+---------+-------------------+
14 rows in set (0.01 sec)

mysql> select  ename,sal,comm,sal+(isnull (comm,0)) as totalcontribution from emp;
ERROR 1582 (42000): Incorrect parameter count in the call to native function 'isnull'
mysql> select  ename,sal,comm,sal+isnull (comm,0) as totalcontribution from emp;
ERROR 1582 (42000): Incorrect parameter count in the call to native function 'isnull'
mysql> select  ename,sal,comm,sal+(isnull comm,0)  from emp;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'comm,0)  from emp' at line 1
mysql> select  ename,sal,comm,sal+(ifnull comm,0)  from emp;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'comm,0)  from emp' at line 1
mysql> select  ename,sal,comm,sal+(ifnull (comm,0))  from emp;
+--------+---------+---------+-----------------------+
| ename  | sal     | comm    | sal+(ifnull (comm,0)) |
+--------+---------+---------+-----------------------+
| SMITH  |  800.00 |    NULL |                800.00 |
| ALLEN  | 1600.00 |  300.00 |               1900.00 |
| WARD   | 1250.00 |  500.00 |               1750.00 |
| JONES  | 2975.00 |    NULL |               2975.00 |
| MARTIN | 1250.00 | 1400.00 |               2650.00 |
| BLAKE  | 2850.00 |    NULL |               2850.00 |
| CLARK  | 2450.00 |    NULL |               2450.00 |
| SCOTT  | 3000.00 |    NULL |               3000.00 |
| KING   | 5000.00 |    NULL |               5000.00 |
| TURNER | 1500.00 |    0.00 |               1500.00 |
| ADAMS  | 1100.00 |    NULL |               1100.00 |
| JAMES  |  950.00 |    NULL |                950.00 |
| FORD   | 3000.00 |    NULL |               3000.00 |
| MILLER | 1300.00 |    NULL |               1300.00 |
+--------+---------+---------+-----------------------+
14 rows in set (0.01 sec)

mysql> select  ename,sal,comm,sal+(ifnull (comm,10))  from emp;
+--------+---------+---------+------------------------+
| ename  | sal     | comm    | sal+(ifnull (comm,10)) |
+--------+---------+---------+------------------------+
| SMITH  |  800.00 |    NULL |                 810.00 |
| ALLEN  | 1600.00 |  300.00 |                1900.00 |
| WARD   | 1250.00 |  500.00 |                1750.00 |
| JONES  | 2975.00 |    NULL |                2985.00 |
| MARTIN | 1250.00 | 1400.00 |                2650.00 |
| BLAKE  | 2850.00 |    NULL |                2860.00 |
| CLARK  | 2450.00 |    NULL |                2460.00 |
| SCOTT  | 3000.00 |    NULL |                3010.00 |
| KING   | 5000.00 |    NULL |                5010.00 |
| TURNER | 1500.00 |    0.00 |                1500.00 |
| ADAMS  | 1100.00 |    NULL |                1110.00 |
| JAMES  |  950.00 |    NULL |                 960.00 |
| FORD   | 3000.00 |    NULL |                3010.00 |
| MILLER | 1300.00 |    NULL |                1310.00 |
+--------+---------+---------+------------------------+
14 rows in set (0.00 sec)

mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.00 sec)

mysql> select * from emp
    -> where job='president'
    -> ;
+-------+-------+-----------+------+------------+---------+------+--------+
| empno | ename | job       | mgr  | hiredate   | sal     | comm | deptno |
+-------+-------+-----------+------+------------+---------+------+--------+
|  7839 | KING  | PRESIDENT | NULL | 1981-11-17 | 5000.00 | NULL |     10 |
+-------+-------+-----------+------+------------+---------+------+--------+
1 row in set (0.01 sec)

mysql> select * from emp
    -> where job='clerk';
+-------+--------+-------+------+------------+---------+------+--------+
| empno | ename  | job   | mgr  | hiredate   | sal     | comm | deptno |
+-------+--------+-------+------+------------+---------+------+--------+
|  7369 | SMITH  | CLERK | 7902 | 1980-12-17 |  800.00 | NULL |     20 |
|  7876 | ADAMS  | CLERK | 7788 | 1983-01-12 | 1100.00 | NULL |     20 |
|  7900 | JAMES  | CLERK | 7698 | 1981-12-03 |  950.00 | NULL |     30 |
|  7934 | MILLER | CLERK | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+-------+------+------------+---------+------+--------+
4 rows in set (0.00 sec)

mysql> select deptno from emp;
+--------+
| deptno |
+--------+
|     20 |
|     30 |
|     30 |
|     20 |
|     30 |
|     30 |
|     10 |
|     20 |
|     10 |
|     30 |
|     20 |
|     30 |
|     20 |
|     10 |
+--------+
14 rows in set (0.00 sec)

mysql> select distinct deptno from emp;
+--------+
| deptno |
+--------+
|     20 |
|     30 |
|     10 |
+--------+
3 rows in set (0.01 sec)

mysql> select * from emp
    -> where sal=max(sal);
ERROR 1111 (HY000): Invalid use of group function
mysql> select * from emp
    -> ;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.01 sec)

mysql> select max(sal);
ERROR 1054 (42S22): Unknown column 'sal' in 'field list'
mysql> select max(sal) from emp;
+----------+
| max(sal) |
+----------+
|  5000.00 |
+----------+
1 row in set (0.01 sec)

mysql> select min(sal) from emp;
+----------+
| min(sal) |
+----------+
|   800.00 |
+----------+
1 row in set (0.00 sec)

mysql> select * from emp
    -> ;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.00 sec)

mysql> select empon from emp
    -> where empon=7900;
ERROR 1054 (42S22): Unknown column 'empon' in 'field list'
mysql> select empno from emp
    -> where empno=7900;
+-------+
| empno |
+-------+
|  7900 |
+-------+
1 row in set (0.00 sec)

mysql> select job from emp
    -> where job="clerk";
+-------+
| job   |
+-------+
| CLERK |
| CLERK |
| CLERK |
| CLERK |
+-------+
4 rows in set (0.00 sec)

mysql> select job from emp
    -> ;
+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| SALESMAN  |
| MANAGER   |
| SALESMAN  |
| MANAGER   |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
| SALESMAN  |
| CLERK     |
| CLERK     |
| ANALYST   |
| CLERK     |
+-----------+
14 rows in set (0.00 sec)

mysql> select * from emp
    -> where id=7900;
ERROR 1054 (42S22): Unknown column 'id' in 'where clause'
mysql> select * from emp
    -> where empid=7900;
ERROR 1054 (42S22): Unknown column 'empid' in 'where clause'
mysql> select * from emp
    -> where empno=7900;
+-------+-------+-------+------+------------+--------+------+--------+
| empno | ename | job   | mgr  | hiredate   | sal    | comm | deptno |
+-------+-------+-------+------+------------+--------+------+--------+
|  7900 | JAMES | CLERK | 7698 | 1981-12-03 | 950.00 | NULL |     30 |
+-------+-------+-------+------+------------+--------+------+--------+
1 row in set (0.03 sec)

mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.00 sec)

mysql> select * from emp
    -> where job='clerk'
    -> ;
+-------+--------+-------+------+------------+---------+------+--------+
| empno | ename  | job   | mgr  | hiredate   | sal     | comm | deptno |
+-------+--------+-------+------+------------+---------+------+--------+
|  7369 | SMITH  | CLERK | 7902 | 1980-12-17 |  800.00 | NULL |     20 |
|  7876 | ADAMS  | CLERK | 7788 | 1983-01-12 | 1100.00 | NULL |     20 |
|  7900 | JAMES  | CLERK | 7698 | 1981-12-03 |  950.00 | NULL |     30 |
|  7934 | MILLER | CLERK | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+-------+------+------------+---------+------+--------+
4 rows in set (0.01 sec)

mysql> select * from emp
    -> where job='clerk' and empno=7934;
+-------+--------+-------+------+------------+---------+------+--------+
| empno | ename  | job   | mgr  | hiredate   | sal     | comm | deptno |
+-------+--------+-------+------+------------+---------+------+--------+
|  7934 | MILLER | CLERK | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+-------+------+------------+---------+------+--------+
1 row in set (0.01 sec)

mysql> select * from emp
    -> where job='clerk' and job='analyst';
Empty set (0.01 sec)

mysql> select * from emp
    -> where job in('clerk','analyst');
+-------+--------+---------+------+------------+---------+------+--------+
| empno | ename  | job     | mgr  | hiredate   | sal     | comm | deptno |
+-------+--------+---------+------+------------+---------+------+--------+
|  7369 | SMITH  | CLERK   | 7902 | 1980-12-17 |  800.00 | NULL |     20 |
|  7788 | SCOTT  | ANALYST | 7566 | 1982-12-09 | 3000.00 | NULL |     20 |
|  7876 | ADAMS  | CLERK   | 7788 | 1983-01-12 | 1100.00 | NULL |     20 |
|  7900 | JAMES  | CLERK   | 7698 | 1981-12-03 |  950.00 | NULL |     30 |
|  7902 | FORD   | ANALYST | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |
|  7934 | MILLER | CLERK   | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+---------+------+------------+---------+------+--------+
6 rows in set (0.01 sec)

mysql> select * from emp
    -> where job in('clerk','analyst',manager);
ERROR 1054 (42S22): Unknown column 'manager' in 'where clause'
mysql> select * from emp
    -> where job in('clerk','analyst','manager');
+-------+--------+---------+------+------------+---------+------+--------+
| empno | ename  | job     | mgr  | hiredate   | sal     | comm | deptno |
+-------+--------+---------+------+------------+---------+------+--------+
|  7369 | SMITH  | CLERK   | 7902 | 1980-12-17 |  800.00 | NULL |     20 |
|  7566 | JONES  | MANAGER | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
|  7698 | BLAKE  | MANAGER | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
|  7782 | CLARK  | MANAGER | 7839 | 1981-06-09 | 2450.00 | NULL |     10 |
|  7788 | SCOTT  | ANALYST | 7566 | 1982-12-09 | 3000.00 | NULL |     20 |
|  7876 | ADAMS  | CLERK   | 7788 | 1983-01-12 | 1100.00 | NULL |     20 |
|  7900 | JAMES  | CLERK   | 7698 | 1981-12-03 |  950.00 | NULL |     30 |
|  7902 | FORD   | ANALYST | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |
|  7934 | MILLER | CLERK   | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+---------+------+------------+---------+------+--------+
9 rows in set (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| employee           |
| gokul              |
| information_schema |
| mysql              |
| performance_schema |
| players            |
| sys                |
+--------------------+
7 rows in set (0.07 sec)

mysql> use gokul;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_gokul |
+-----------------+
| contactprimary  |
| dept            |
| details         |
| emailverify     |
| emp             |
| krishna         |
| native          |
| product         |
| raj             |
| student         |
+-----------------+
10 rows in set (0.03 sec)

mysql> select * from contactprimary;
+----+-----------+-----------+-------------+-------------+--------+
| id | name      | last_name | phonenumber | nationality | gender |
+----+-----------+-----------+-------------+-------------+--------+
|  1 | Gokul Raj | P         |  6384579273 | INDIAN      | m      |
|  2 |  Raj      | A         |  6334579273 | INDIAN      | F      |
|  3 | hari      | P         |  6384579293 | american    | m      |
+----+-----------+-----------+-------------+-------------+--------+
3 rows in set (0.01 sec)

mysql> insert into contactprimary values("hari","H",1234567990,"m":
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ':' at line 1
mysql> insert into contactprimary values("hari","H",1234567990,"m";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert into contactprimary values("hari","H",1234567990,"m");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into contactprimary values(4,"hari","H",1234567990,"m");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into contactprimary values(4,"hari","H",1234567990,"valparai","m");
Query OK, 1 row affected (0.08 sec)

mysql> insert into contactprimary(name,last_name,phonenumber,gender) values("hari","H",1234567990,"m");
ERROR 1062 (23000): Duplicate entry '1234567990' for key 'contactprimary.phonenumber'
mysql> insert into contactprimary(name,last_name,phonenumber,gender) values("hari","H",12345679780,"m");
Query OK, 1 row affected (0.01 sec)

mysql> insert into contactprimary(name,last_name,phonenumber,gender) values("hari","H",1234579780,"g");
ERROR 3819 (HY000): Check constraint 'contactprimary_chk_1' is violated.
mysql> select * contactprimary;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'contactprimary' at line 1
mysql> select * from contactprimary;
+----+-----------+-----------+-------------+-------------+--------+
| id | name      | last_name | phonenumber | nationality | gender |
+----+-----------+-----------+-------------+-------------+--------+
|  1 | Gokul Raj | P         |  6384579273 | INDIAN      | m      |
|  2 |  Raj      | A         |  6334579273 | INDIAN      | F      |
|  3 | hari      | P         |  6384579293 | american    | m      |
|  4 | hari      | H         |  1234567990 | valparai    | m      |
|  6 | hari      | H         | 12345679780 | NULL        | m      |
+----+-----------+-----------+-------------+-------------+--------+
5 rows in set (0.00 sec)

mysql> update contactprimary
    -> set name="raja"
    -> where id=4;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update contactprimary
    -> set id=8
    -> where id=4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from contactprimary;
+----+-----------+-----------+-------------+-------------+--------+
| id | name      | last_name | phonenumber | nationality | gender |
+----+-----------+-----------+-------------+-------------+--------+
|  1 | Gokul Raj | P         |  6384579273 | INDIAN      | m      |
|  2 |  Raj      | A         |  6334579273 | INDIAN      | F      |
|  3 | hari      | P         |  6384579293 | american    | m      |
|  6 | hari      | H         | 12345679780 | NULL        | m      |
|  8 | raja      | H         |  1234567990 | valparai    | m      |
+----+-----------+-----------+-------------+-------------+--------+
5 rows in set (0.00 sec)
