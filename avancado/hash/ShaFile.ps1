# ShaFile.ps1 - Biblioteca pura de funções de hash
# Não contém nenhuma lógica de exibição, apenas cálculos

function Get-FileHash($filePath, $algoritmo) {

    if($null -ne $filePath) {
        $fileContent = Get-Content $filePath
        $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

        # Criar o objeto de hash baseado no algoritmo passado
        $hashProvider = switch ($algoritmo.ToUpper()) {
            "MD5"    { New-Object System.Security.Cryptography.MD5CryptoServiceProvider }
            "SHA1"   { New-Object System.Security.Cryptography.SHA1Managed }
            "SHA256" { New-Object System.Security.Cryptography.SHA256Managed }
            "SHA384" { New-Object System.Security.Cryptography.SHA384Managed }
            "SHA512" { New-Object System.Security.Cryptography.SHA512Managed }
            default  { throw "Algoritmo não suportado: $algoritmo" }
        }

        # Calcular o hash
        $hash = $hashProvider.ComputeHash($fileBytes)

        # Construir string do hash (sua forma original)
        $prettyhashSB = New-Object System.Text.StringBuilder
        foreach ($byte in $hash) {
            $hexaNotation = $byte.ToString("x2")
            $prettyhashSB.Append($hexaNotation) >> $null
        }

        return $prettyhashSB.ToString()

    } else {
        foreach ($item in $input) {        

            $fileContent = Get-Content $item
            $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

            # Criar o objeto de hash baseado no algoritmo passado
            $hashProvider = switch ($algoritmo.ToUpper()) {
                "MD5"    { New-Object System.Security.Cryptography.MD5CryptoServiceProvider }
                "SHA1"   { New-Object System.Security.Cryptography.SHA1Managed }
                "SHA256" { New-Object System.Security.Cryptography.SHA256Managed }
                "SHA384" { New-Object System.Security.Cryptography.SHA384Managed }
                "SHA512" { New-Object System.Security.Cryptography.SHA512Managed }
                default  { throw "Algoritmo não suportado: $algoritmo" }
            }

            # Calcular o hash
            $hash = $hashProvider.ComputeHash($fileBytes)

            # Construir string do hash (sua forma original)
            $prettyhashSB = New-Object System.Text.StringBuilder
            foreach ($byte in $hash) {
                $hexaNotation = $byte.ToString("x2")
                $prettyhashSB.Append($hexaNotation) >> $null
            }

            return $prettyhashSB.ToString()
        }
    }
    
}

# Funções específicas
function Get-FileMD5($filePath) {
    return Get-FileHash $filePath "MD5"
}

function Get-FileSHA1($filePath) {
    return Get-FileHash $filePath "SHA1"
}

function Get-FileSHA256($filePath) {
    return Get-FileHash $filePath "SHA256"
}

function Get-FileSHA384($filePath) {
    return Get-FileHash $filePath "SHA384"
}

function Get-FileSHA512($filePath) {
    return Get-FileHash $filePath "SHA512"
}