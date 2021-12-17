#Start-Transcript X:\Windows\Logs\VE-Cloud.log

Write-Host  -ForegroundColor Cyan "Starting Virtual Engine's Custom OSDCloud ..."
Start-Sleep -Seconds 5

<#
#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}
#>

#Make sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating OSD PowerShell Module"
Install-Module OSD -Force

Write-Host -ForegroundColor Cyan "Importing OSD PowerShell Module"
Import-Module OSD -Force

## update WebFile.ps1 with VE version
Write-Host -ForegroundColor Cyan "Updating WebFile.ps1"
$version = (get-childitem "$env:SystemDrive\Program Files\WindowsPowerShell\Modules\OSD\" | Select -Last 1).name
$modulepath = "$env:SystemDrive\Program Files\WindowsPowerShell\Modules\OSD\$version\Public"
remove-item "$modulepath\WebFile.ps1"
(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/VirtualEngine/OSD/master/Public/WebFile.ps1',"$modulepath\WebFile.ps1")

## url to custom WIM
$ImageFileUrl = "https://prdeuweven.file.core.windows.net/image/VEN-Windows-10-21H2-O365x64-2021-12-16.wim?sp=r&st=2021-12-16T17:12:19Z&se=2021-12-17T17:12:19Z&spr=https&sv=2020-08-04&sig=zHB1X8X1zcpiZEd%2FtOmM0hkojEDgL7egKiyjoQ6T3Lk%3D&sr=f"

Write-Host -ForegroundColor Cyan "Importing OSD PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI the RIGHT way
Write-Host  -ForegroundColor Green "Start OSDCloud"
Start-OSDCloud -ZTI -SkipAutopilot -SkipODT -ImageFileUrl "$ImageFileUrl" -ImageIndex 1
#Start-OSCloudGUI

#Restart from WinPE
#Read-Host -Prompt "Please remove boot media now and press any key to continue..."
#Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
#Start-Sleep -Seconds 20
#wpeutil reboot

#Stop-Transcript
