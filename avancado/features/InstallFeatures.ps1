function Install-WindowsFeatureInServers {
    param (
        [string[]]$Servers,
        [string[]]$FeatureName
    )

    $jobScriptBlock = {
        param(
            [string]$ServerName,
            [string[]]$FeatureName
        )
        Install-WindowsFeature -ComputerName $ServerName -Name $FeatureName -IncludeManagementTools
    }

    $servers | ForEach-Object {
        Start-Job -Name "JOB_$_" -ScriptBlock $jobScriptBlock -ArgumentList ($_, $FeatureName)

    }

}