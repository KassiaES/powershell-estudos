# Script simples - Acessar BeyondTrust via navegador
# Edite a linha abaixo com sua URL real:
$MinhaUrl = "https://suaempresa.beyondtrustcloud.com/saml/login"

# Abre o navegador
Write-Host "Abrindo BeyondTrust..." -ForegroundColor Green
Start-Process $MinhaUrl

# Aguarda 15 segundos
Write-Host "Aguardando 15 segundos..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

# Fecha o navegador
Write-Host "Fechando navegador..." -ForegroundColor Red
Stop-Process -Name "msedge", "chrome" -Force -ErrorAction SilentlyContinue

Write-Host "Pronto!" -ForegroundColor Green