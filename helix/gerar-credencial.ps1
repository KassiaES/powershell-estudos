$credPath = Join-Path $env:APPDATA "helix\itsm-cred.xml"

$credDir = Split-Path -Parent $credPath
if (-not (Test-Path -LiteralPath $credDir)) {
  New-Item -ItemType Directory -Path $credDir | Out-Null
}

$cred = Get-Credential -Message "Informe seu usuário/senha do Helix (será salvo criptografado em $credPath)"
$cred | Export-Clixml -LiteralPath $credPath

"Credencial salva em: $credPath"
