@echo off
setlocal
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is not available. Install Node.js 22 or newer, then try again.
  pause
  exit /b 1
)

if not exist ".env.local" (
  echo Setup is incomplete. Copy .env.example to .env.local and enter the Neo4j password.
  pause
  exit /b 1
)

echo Starting RSA Career Guide for this PC and the trusted local network...
start "RSA Career Guide" /min cmd /c "npm run dev:lan"
timeout /t 5 /nobreak >nul
start "" "http://localhost:3000"
echo The career chatbot should now be open. Keep the minimized server window running.
pause
