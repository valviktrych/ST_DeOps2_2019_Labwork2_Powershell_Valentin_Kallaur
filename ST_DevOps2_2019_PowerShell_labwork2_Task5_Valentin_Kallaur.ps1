#5.	Просуммировать все числовые значения переменных текущего сеанса.

#5.1 Выведем все переменные текущего сеанса в консоль PowerShell
Get-Variable
#Видим, что числовые значения содержаться только в столбце Value. Хотя проверку нужно делать по всем элементам коллекции переменных текущего сеанса PowerShell..

#5.2 Суммируем
$sum = 0
foreach ($_ in $V = Get-Variable | Select-Object Value | Where-Object {$_.Value -is [int]} ) {
    
    $sum += $_.Value
    
}
Write-Host("Total sum: $sum")
