& curl.exe --location --output `"C:\OSDCloud\install.wim`" --url "custom.wim"

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
