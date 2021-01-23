rem @echo off

set ZH_HOME=%1
set SCRIPTDIR=%~dp0

if "%TARGET%" == "" (
	echo setup.cmd targetfolder\
	exit /B 1
)

cd %SCRIPTDIR%
git pull

set FILE=zh_download.cmd
set SOURCE=%SCRIPTDIR%%FILE%
set TARGET=%ZH_HOME%%FILE%

if exist %TARGET%.old del /Y %TARGET%.old
if exist %TARGET% ren %TARGET% %TARGET%.old
copy z%SOURCE% %TARGET%

exit /B 0


copy /Y controller.cmd %ZH_HOME%

call :MAKELINK "ziphttpd"
call :MAKELINK "selector"

exit /B 0


:MAKELINK
	set PRJ=%1
	mklink %PRJ%.cmd %ZH_HOME%\controller.cmd

exit /B
