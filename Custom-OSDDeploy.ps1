Start-Transcript X:\Windows\Logs\VE-Cloud.log

Write-Host  -ForegroundColor Cyan "Starting Virtual Engine's Custom OSDCloud ..."
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}

#Make sure I have the latest OSD Content
#Write-Host  -ForegroundColor Cyan "Updating OSD PowerShell Module"
#Install-Module OSD -Force

#Write-Host -ForegroundColor Cyan "Importing OSD PowerShell Module"
Import-Module OSD -Force

#$Global:StartOSDCloud = { ImageFileUrl = "https://prdeuweven.file.core.windows.net/image/VEN-Windows-10-20H2-O365x64-2021-07-21.wim?sv=2019-07-07&sig=5a%2BUd0wRec8nGtFsKakfLjJ0Wd%2FZtGmy5HIzKOQ9HfU%3D&spr=https&se=2021-08-20T17%3A56%3A30Z&srt=co&ss=f&sp=rcwdl"}

#Start OSDCloud ZTI the RIGHT way
#Write-Host  -ForegroundColor Green "Start OSDCloud"
#Start-OSDCloud -OSLanguage en-gb -OSBuild 21H2 -OSEdition Enterprise -ZTI -SkipAutopilot
#Start-OSCloudGUI

#Restart from WinPE
#Read-Host -Prompt "Please remove boot media now and press any key to continue..."
#Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
#Start-Sleep -Seconds 20
#wpeutil reboot

Stop-Transcript
