%1

@echo off

set DEV=0

echo "START"
if %DEV%==1 (
	if "%1"=="" goto :dead
	if "%1"=="debug" goto :dead
	if "%1"=="release" goto :publication
) ELSE ( 
	if "%1"=="" goto :dead
	if "%1"=="debug" goto :publication
	if "%1"=="release" goto :publication
)
                                        
:publication
echo "publication"
rem PREPARE DATESTAMP -----------------------------------------------------------
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%%MM%%DD%_%HH%%Min%%Sec%"
rem ------------------ DEFINE FILE NAMES ------------------------------
set serverFolderName=trouble
set mainScript=trouble
rem -------------------------------------------------------------------
set oldScriptName=%mainScript%.js
set newScriptName=%mainScript%_%fullstamp%.js

set newScriptNameMin=%mainScript%_%fullstamp%.min.js
set newMapName=%mainScript%_%fullstamp%.js.map
rem PREPARE and CLEAR OLD FILE removal  -------------------------------
set BINDIR=%cd%\export\html5\bin\
set ASSETSDIR=%BINDIR%\assets\
set FILESDELETE=%BINDIR%%mainScript%_20*

rem --------- ^ is the escape char for batch !!! --------------
set "HOWL_TARGET=^<link rel="shortcut icon" type="image/png" href="./favicon.png"^>"
set "HOWL=^<script type="text/javascript" src="./howl.js"^>^</script^>
rem DELETE  ----------------------------------------------------------

del /F %FILESDELETE%
:next

powershell -Command "Rename-Item -Path "%BINDIR%/index.html" -NewName tmp.html"
powershell -Command "Rename-Item -Path "%BINDIR%/index_howl.html" -NewName index.html"
powershell -Command "Rename-Item -Path "%BINDIR%/tmp.html" -NewName index_howl.html"


echo "DEV=%DEV%"
if %DEV%==1 (
	if "%1"=="release" goto :minify
	powershell -Command "(gc %BINDIR%/index.html) -replace './%oldScriptName%', './%newScriptName%' | Out-File -encoding UTF8 %BINDIR%/index.html"
	if "%1"=="debug" goto :follow
) ELSE (
	goto :minify
)


:minify
echo "MINIFY"
powershell -Command "(gc %BINDIR%/index.html) -replace './%oldScriptName%', './%newScriptNameMin%' | Out-File -encoding UTF8 %BINDIR%/index.html"
powershell -Command "Rename-Item -Path "%BINDIR%/%mainScript%.min.js" -NewName %newScriptNameMin%"
powershell -Command "Rename-Item -Path "%BINDIR%/%mainScript%.js.map" -NewName %newMapName%"

goto :EXPORT

:follow
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% add ."
powershell -Command "Rename-Item -Path "%BINDIR%/%mainScript%.js" -NewName %newScriptName%"
powershell -Command "Rename-Item -Path "%BINDIR%/%mainScript%.js.map" -NewName %newMapName%"


:EXPORT



if %DEV%==1 (
	if "%1"=="" goto :dead
	if "%1"=="debug" goto :dead
	if "%1"=="release" goto :test
) ELSE ( 
	if "%1"=="" goto :dead
	if "%1"=="debug" goto :test
	if "%1"=="release" goto :release
)


:test

powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% add ."
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% commit -am pushing_to_test"
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% push origin dev"

powershell -Command "git checkout dev"
powershell -Command "git add ."
powershell -Command "git commit -am auto_commit_to_dev"
powershell -Command "git push origin dev"

goto :completed

:release
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% add ."
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% commit -am pushing_to_prod"
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% push origin master"

powershell -Command "git checkout master"
powershell -Command "git merge dev"
powershell -Command "git commit -am auto_commit_to_master"
powershell -Command "git push origin master"
powershell -Command "git checkout dev"

goto :completed

:end
echo "JUST DEBUGGING"
:dead
echo "NO DIRECTIVES"

 
rem "C:\HaxeToolkit\haxe/haxelib" run lime build "Project_demo_outages.xml" html5 -debug -Dfdb

:completed

echo "completed "%1