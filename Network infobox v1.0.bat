@echo off 
@setlocal enableextensions
mode con:cols=22 lines=13
color a
echo. 
echo.
:connectionchecker
cls

set ip_address_string="IPv4 Address"
for /f "tokens=3,4" %%i in ('netsh wlan show interface ^| findstr /i "Profile"') do echo %%i %%j
echo.
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do echo IP=%%f
echo.
for /f "tokens=5" %%a in ('ping -n 1 www.google.com ^| findstr /i "time="') do echo Ping%%a
echo.
for /f "tokens=10" %%b in ('ping -n 1 www.google.com ^| findstr /i "lost"') do echo Packetloss=%%b

ping www.google.com -n 1 >nul
if not errorlevel 1 (echo. & echo Connected!)
if errorlevel 1 (cls & echo. & echo     Disconnected..)

TIMEOUT /T 5 >nul
goto connectionchecker
exit /b