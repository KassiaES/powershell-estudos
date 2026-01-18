$nameExpr = @{
    Label="Nome";
    Expression= { $_.Name }
}

$lengthExpr = @{}
    Label="Tamanho";
    Expression= {"Expression", { " {0:N2}KB " -f ($_.Length / 1KB) }
}

$params = $nameExpr, $lengthExpr

gci -Recurse -File | 
    Where-Object Name -Like "*.migrando*" |
    Select-Object @params
