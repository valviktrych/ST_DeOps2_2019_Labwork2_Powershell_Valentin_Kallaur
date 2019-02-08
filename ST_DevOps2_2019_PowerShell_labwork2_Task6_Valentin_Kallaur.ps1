#6.	Вывести список из 6 процессов занимающих дольше всего процессор.

Get-Process | Select-Object CPU, ProcessName | Sort-Object CPU -Descending | Select-Object CPU -first 6