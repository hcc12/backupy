::tworzenie backupa
@echo off
set bkdir=C:\xampp\htdocs\wordpress
set dbname=wordpress
set dbuser=root
set dbpass=
set mysqlpath=C:\xampp\mysql\bin
CScript zip.vbs %bkdir% %cd%\backup.zip
%mysqlpath%\mysqldump %dbname% -u %dbuser% > %cd%\backup.sql
pause
