param ($diretorio)

$ErrorActionPreference = "Stop"

. .\ShaFile.ps1

$arquivos = Get-ChildItem $diretorio -File

Write-Host "=======================================" -ForegroundColor Cyan
Write-Host "ANÁLISE DE HASH DE MÚLTIPLOS ARQUIVOS" -ForegroundColor Cyan -BackgroundColor Black
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host "Diretório: $diretorio" -ForegroundColor White
Write-Host ""

foreach ($item in $arquivos) {
    Write-Host "Arquivo: $($item.Name)" -ForegroundColor Yellow
    
    # Calcular todos os hashes
    $hashMD5 = Get-FileMD5 $item.FullName
    $hashSHA1 = Get-FileSHA1 $item.FullName
    $hashSHA256 = Get-FileSHA256 $item.FullName
    $hashSHA384 = Get-FileSHA384 $item.FullName
    $hashSHA512 = Get-FileSHA512 $item.FullName
    
    # Exibir todos os hashes
    Write-Host "  MD5:    $hashMD5" -ForegroundColor Green
    Write-Host "  SHA1:   $hashSHA1" -ForegroundColor Green
    Write-Host "  SHA256: $hashSHA256" -ForegroundColor Green
    Write-Host "  SHA384: $hashSHA384" -ForegroundColor Green
    Write-Host "  SHA512: $hashSHA512" -ForegroundColor Green
    Write-Host ""
}

Write-Host "=======================================" -ForegroundColor Cyan
[Console]::ResetColor()