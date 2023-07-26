@echo off
set /p directory=Enter directory path to scan : 
echo Enter what kind of scan you want to perform:
echo r to scan directories recursively
echo i to only scan infected files
echo f to force scanning of all files
echo a to scan all files including hidden ones 
echo z to scan archived files (e.g., zip files).
set /p scanType=*

if not "%scanType%"=="r" if not "%scanType%"=="i" if not "%scanType%"=="f" if not "%scanType%"=="a" if not "%scanType%"=="z" (
    echo Incorrect Option !
    exit /b 1
)
@REM "D:\ClamAv\freshclam.exe"
"D:\ClamAv\clamscan.exe" -"%scanType%" "%directory%" > scan_results.txt

REM Extract the total number of scanned files from the scan results
for /f "tokens=2 delims=:" %%a in ('findstr /c:"Scanned files" scan_results.txt') do (
    set /a totalFiles=%%a
)

REM Extract the total number of infected files from the scan results
for /f "tokens=2 delims=:" %%a in ('findstr /c:"Infected files" scan_results.txt') do (
    set /a infectedFiles=%%a
)

echo Total files scanned: %totalFiles%
echo Infected files found: %infectedFiles%
set /a riskScore=(%infectedFiles% * 100) / %totalFiles%
echo The Risk Percentage of %directory% is %riskScore%


REM Set the installation paths and filenames
@REM set "yaraZipFile=yara.zip"
@REM set "yaraInstallDir=C:\Users\91767\OneDrive\Desktop\badAssScanner"
@REM set "yaraExecutable=yara.exe"

@REM REM Download the YARA ZIP file from the official repository
@REM curl -L -o %yaraZipFile% https://github.com/VirusTotal/yara/releases/download/v4.1.0/yara-4.1.0-win64.zip

@REM REM Extract the YARA files from the ZIP archive
@REM powershell -Command "Expand-Archive -Path %yaraZipFile% -DestinationPath %yaraInstallDir%"

@REM @REM REM Add the YARA installation directory to the system's PATH environment variable
@REM @REM setx /M PATH "%yaraInstallDir%;%PATH%"

@REM @REM REM Display success message
@REM @REM echo YARA has been successfully installed.

@REM @REM REM Clean up the downloaded ZIP file
@REM @REM del %yaraZipFile%

@REM @REM REM Exit the script
@REM @REM exit /B


@REM @REM yara -r C:\Users\91767\OneDrive\Desktop\badAssScanner\YARA\Rules.yar "%directory%"