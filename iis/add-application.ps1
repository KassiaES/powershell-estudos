# Função simples para criar application pools no IIS em vários servidores
function Add-ApplicationPool {
    param(
        [string[]]$ComputerNames,  # Lista de servidores
        [string]$AppPoolName       # Nome do application pool
    )
    
    Write-Host "Criando application pool '$AppPoolName'..." -ForegroundColor Green
    
    # Para cada servidor na lista
    foreach ($servidor in $ComputerNames) {
        Write-Host "Processando servidor: $servidor" -ForegroundColor Yellow
        
        try {
            # Testa se o servidor está online
            if (Test-Connection -ComputerName $servidor -Count 1 -Quiet) {
                
                # Executa o comando no servidor remoto
                $resultado = Invoke-Command -ComputerName $servidor -ScriptBlock {
                    param($NomePool)
                    
                    # Caminho do appcmd.exe
                    $appcmd = "C:\Windows\System32\inetsrv\appcmd.exe"
                    
                    # Comando para criar o application pool
                    $comando = "add apppool /name:$NomePool /managedRuntimeVersion:v4.0 /managedPipelineMode:Integrated"
                    
                    # Executa o comando
                    & $appcmd $comando
                    
                } -ArgumentList $AppPoolName
                
                Write-Host "  ✓ Sucesso no servidor $servidor" -ForegroundColor Green
            }
            else {
                Write-Host "  ✗ Servidor $servidor não está acessível" -ForegroundColor Red
            }
        }
        catch {
            Write-Host "  ✗ Erro no servidor ${servidor}: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    
    Write-Host "Processo finalizado!" -ForegroundColor Cyan
}

# Como usar a função:

# Exemplo 1: Criar application pool em 3 servidores
$servidores = @("SRV-WEB01", "SRV-WEB02", "SRV-WEB03")
Add-ApplicationPool -ComputerNames $servidores -AppPoolName "ByteBankApp"

# Exemplo 2: Criar em apenas um servidor
Add-ApplicationPool -ComputerNames @("SRV-WEB01") -AppPoolName "MeuApp"
