@ECHO OFF
ECHO System will be turned off automatically in 5 minutes. Press N to cancel.
ECHO.
CHOICE /M "Shutdown" /C YN /T 300 /D Y
IF ERRORLEVEL 1 IF NOT ERRORLEVEL 2 SHUTDOWN -s -t 60
IF ERRORLEVEL 2 ECHO Shutdown cancelled

REM Wait 2 sec
CHOICE /C AB /T 2 /D A > NUL