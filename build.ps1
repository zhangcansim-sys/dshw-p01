#!/usr/bin/env pwsh
<#
Simple PowerShell build script to render the Quarto book locally.
Usage: ./build.ps1
#>
try {
    $q = & quarto --version 2>$null
} catch {
    Write-Host "Quarto not found in PATH. Install Quarto from https://quarto.org and retry." -ForegroundColor Yellow
    exit 1
}

Write-Host "Quarto detected: $q" -ForegroundColor Green

Write-Host "Rendering Quarto book..." -ForegroundColor Cyan
quarto render .

if ($LASTEXITCODE -eq 0) {
    Write-Host "Render complete. Output in _site/" -ForegroundColor Green
} else {
    Write-Host "Render failed with exit code $LASTEXITCODE" -ForegroundColor Red
    exit $LASTEXITCODE
}
