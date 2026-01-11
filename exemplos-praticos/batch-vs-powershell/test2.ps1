# Script PowerShell equivalente ao test1.bat
# Gerencia o serviço "Bytebank Interface Service" no servidor XPTO1

Write-Host "Buscando serviço 'Bytebank Interface Service' no servidor XPTO1"

try {
    # Consulta o status do serviço no servidor remoto
    $servico = Invoke-Command -ComputerName "XPTO1" -ScriptBlock { 
        Get-Service -Name "Bytebank Interface Service" -ErrorAction Stop
    }
    
    # Verifica se o serviço está em execução
    if ($servico.Status -eq "Running") {
        Write-Host "Parando o serviço..."
        Invoke-Command -ComputerName "XPTO1" -ScriptBlock { 
            Stop-Service -Name "Bytebank Interface Service" -Force
        }
        
        # Aguarda um momento para garantir que o serviço parou
        Start-Sleep -Seconds 2
        
        Write-Host "Iniciando o serviço..."
        Invoke-Command -ComputerName "XPTO1" -ScriptBlock { 
            Start-Service -Name "Bytebank Interface Service"
        }
        
        Write-Host "Serviço reiniciado com sucesso."
    } else {
        Write-Host "Serviço não encontrado ou não está em execução."
    }
} catch {
    Write-Host "Serviço não encontrado ou não está em execução."
    Write-Host "Erro: $($_.Exception.Message)"
}