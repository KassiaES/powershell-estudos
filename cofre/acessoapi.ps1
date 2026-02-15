

# Script simples - Acessar BeyondTrust via API
# Configure aqui suas credenciais:
$BaseUrl = "https://suaempresa.beyondtrustcloud.com/api/v1"
$ApiKey = "sua-api-key-aqui"

# Testa se a API está funcionando
Write-Host "Testando API..." -ForegroundColor Yellow

# Monta o cabeçalho da requisição
$headers = @{
    'Authorization' = "Bearer $ApiKey"
    'Content-Type' = 'application/json'
}

try {
    # Faz a chamada para a API
    $url = "$BaseUrl/accounts"
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method GET
    
    Write-Host "Sucesso! API funcionando." -ForegroundColor Green
    Write-Host "Contas encontradas: $($response.Count)" -ForegroundColor White
    
    # Mostra as primeiras 3 contas
    if ($response.Count -gt 0) {
        Write-Host "`nPrimeiras contas:" -ForegroundColor Cyan
        $response | Select-Object -First 3 | ForEach-Object {
            Write-Host "- $($_.Name)" -ForegroundColor Yellow
        }
    }
    
} catch {
    Write-Host "Erro na API: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Verifique suas credenciais nas linhas 3 e 4" -ForegroundColor Yellow
}