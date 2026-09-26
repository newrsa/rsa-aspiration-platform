$ErrorActionPreference = 'Stop'
$project = Split-Path -Parent $PSScriptRoot
$settingsPath = Join-Path $project '.tunnel.env'

if (-not (Test-Path -LiteralPath $settingsPath)) {
  throw 'Copy .tunnel.example to .tunnel.env and set a tester username and strong password.'
}

$settings = @{}
Get-Content -LiteralPath $settingsPath | ForEach-Object {
  if ($_ -match '^([^#=]+)=(.*)$') { $settings[$matches[1].Trim()] = $matches[2].Trim() }
}
if (-not $settings.TESTER_USERNAME -or -not $settings.TESTER_PASSWORD -or $settings.TESTER_PASSWORD -like 'replace-*') {
  throw 'Complete TESTER_USERNAME and TESTER_PASSWORD in .tunnel.env.'
}

$ngrok = (Get-Command ngrok -ErrorAction SilentlyContinue).Source
if (-not $ngrok) {
  $ngrok = Get-ChildItem -LiteralPath "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter ngrok.exe -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName
}
if (-not $ngrok) { throw 'ngrok is not installed.' }

& $ngrok config check *> $null
if ($LASTEXITCODE -ne 0) { throw 'ngrok is not connected to an account. Add the account authtoken first.' }

Write-Host 'Starting protected HTTPS tunnel. Keep this window open.' -ForegroundColor Green
Write-Host 'Share the HTTPS forwarding address plus the separate tester username and password.'
& $ngrok http --basic-auth="$($settings.TESTER_USERNAME):$($settings.TESTER_PASSWORD)" --host-header=rewrite http://localhost:3000
