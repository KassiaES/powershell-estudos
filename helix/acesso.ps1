$BaseUrl = "https://SEU-HELIX.exemplo.com"

$RequestId = "INC000000123456"

$credPath = Join-Path $env:APPDATA "helix\itsm-cred.xml"

function Get-HelixCredential {
  param(
    [Parameter(Mandatory = $true)]
    [string]$Path
  )

  if (-not (Test-Path -LiteralPath $Path)) {
    $dir = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $dir)) {
      New-Item -ItemType Directory -Path $dir | Out-Null
    }

    $newCred = Get-Credential -Message "Informe seu usuário/senha do Helix (será salvo criptografado em $Path)"
    $newCred | Export-Clixml -LiteralPath $Path
  }

  Import-Clixml -LiteralPath $Path
}

$cred = Get-HelixCredential -Path $credPath

$loginUrl = "$BaseUrl/api/jwt/login"

$token = Invoke-RestMethod `
  -Method Post `
  -Uri $loginUrl `
  -ContentType "application/x-www-form-urlencoded" `
  -Body @{
    username = $cred.UserName
    password = $cred.GetNetworkCredential().Password
  }

$headers = @{
  Authorization = "AR-JWT $token"
}

$formName = "HPD:Help Desk"
$encodedForm = [uri]::EscapeDataString($formName)

$qualifier = "'Incident Number'=""$RequestId"""
$encodedQualifier = [uri]::EscapeDataString($qualifier)

$url = "$BaseUrl/api/arsys/v1/entry/$encodedForm?q=$encodedQualifier&fields=values(Incident Number,Status,Summary,Assigned Group,Assigned To)"

$result = Invoke-RestMethod -Method Get -Uri $url -Headers $headers

$result.entries[0].values

$logoutUrl = "$BaseUrl/api/jwt/logout"
Invoke-RestMethod -Method Post -Uri $logoutUrl -Headers $headers | Out-Null