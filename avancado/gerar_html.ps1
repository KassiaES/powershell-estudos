$ErrorActionPreference = "Stop"

$nameExpr = @{
    Label="Nome";
    Expression= { $_.Name }
}

$lengthExpr = @{}
    Label="Tamanho";
    Expression= {"Expression", { " {0:N2}KB " -f ($_.Length / 1KB) }
}

$params = $nameExpr, $lengthExpr

$estilos = Get-Content .\styles.css
$styleTag = "<style> $estilos </style>"
$tituloPagina = "Relatório de Arquivos .exe"
$tituloBody = "<h1> $tituloPagina </h1>"

$resultado =
    gci -Recurse -File |
        ? Name -like "*.exe" |
        select $params

# Garantir que a pasta saidas existe
if (-not (Test-Path .\saidas)) { New-Item -ItemType Directory -Path .\saidas }

$resultado | 
    ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody | 
    Out-File .\saidas\relatorio.html