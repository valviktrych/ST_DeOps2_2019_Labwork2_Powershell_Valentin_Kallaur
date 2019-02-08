#9.	Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.

Get-Item -Path HKLM:\SOFTWARE\Microsoft | Export-Csv M2T2:\HKLM.csv