#5.	�������������� ��� �������� �������� ���������� �������� ������.

#5.1 ������� ��� ���������� �������� ������ � ������� PowerShell
Get-Variable
#�����, ��� �������� �������� ����������� ������ � ������� Value. ���� �������� ����� ������ �� ���� ��������� ��������� ���������� �������� ������ PowerShell..

#5.2 ���������
$sum = 0
foreach ($_ in $V = Get-Variable | Select-Object Value | Where-Object {$_.Value -is [int]} ) {
    
    $sum += $_.Value
    
}
Write-Host("Total sum: $sum")
