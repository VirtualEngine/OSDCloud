Write-Host  -ForegroundColor Cyan "Starting Virtual Engine's Custom OSDCloud ..."
<#
Start-Sleep -Seconds 5
Start-OSDCloud -OSName 'Windows 10 22H2 x64' -OSEdition Pro -OSLanguage en-gb -OSLicense Volume -SkipAutoPilot -ZTI -Restart
#>
<#
#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}
#>
