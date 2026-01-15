function Invoke-FlavorSetup {
    param (
        [object]$Context,
        [object]$Parameters
    )

    Write-Log -Level "Info" -Event "FlavorTemplateInvoked" -Fields @{
        Flavor = "Template"
    }
}

Export-ModuleMember -Function Invoke-FlavorSetup