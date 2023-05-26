@echo off

set /p directory=Enter directory path: 

if not exist "%directory%" (
  echo Directory does not exist
  pause
  exit /b
)

@REM if not exist "C:\Program Files (x86)\ClamWin\bin\clamscan.exe" (
@REM   echo ClamAV is not installed
@REM   pause
@REM   exit /b
@REM )

"D:\ClamAv\clamscan.exe" -r "%directory%" > scan_results.txt

if errorlevel 1 (
  echo ClamAV scan found viruses
  pause
) else (
  echo ClamAV scan completed successfully
  pause
)
