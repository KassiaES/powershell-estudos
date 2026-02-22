# ShaFile.ps1 - Biblioteca pura de funções de hash
# Não contém nenhuma lógica de exibição, apenas cálculos

function Get-FileHash {

    param(
        [Parameter (ValueFromPipeline = $true)]
        [string]$filePath,
        [string]$algoritmo
    )

    begin {
        # Criar o objeto de hash baseado no algoritmo passado
        $hashProvider = switch ($algoritmo.ToUpper()) {
            "MD5"    { New-Object System.Security.Cryptography.MD5CryptoServiceProvider }
            "SHA1"   { New-Object System.Security.Cryptography.SHA1Managed }
            "SHA256" { New-Object System.Security.Cryptography.SHA256Managed }
            "SHA384" { New-Object System.Security.Cryptography.SHA384Managed }
            "SHA512" { New-Object System.Security.Cryptography.SHA512Managed }
            default  { throw "Algoritmo não suportado: $algoritmo" }
        }
    }

    process {
        # Resolver caminho completo
        $resolvedPath = Resolve-Path $filePath -ErrorAction SilentlyContinue
        if (-not $resolvedPath) {
            Write-Error "Caminho não encontrado: $filePath"
            return
        }

        # Verificar se é um arquivo (não diretório)
        if (-not (Test-Path $resolvedPath.Path -PathType Leaf)) {
            Write-Error "O caminho especificado não é um arquivo: $($resolvedPath.Path)"
            return
        }

        try {
            # Ler arquivo como bytes (funciona com arquivos binários)
            $fileBytes = [System.IO.File]::ReadAllBytes($resolvedPath.Path)
            
            # Calcular o hash (especificar tipo byte[] explicitamente)
            $hash = $hashProvider.ComputeHash([byte[]]$fileBytes)

            # Construir string do hash (StringBuilder local para cada arquivo)
            $prettyhashSB = New-Object System.Text.StringBuilder
            foreach ($byte in $hash) {
                $hexaNotation = $byte.ToString("x2")
                $prettyhashSB.Append($hexaNotation) | Out-Null
            }

            # Retornar hash sem usar return (para não quebrar pipeline)
            $prettyhashSB.ToString()
        }
        catch {
            Write-Error "Erro ao processar arquivo '$($resolvedPath.Path)': $($_.Exception.Message)"
            return
        }
    }

    end {
        $hashProvider.Dispose()
    }

    
}

# Funções específicas
function Get-FileMD5 {
    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
        )]
        [string]$filePath
    )
    process {
        Get-FileHash $filePath "MD5"
    }
}

function Get-FileSHA1 {
    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
        )]
        [string]$filePath
    )
    process {
        Get-FileHash $filePath "SHA1"
    }
}

function Get-FileSHA256 {
    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
        )]
        [string]$filePath
    )
    process {
        Get-FileHash $filePath "SHA256"
    }
}

function Get-FileSHA384 {
    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
            )]
        [string]$filePath
    )
    process {
        Get-FileHash $filePath "SHA384"
    }
}

function Get-FileSHA512 {
    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
            )]
        [string]$filePath
    )
    process {
        Get-FileHash $filePath "SHA512"
    }
}