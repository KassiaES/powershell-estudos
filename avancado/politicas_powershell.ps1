# Guia de Edição de Políticas no PowerShell
# Gerenciamento de Group Policy e Local Security Policy

<#
=== O QUE SÃO POLÍTICAS NO WINDOWS ===
1. Group Policy (GPO) - Políticas de domínio e locais
2. Local Security Policy - Políticas de segurança local
3. Execution Policy - Políticas de execução do PowerShell
4. Audit Policy - Políticas de auditoria
#>

# ================================
# 1. EXECUTION POLICY (PowerShell)
# ================================

# Verificar política atual
Write-Host "=== EXECUTION POLICY ATUAL ===" -ForegroundColor Green

# Política efetiva atual
Write-Host "Política efetiva atual:"
Get-ExecutionPolicy

# Todas as políticas por escopo
Write-Host "`nTodas as políticas por escopo:"
Get-ExecutionPolicy -List | Format-Table -AutoSize

# Explicação dos valores possíveis
Write-Host "`n=== VALORES DE EXECUTION POLICY ===" -ForegroundColor Yellow
Write-Host "Restricted      : Não permite execução de scripts (padrão Windows Client)"
Write-Host "AllSigned       : Apenas scripts assinados digitalmente"
Write-Host "RemoteSigned    : Scripts locais livres, remotos precisam ser assinados"
Write-Host "Unrestricted    : Permite todos os scripts (avisa sobre scripts remotos)"
Write-Host "Bypass          : Nenhuma verificação (usado temporariamente)"
Write-Host "Undefined       : Nenhuma política definida neste escopo"

# Explicação dos escopos
Write-Host "`n=== ESCOPOS DE EXECUTION POLICY ===" -ForegroundColor Yellow
Write-Host "MachinePolicy   : Política definida por GPO para a máquina"
Write-Host "UserPolicy      : Política definida por GPO para o usuário"
Write-Host "Process         : Política para a sessão PowerShell atual"
Write-Host "CurrentUser     : Política para o usuário atual"
Write-Host "LocalMachine    : Política para todos os usuários da máquina"

# Verificar fonte da política atual
Write-Host "`nFonte da política efetiva:"
$effectivePolicy = Get-ExecutionPolicy
$policySource = Get-ExecutionPolicy -List | Where-Object { $_.ExecutionPolicy -eq $effectivePolicy -and $_.ExecutionPolicy -ne "Undefined" } | Select-Object -First 1
if ($policySource) {
    Write-Host "Política '$effectivePolicy' vem do escopo: $($policySource.Scope)" -ForegroundColor Cyan
} else {
    Write-Host "Usando política padrão do sistema" -ForegroundColor Cyan
}

# Alterar Execution Policy (requer Admin para alguns escopos)
Write-Host "`n=== EXEMPLOS DE ALTERAÇÃO ===" -ForegroundColor Green
Write-Host "Para usuário atual (não requer Admin):"
Write-Host "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
Write-Host ""
Write-Host "Para toda a máquina (requer Admin):"
Write-Host "Set-ExecutionPolicy RemoteSigned -Scope LocalMachine"
Write-Host ""
Write-Host "Temporariamente para esta sessão:"
Write-Host "Set-ExecutionPolicy Bypass -Scope Process"

# ================================
# 2. GROUP POLICY CMDLETS
# ================================

Write-Host "`n=== GROUP POLICY MANAGEMENT ===" -ForegroundColor Green

# Verificar se módulo GroupPolicy está disponível
if (Get-Module -ListAvailable -Name GroupPolicy) {
    Import-Module GroupPolicy
    
    # Listar todas as GPOs
    Write-Host "GPOs disponíveis:"
    # Get-GPO -All | Select-Object DisplayName, GPOStatus
    
    # Criar nova GPO
    # New-GPO -Name "Política de Teste" -Comment "GPO criada via PowerShell"
    
    # Backup de GPO
    # Backup-GPO -Name "Default Domain Policy" -Path "C:\GPO_Backup"
    
    # Restaurar GPO
    # Restore-GPO -BackupId {GUID} -Path "C:\GPO_Backup" -TargetName "Nova GPO"
    
} else {
    Write-Host "Módulo GroupPolicy não disponível (requer Windows Server ou RSAT)" -ForegroundColor Yellow
}

# ================================
# 3. LOCAL SECURITY POLICY
# ================================

Write-Host "`n=== LOCAL SECURITY POLICY ===" -ForegroundColor Green

# Verificar políticas de senha locais
Write-Host "Política de senha atual:"
net accounts

# Verificar audit policy
Write-Host "`nPolíticas de auditoria:"
auditpol /get /category:*

# Configurar política de auditoria (requer Admin)
# auditpol /set /subcategory:"Logon" /success:enable /failure:enable

# ================================
# 4. REGISTRY-BASED POLICIES
# ================================

Write-Host "`n=== POLÍTICAS VIA REGISTRY ===" -ForegroundColor Green

# Verificar política de UAC
$uacKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
if (Test-Path $uacKey) {
    $uacValue = Get-ItemProperty -Path $uacKey -Name "EnableLUA" -ErrorAction SilentlyContinue
    if ($uacValue) {
        Write-Host "UAC Status: $($uacValue.EnableLUA) (1=Enabled, 0=Disabled)"
    }
}

# Verificar política de Windows Update
$wuKey = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
if (Test-Path $wuKey) {
    Write-Host "Políticas Windows Update configuradas"
    Get-ItemProperty -Path $wuKey | Format-List
} else {
    Write-Host "Nenhuma política Windows Update configurada"
}

# ================================
# 5. SECEDIT - SECURITY POLICY
# ================================

Write-Host "`n=== SECURITY POLICY (SECEDIT) ===" -ForegroundColor Green

# Exportar configurações de segurança atuais
$secConfig = "$env:TEMP\current_security.cfg"
Write-Host "Exportando configuração de segurança para: $secConfig"

try {
    Start-Process secedit -ArgumentList "/export /cfg `"$secConfig`"" -Wait -NoNewWindow
    
    if (Test-Path $secConfig) {
        Write-Host "Configuração exportada com sucesso!"
        # Mostrar algumas linhas do arquivo
        Write-Host "`nPrimeiras linhas da configuração:"
        Get-Content $secConfig | Select-Object -First 10
    }
} catch {
    Write-Host "Erro ao exportar configuração: $($_.Exception.Message)" -ForegroundColor Red
}

# ================================
# 6. EXEMPLOS PRÁTICOS
# ================================

Write-Host "`n=== EXEMPLOS PRÁTICOS ===" -ForegroundColor Green

# Função para verificar se é Admin
function Test-IsAdmin {
    return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (Test-IsAdmin) {
    Write-Host "✓ Executando como Administrador" -ForegroundColor Green
    
    # Exemplo: Configurar política de bloqueio de conta
    Write-Host "`nExemplo - Política de Bloqueio de Conta:"
    Write-Host "Para configurar bloqueio após 3 tentativas inválidas:"
    Write-Host "net accounts /lockoutthreshold:3 /lockoutduration:30 /lockoutwindow:30"
    
    # Exemplo: Política de senha
    Write-Host "`nExemplo - Política de Senha:"
    Write-Host "Para configurar idade mínima de senha (7 dias):"
    Write-Host "net accounts /minpwage:7"
    
} else {
    Write-Host "⚠ Não executando como Administrador - algumas funções limitadas" -ForegroundColor Yellow
}

# ================================
# 7. FUNÇÕES UTILITÁRIAS
# ================================

function Get-PasswordPolicy {
    <#
    .SYNOPSIS
    Obtém a política de senha atual do sistema
    #>
    Write-Host "=== POLÍTICA DE SENHA ATUAL ===" -ForegroundColor Cyan
    $output = net accounts
    $output | Where-Object { $_ -match "password|lockout|age" }
}

function Get-AuditPolicy {
    <#
    .SYNOPSIS
    Obtém as políticas de auditoria atuais
    #>
    Write-Host "=== POLÍTICAS DE AUDITORIA ATUAL ===" -ForegroundColor Cyan
    auditpol /get /category:* | Where-Object { $_ -match "Success|Failure" }
}

function Show-SecuritySettings {
    <#
    .SYNOPSIS
    Mostra um resumo das configurações de segurança importantes
    #>
    Write-Host "=== RESUMO DE SEGURANÇA ===" -ForegroundColor Cyan
    
    # UAC Status
    $uac = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableLUA -ErrorAction SilentlyContinue
    Write-Host "UAC: $(if($uac.EnableLUA -eq 1){'Enabled'}else{'Disabled'})"
    
    # Windows Defender
    if (Get-Command Get-MpPreference -ErrorAction SilentlyContinue) {
        $defender = Get-MpPreference
        Write-Host "Windows Defender Real-time: $($defender.DisableRealtimeMonitoring -eq $false)"
    }
    
    # Windows Update
    $wu = Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -ErrorAction SilentlyContinue
    if ($wu) {
        Write-Host "Windows Update: Políticas corporativas aplicadas"
    } else {
        Write-Host "Windows Update: Configuração padrão"
    }
}

# ================================
# 8. EXECUÇÃO DOS EXEMPLOS
# ================================

Write-Host "`n=== EXECUTANDO VERIFICAÇÕES ===" -ForegroundColor Magenta

# Executa as funções criadas
Get-PasswordPolicy
Write-Host ""
Get-AuditPolicy | Select-Object -First 5  # Mostra apenas primeiras 5 linhas
Write-Host ""
Show-SecuritySettings

Write-Host "`n=== SCRIPT CONCLUÍDO ===" -ForegroundColor Green
Write-Host "Para modificar políticas, execute como Administrador e descomente os comandos relevantes."

<#
=== COMANDOS IMPORTANTES (REQUER ADMIN) ===

# Configurar Execution Policy
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Configurar política de senha
net accounts /minpwlen:8 /maxpwage:90 /minpwage:1

# Configurar bloqueio de conta
net accounts /lockoutthreshold:5 /lockoutduration:30 /lockoutwindow:30

# Habilitar auditoria de logon
auditpol /set /subcategory:"Logon" /success:enable /failure:enable

# Exportar/Importar configuração de segurança
secedit /export /cfg security_backup.cfg
secedit /configure /db security.sdb /cfg security_template.cfg

# Backup/Restore GPO (se disponível)
Backup-GPO -All -Path "C:\GPO_Backup"
Import-GPO -BackupGpoName "PolicyName" -Path "C:\GPO_Backup" -TargetName "NewPolicy"

=== ARQUIVOS DE CONFIGURAÇÃO ===
- %TEMP%\current_security.cfg - Configuração atual exportada
- C:\Windows\System32\GroupPolicy\ - Políticas locais
- Registry HKLM:\SOFTWARE\Policies\ - Políticas via registro

=== FERRAMENTAS RELACIONADAS ===
- gpedit.msc - Editor de Política de Grupo Local
- secpol.msc - Política de Segurança Local  
- gpmc.msc - Console de Gerenciamento de Política de Grupo
- auditpol.exe - Ferramenta de política de auditoria
- secedit.exe - Editor de configuração de segurança
#>