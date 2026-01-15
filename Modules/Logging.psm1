function Write-Log {
    param (
        [string]$Level,
        [string]$Event,
        [hashtable]$Fields
    )

    $log = @{
        Timestamp = (Get-Date).ToString("o")
        Level     = $Level
        Event     = $Event
    } + $Fields

    $log | ConvertTo-Json -Compress
}

Export-ModuleMember -Function Write-Log