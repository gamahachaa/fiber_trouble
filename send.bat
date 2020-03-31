%1

@echo off

rem PREPARE DATESTAMP ------------------------------------------------------------------------------------------------------------------------------
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%%MM%%DD%_%HH%%Min%%Sec%"
rem DEFINE FILE NAMES ------------------------------------------------------------------------------------------------------------------------------
set oldScriptName=nointernet.js
set newScriptName=nointernet_%fullstamp%%.js
set newMapName=nointernet_%fullstamp%%.js.map
rem PREPARE and CLEAR OLD FILE removal  ------------------------------------------------------------------------------------------------------------------------------
set BINDIR=%cd%\export\html5\bin\
set FILESDELETE=%BINDIR%nointernet_20*
rem DELETE  ------------------------------------------------------------------------------------------------------------------------------
del /F %FILESDELETE%
rem REPLACE META LINK TO JS FILES  ------------------------------------------------------------------------------------------------------------------------------
powershell -Command "(gc %BINDIR%/index.html) -replace './%oldScriptName%', './%newScriptName%' | Out-File -encoding UTF8 %BINDIR%/index.html"
powershell -Command "(gc %BINDIR%/index.html) -replace 'background: #000000;', 'background: #4c4d4d;' | Out-File -encoding UTF8 %BINDIR%/index.html"
rem REENAME JS FILES  ------------------------------------------------------------------------------------------------------------------------------
powershell -Command "Rename-Item -Path "%BINDIR%/nointernet.js" -NewName %newScriptName%"
powershell -Command "Rename-Item -Path "%BINDIR%/nointernet.js.map" -NewName %newMapName%"


if "%1"=="debug" goto :end

rem PUSH to SERVER  ------------------------------------------------------------------------------------------------------------------------------
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.192.14.13/ -hostkey=""ssh-rsa 2048 nqlUJZBRZk4+gCB8pRNrGcXJrx13iKLTftGfrXlqvk4=""" ^
    "lcd %BINDIR%\flixel" ^
    "cd /home/qook/app/entry_point_qook/trouble/flixel" ^
    "put -nopreservetime *" ^
    "exit"

"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.192.14.13/ -hostkey=""ssh-rsa 2048 nqlUJZBRZk4+gCB8pRNrGcXJrx13iKLTftGfrXlqvk4=""" ^
    "lcd %BINDIR%\manifest" ^
    "cd /home/qook/app/entry_point_qook/trouble/manifest" ^
    "put -nopreservetime *" ^
    "exit"

"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.192.14.13/ -hostkey=""ssh-rsa 2048 nqlUJZBRZk4+gCB8pRNrGcXJrx13iKLTftGfrXlqvk4=""" ^
    "lcd %BINDIR%\lib" ^
    "cd /home/qook/app/entry_point_qook/trouble/lib" ^
    "put -nopreservetime *" ^
    "exit"
rem delete old JS
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.192.14.13/ -hostkey=""ssh-rsa 2048 nqlUJZBRZk4+gCB8pRNrGcXJrx13iKLTftGfrXlqvk4=""" ^
    "cd /home/qook/app/entry_point_qook/trouble/" ^
    "rm *.js" ^
    "exit"
rem add new JS
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.192.14.13/ -hostkey=""ssh-rsa 2048 nqlUJZBRZk4+gCB8pRNrGcXJrx13iKLTftGfrXlqvk4=""" ^
    "lcd %BINDIR%\" ^
    "cd /home/qook/app/entry_point_qook/trouble/" ^
    "put -nopreservetime *.js" ^
    "exit"
rem delete old JS MAP	
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.192.14.13/ -hostkey=""ssh-rsa 2048 nqlUJZBRZk4+gCB8pRNrGcXJrx13iKLTftGfrXlqvk4=""" ^
    "cd /home/qook/app/entry_point_qook/trouble" ^
    "rm *.js.map" ^
    "exit"
rem add new MAP	
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.192.14.13/ -hostkey=""ssh-rsa 2048 nqlUJZBRZk4+gCB8pRNrGcXJrx13iKLTftGfrXlqvk4=""" ^
    "lcd %BINDIR%" ^
    "cd /home/qook/app/entry_point_qook/trouble" ^
    "put -nopreservetime *.js.map" ^
    "exit"
	
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.192.14.13/ -hostkey=""ssh-rsa 2048 nqlUJZBRZk4+gCB8pRNrGcXJrx13iKLTftGfrXlqvk4=""" ^
    "lcd %BINDIR%\" ^
    "cd /home/qook/app/entry_point_qook/trouble" ^
    "put -nopreservetime index.html" ^
    "exit"

:end
rem PUSH to TEST SERVER  ------------------------------------------------------------------------------------------------------------------------------
robocopy export\html5\bin "C:\xampp\htdocs\localhost" * /E

"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.193.14.13/ -hostkey=""ssh-rsa 2048 wS00k9P56QO60lm1NS8bO+nPtjNA0htnzu/XzCyhfQg=""" ^
    "lcd %BINDIR%\flixel" ^
    "cd /home/qook/app/qook/trouble/flixel" ^
    "put -nopreservetime *" ^
    "exit"

"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.193.14.13/ -hostkey=""ssh-rsa 2048 wS00k9P56QO60lm1NS8bO+nPtjNA0htnzu/XzCyhfQg=""" ^
    "lcd %BINDIR%\manifest" ^
    "cd /home/qook/app/qook/trouble/manifest" ^
    "put -nopreservetime *" ^
    "exit"

"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.193.14.13/ -hostkey=""ssh-rsa 2048 wS00k9P56QO60lm1NS8bO+nPtjNA0htnzu/XzCyhfQg=""" ^
    "lcd %BINDIR%\lib" ^
    "cd /home/qook/app/qook/trouble/lib" ^
    "put -nopreservetime *" ^
    "exit"
rem delete old JS
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.193.14.13/ -hostkey=""ssh-rsa 2048 wS00k9P56QO60lm1NS8bO+nPtjNA0htnzu/XzCyhfQg=""" ^
    "cd /home/qook/app/qook/trouble/" ^
    "rm *.js" ^
    "exit"
rem add new JS	
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.193.14.13/ -hostkey=""ssh-rsa 2048 wS00k9P56QO60lm1NS8bO+nPtjNA0htnzu/XzCyhfQg=""" ^
    "lcd %BINDIR%\" ^
    "cd /home/qook/app/qook/trouble/" ^
    "put -nopreservetime *.js" ^
    "exit"
	
rem delete old JS MAP	
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.193.14.13/ -hostkey=""ssh-rsa 2048 wS00k9P56QO60lm1NS8bO+nPtjNA0htnzu/XzCyhfQg=""" ^
    "cd /home/qook/app/qook/trouble" ^
    "rm *.js.map" ^
    "exit"
	
rem add new JS MAP	
"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.193.14.13/ -hostkey=""ssh-rsa 2048 wS00k9P56QO60lm1NS8bO+nPtjNA0htnzu/XzCyhfQg=""" ^
    "lcd %BINDIR%" ^
    "cd /home/qook/app/qook/trouble" ^
    "put -nopreservetime *.js.map" ^
    "exit"

"C:\_mesProgs\WinSCP\WinSCP.com" ^
  /log="%cd%\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://qook:uU155cy54IGQf0M4Jek6@10.193.14.13/ -hostkey=""ssh-rsa 2048 wS00k9P56QO60lm1NS8bO+nPtjNA0htnzu/XzCyhfQg=""" ^
    "lcd %BINDIR%\" ^
    "cd /home/qook/app/qook/trouble" ^
    "put -nopreservetime index.html" ^
    "exit"
