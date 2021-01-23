@echo off

set ZH_HOME=%1
set BASE=%~dp0

if "%TARGET%" == "" (
	echo setup.cmd targetfolder\
	exit /B 1
)

cd %BASE%
git pull

copy /F zh_download.cmd %ZH_HOME%

exit /B 0


copy /F controller.cmd %ZH_HOME%

call :MAKELINK "ziphttpd"
call :MAKELINK "selector"

exit /B 0


:MAKELINK
	set PRJ=%1
	mklink %PRJ%.cmd %ZH_HOME%\controller.cmd

exit /B
