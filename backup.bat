@echo off
setlocal ENABLEDELAYEDEXPANSION
set bkdir=C:\xampp\htdocs\wordpress
set dbname=wordpress
set dbuser=root
set dbpass=
set mysqlpath=C:\xampp\mysql\bin
set bkfile=%1
set abspath=0

echo %bkfile%|find ":\" >nul
if not errorlevel 1 set abspath=1

echo %bkfile%|find ":/" >nul
if not errorlevel 1 set abspath=1

if %abspath%==0 set bkfile=%cd%\%bkfile%

if not exist "%bkfile%.zip" (
	set bkfile=backup%1
	if %abspath%==0 set bkfile=%cd%\!bkfile!
	if not exist "!bkfile!.zip" goto:eof
)

CScript unzip.vbs %bkfile%.zip %bkdir%
@echo CREATE DATABASE %dbname% > %cd%\tmp.sql
%mysqlpath%\mysql -u %dbuser% < %cd%\tmp.sql
%mysqlpath%\mysql %dbname% -u %dbuser% < %bkfile%.sql
del %cd%\tmp.sql
pause
