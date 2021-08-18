& curl.exe --location --output `"C:\OSDCloud\install.wim`" --url "https://prdeuweven.file.core.windows.net/image/VEN-Windows-10-20H2-O365x64-2021-07-21.wim?sv=2019-07-07&sig=5a%2BUd0wRec8nGtFsKakfLjJ0Wd%2FZtGmy5HIzKOQ9HfU%3D&spr=https&se=2021-08-20T17%3A56%3A30Z&srt=co&ss=f&sp=rcwdl"

Clear-Disk.fixed -Force

New-OSDisk -Force

Start-Sleep -Seconds 3

New-Item 'C:\OSDCloud\Temp' -ItemType Directory -Force | Out-Null

Expand-WindowsImage -ApplyPath 'C:\' -ImagePath "C:\OSDCloud\install.wim" -Index 1 -ScratchDirectory 'C:\OSDCloud\Temp'

$SystemDrive = Get-Partition | Where-Object {$_.Type -eq 'System'} | Select-Object -First 1

$SystemDrive | Set-Partition -NewDriveLetter 'S'

bcdboot C:\Windows /s S: /f ALL

Start-Sleep -Seconds 10

$SystemDrive | Remove-PartitionAccessPath -AccessPath "S:\"
