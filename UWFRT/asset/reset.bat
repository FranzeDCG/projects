@echo off
color 0F
title UWFRT :: Reset script
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as an administrator.
    pause
    exit /b
)
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force"
powershell -Command "
try {
    Write-Host 'Starting Windows reset...'
    # Trigger Windows reset (remove everything)
    Start-Process -FilePath 'systemreset.exe' -ArgumentList '/factoryreset' -Wait
    Write-Host 'Windows reset command executed.'
} catch {
    Write-Error 'An error occurred during the reset process: $_'
}
"
echo We are now rebooting your Windows. Stand by please.
ping localhost -n 3 >NUL
shutdown /r /t 0
