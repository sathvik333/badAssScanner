@echo off
set /p directory=Enter directory path to scan badAsses: 
echo Enter what kind of scan you want to perform:
echo r to scan directories recursively
echo i to only scan infected files
echo f to force scanning of all files
echo a to scan all files including hidden ones 
echo z to scan archived files (e.g., zip files).
set /p scanType=

if not "%scanType%"=="r" if not "%scanType%"=="i" if not "%scanType%"=="f" if not "%scanType%"=="a" if not "%scanType%"=="z" (
    echo Asshole dont play smart.
    exit /b 1
)

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