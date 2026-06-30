$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$bundledPython = "C:\Users\USER\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
$python = if (Test-Path $bundledPython) { $bundledPython } else { (Get-Command python -ErrorAction SilentlyContinue).Source }
if (-not $python) { Write-Host "Python is required to start the local PWA server."; exit 1 }

Set-Location $root
& $python -m http.server 8787
