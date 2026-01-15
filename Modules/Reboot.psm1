function Request-Reboot {
    param (
        [string]$Reason,
        [string]$Checkpoint
    )

    Write-Log -Level "Info" -Event "RebootRequested" -Fields @{
        Reason = $Reason
        Checkpoint = $Checkpoint
    }

    exit 3010
}

function Resume-FromCheckpoint {
    Write-Log -Level "Info" -Event "ResumeCheckpoint" -Fields @{}
}

Export-ModuleMember -Function Request-Reboot, Resume-FromCheckpoint