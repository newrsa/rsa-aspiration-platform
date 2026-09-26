@echo off
setlocal
cd /d "%~dp0"
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\start-secure-tunnel.ps1"
if errorlevel 1 (
  echo.
  echo The secure tunnel could not start. Review docs\SECURE_TUNNEL.md.
  pause
)
