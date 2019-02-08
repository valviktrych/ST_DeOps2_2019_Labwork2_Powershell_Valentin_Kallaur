#1. ����������� ���������� ����� ��e���� HKCU. 
#������ � �������� ���������� �� �������� ������ � �������� ��������.

# ������� � ����� ������� HKEY_Current_User

cd HKCU:\

# ����� ����������� HKCU

dir

# ������� � ���������� ����� �������, �������� HKCU\Software\Microsoft\Windows\CurrentVersion\Run
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

# ����� ����������� \Software\Microsoft\Windows\CurrentVersion\Run

Get-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

#2.	�������, �������������, ������� ������� �� ��������� �����

# 2.1 �������� �������� �� ��������� �����.

New-Item -Path 'D:\!Valik\!Temp' -ItemType "directory"

# 2.2 �������������� �������� �� ������ �����.

# �������� ������� Test
New-Item -Path 'D:\!Valik\!Temp\Test' -ItemType "directory"

# �������������� Test

Rename-Item -Path 'D:\!Valik\!Temp\Test'-NewName Test_1

# 2.3 �������� �������� Test_1

Remove-Item D:\!Valik\!Temp\Test_1

# 3. ������� ����� C:\M2T2_�������. ������� ���� ��������������� � ������ C:\M2T2_�������.

# 3.1 �������� ����� C:\M2T2_KALLAUR 
New-Item -Path 'C:\M2T2_KALLAUR' -ItemType "directory"

# 3.2 �������� �����, ���������������� � ������ C:\M2T2_KALLAUR

New-PSDrive -Name M2T2 -PSProvider FileSystem -Root "C:\M2T2_KALLAUR" -Description "Maps to M2T2"

# 3.2.1 �������� ����������

Get-PSDrive -Name M2T2

#4.	��������� � ��������� ���� �� ��������� ����� ������ ����������(!) �����. ����������� ���������� �����. ������� ���������� ����� � ������� PS.

#4.1 ��������� � ��������� ���� Services.txt ������ ���������� ����� �� ��������� ����� M2T2.
Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath M2T2:\Services.txt

#4.2 ����������� ���������� �����.

dir M2T2:

#4.3 ������� ���������� ����� � ������� PS.

Get-Content M2T2:\Services.txt

#5.	�������������� ��� �������� �������� ���������� �������� ������.

#5.1 ������� ��� ���������� �������� ������ � ������� PowerShell
Get-Variable
#�����, ��� �������� �������� ����������� ������ � ������� Value. ���� �������� ����� ������ �� ���� ��������� ��������� ���������� �������� ������ PowerShell..

#5.2 ��� ����, ����� ������������� ��� �������� �������� ����������, �� ����� ���������� � ��������� �������� ������ � ������� � ��������� pipeline � ��������.
#����� ������ ����� �������� �������� �������� � ������. ������� ��� �������� ������� � ������� �����. 

#������� �� ��������..
Get-Variable | Select-Object Value | Where-Object {$_.Value -is [int]} | 
ForEach-Object {
for($i = 1; $i )
    $A = $_.Value
    $totalsum += $A
    } | 
Write-Host $totalsum

#6.	������� ������ �� 6 ��������� ���������� ������ ����� ���������.

Get-Process | Select-Object CPU, ProcessName | Sort-Object CPU -Descending | Select-Object CPU -first 6

#7.	������� ������ �������� � ������� ����������� ������ (� Mb) ������� ��������, ���������� ������ ����, ��� ���� ���� ������� �������� ����� 100Mb � 
#�������� ���������� ������� ������, ����� ������.

Get-Process | Select-Object Name, VM | ForEach-Object {
if ($_.VM -gt 100000000) {
    Write-Host -ForegroundColor Red $_.Name $_.VM -Separator " - "
    }
else {
    Write-Host -ForegroundColor Green $_.Name $_.VM -Separator " - "
    }
}

#������� � (Mb) �� ����������

#8.	���������� ������ ���������� ������� � ����� C:\windows (� �� ���� ���������) �� ����������� ������ *.tmp

$FolderSize = Get-ChildItem C:\Windows\* -Recurse -Exclude *.tmp | measure -Property length -Sum
"{0:N2}" -f $($FolderSize.Sum / 1Gb) +"Gb"

#9.	��������� � CSV-����� ���������� � ������� ����� ����� ������� HKLM:\SOFTWARE\Microsoft.

Get-Item -Path HKLM:\SOFTWARE\Microsoft | Export-Csv M2T2:\HKLM.csv

#10. ��������� � XML -����� ������������ ���������� � �������� ������������� � ������� ������ ������ PS.

Get-History | Format-List * | Export-Clixml -Path M2T2:\History.xml

#11. ��������� ������ �� ����������� � �.10 xml-����� � ������� � ���� ������ ���������� � ������ ������, � ���� 5 ����� (��������� ����) �������.

Get-ChildItem M2T2:\History.xml | Import-Clixml | Format-List -Property ID, CommandLine, ExecutionStatus, StartExecutionTime, EndExecutionTime

#12. ������� ��������� ���� � ����� �:\M2T2_�������

Remove-PSDrive -Name M2T2

Remove-Item -Path C:\M2T2_KALLAUR -Recurse

