@echo off
set bkdir=C:\xampp\htdocs\wordpress
set dbname=wordpress
set dbuser=root
set dbpass=
set mysqlpath=C:\xampp\mysql\bin
CScript unzip.vbs %cd%\backup.zip %bkdir%
@echo CREATE DATABASE %dbname% > %cd%\tmp.sql
%mysqlpath%\mysql -u %dbuser% < %cd%\tmp.sql
%mysqlpath%\mysql %dbname% -u %dbuser% < %cd%\backup.sql
del %cd%\tmp.sql
pause
