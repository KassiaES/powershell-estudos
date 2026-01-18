$nameExpr = @{}
$nameExpr.Add("Label", "Nome")
$nameExpr.Add("Expression", { $_.Name.ToUpper() })

$lengthExpr = @{}
$lengthExpr.Add("Label", "Tamanho do Nome")
$lengthExpr.Add("Expression", { " {0:N2}KB " -f ($_.Length / 1KB) })

$params = $nameExpr, $lengthExpr

Get-ChildItem -Recurse -File | 
    Where-Object Name -Like "*.migrando*" |
    Select-Object @params

