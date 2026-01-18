# Exemplo de script que gera relatório em múltiplos formatos
param(
    [ValidateSet("HTML", "JSON", "CSV", "TXT")]
    [string]$Formato = "HTML"
)

$ErrorActionPreference = "Stop"

# Garantir que a pasta saidas existe
if (-not (Test-Path .\saidas)) { 
    New-Item -ItemType Directory -Path .\saidas 
    Write-Host "Pasta 'saidas' criada." -ForegroundColor Green
}

$nameExpr = @{
    Label="Nome";
    Expression= { $_.Name }
}

$sizeExpr = @{
    Label="Tamanho";
    Expression= { "{0:N2} KB" -f ($_.Length / 1KB) }
}

$params = $nameExpr, $sizeExpr

Write-Host "Coletando arquivos .exe..." -ForegroundColor Yellow
$resultado = Get-ChildItem -Recurse -File | 
             Where-Object Name -like "*.exe" | 
             Select-Object $params

if (-not $resultado) {
    Write-Warning "Nenhum arquivo .exe encontrado!"
    exit
}

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

switch ($Formato) {
    "HTML" {
        $tituloPagina = "Relatório de Arquivos .exe - $timestamp"
        $tituloBody = "<h1>$tituloPagina</h1>"
        
        # Verificar se existe arquivo CSS
        $styleTag = if (Test-Path .\styles.css) {
            $estilos = Get-Content .\styles.css
            "<style>$estilos</style>"
        } else {
            "<style>body{font-family:Arial;} table{border-collapse:collapse;width:100%} th,td{border:1px solid #ddd;padding:8px}</style>"
        }
        
        $arquivo = ".\saidas\relatorio_$timestamp.html"
        $resultado | ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody | Out-File $arquivo
        Write-Host "Relatório HTML salvo: $arquivo" -ForegroundColor Green
    }
    "JSON" {
        $arquivo = ".\saidas\relatorio_$timestamp.json"
        $resultado | ConvertTo-Json | Out-File $arquivo
        Write-Host "Relatório JSON salvo: $arquivo" -ForegroundColor Green
    }
    "CSV" {
        $arquivo = ".\saidas\relatorio_$timestamp.csv"
        $resultado | ConvertTo-Csv -NoTypeInformation | Out-File $arquivo
        Write-Host "Relatório CSV salvo: $arquivo" -ForegroundColor Green
    }
    "TXT" {
        $arquivo = ".\saidas\relatorio_$timestamp.txt"
        $resultado | Format-Table -AutoSize | Out-String | Out-File $arquivo
        Write-Host "Relatório TXT salvo: $arquivo" -ForegroundColor Green
    }
}

Write-Host "Total de arquivos encontrados: $($resultado.Count)" -ForegroundColor Cyan