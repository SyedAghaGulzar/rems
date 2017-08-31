@echo off
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :3306') DO TaskKill.exe /F /PID %%P
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :9090') DO TaskKill.exe /F /PID %%P
start C:\xampp\mysql\bin\mysqld.exe
timeout 10 > NUL
start /min javaw -Xmx1024m -Xms328m -jar ..\target\rems.jar
exit