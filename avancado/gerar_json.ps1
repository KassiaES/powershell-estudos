param($tipoDeExportacao)
$ErrorActionPreference = "Stop"

# hastable para a coluna Nome
$nameExpr = @{
    Label="Nome";
    Expression= { $_.Name }
}

# hashtable para a coluna Tamanho
$lengthExpr = @{
    Label="Tamanho";
    Expression= {"Expression", { " {0:N2}KB " -f ($_.Length / 1KB) }
}

$params = $nameExpr, $lengthExpr

# Garantir que a pasta saidas existe
if (-not (Test-Path .\saidas)) { New-Item -ItemType Directory -Path .\saidas }

$resultado =
    gci -Recurse -File |
        ? Name -like "*.exe" |
        select $params

if ($tipoDeExportacao -eq "HTML") {
    $estilos = Get-Content .\styles.css
    $styleTag = "<style> $estilos </style>"
    $tituloPagina = "Relatório de Arquivos .exe"
    $tituloBody = "<h1> $tituloPagina </h1>"

    $resultado | 
        ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody | 
        Out-File .\saidas\relatorio.html

} elseif ($tipoDeExportacao -eq "JSON") {
    $resultado | 
        ConvertTo-Json | 
        Out-File .\saidas\relatorio.json
} elseif ($tipoDeExportacao -eq "CSV") {
    $resultado | 
        ConvertTo-Csv | -NoTypeInformation |
        Out-File .\saidas\relatorio.csv
}

