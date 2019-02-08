#7.	Вывести список названий и занятую виртуальную память (в Mb) каждого процесса, разделённые знаком тире, при этом если процесс занимает более 100Mb – 
#выводить информацию красным цветом, иначе зелёным.

Get-Process | Select-Object Name, VM | ForEach-Object {
if ($_.VM -gt 100000000) {
    Write-Host -ForegroundColor Red $_.Name $_.VM -Separator " - "
    }
else {
    Write-Host -ForegroundColor Green $_.Name $_.VM -Separator " - "
    }
}

#Перевод в (Mb) не осуществлён
