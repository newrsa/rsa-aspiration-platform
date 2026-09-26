@echo off
setlocal
taskkill /F /IM ngrok.exe >nul 2>nul
if errorlevel 1 (
  echo No active ngrok tunnel was found.
) else (
  echo Public tester access has been stopped.
)
pause
