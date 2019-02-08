#1. Просмотреть содержимое ветви реeстра HKCU. 
#Работа с реестром происходит по аналогии работы с файловой системой.

# Переход в ветку реестра HKEY_Current_User

cd HKCU:\

# Вывод содержимого HKCU

dir

# Переход к конкретной ветви реестра, например HKCU\Software\Microsoft\Windows\CurrentVersion\Run
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

# Вывод содержимого \Software\Microsoft\Windows\CurrentVersion\Run

Get-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

#2.	Создать, переименовать, удалить каталог на локальном диске

# 2.1 Создание каталога на локальном диске.

New-Item -Path 'D:\!Valik\!Temp' -ItemType "directory"

# 2.2 Переименование каталога на жёстком диске.

# Создадим каталог Test
New-Item -Path 'D:\!Valik\!Temp\Test' -ItemType "directory"

# Переименование Test

Rename-Item -Path 'D:\!Valik\!Temp\Test'-NewName Test_1

# 2.3 Удаление каталога Test_1

Remove-Item D:\!Valik\!Temp\Test_1

# 3. Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.

# 3.1 Создание папки C:\M2T2_KALLAUR 
New-Item -Path 'C:\M2T2_KALLAUR' -ItemType "directory"

# 3.2 Создание диска, ассоциированного с папкой C:\M2T2_KALLAUR

New-PSDrive -Name M2T2 -PSProvider FileSystem -Root "C:\M2T2_KALLAUR" -Description "Maps to M2T2"

# 3.2.1 Просмотр результата

Get-PSDrive -Name M2T2

#4.	Сохранить в текстовый файл на созданном диске список запущенных(!) служб. Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.

#4.1 Сохраняем в текстовый файл Services.txt список запущенных служб на созданном диске M2T2.
Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath M2T2:\Services.txt

#4.2 Просмотреть содержимое диска.

dir M2T2:

#4.3 Вывести содержимое файла в консоль PS.

Get-Content M2T2:\Services.txt

#5.	Просуммировать все числовые значения переменных текущего сеанса.

#5.1 Выведем все переменные текущего сеанса в консоль PowerShell
Get-Variable
#Видим, что числовые значения содержаться только в столбце Value. Хотя проверку нужно делать по всем элементам коллекции переменных текущего сеанса PowerShell..

#5.2 Для того, чтобы просуммирвать все числовые значения переменных, их нужно определить в коллекции текущего сеанса и вывести в следующий pipeline в конвейер.
#Затем каждое такое числовое значение передать в массив. Сложить все элементы массива и вывести сумму. 

#Решение не работает..
Get-Variable | Select-Object Value | Where-Object {$_.Value -is [int]} | 
ForEach-Object {
for($i = 1; $i )
    $A = $_.Value
    $totalsum += $A
    } | 
Write-Host $totalsum

#6.	Вывести список из 6 процессов занимающих дольше всего процессор.

Get-Process | Select-Object CPU, ProcessName | Sort-Object CPU -Descending | Select-Object CPU -first 6

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

#8.	Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp

$FolderSize = Get-ChildItem C:\Windows\* -Recurse -Exclude *.tmp | measure -Property length -Sum
"{0:N2}" -f $($FolderSize.Sum / 1Gb) +"Gb"

#9.	Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.

Get-Item -Path HKLM:\SOFTWARE\Microsoft | Export-Csv M2T2:\HKLM.csv

#10. Сохранить в XML -файле историческую информацию о командах выполнявшихся в текущем сеансе работы PS.

Get-History | Format-List * | Export-Clixml -Path M2T2:\History.xml

#11. Загрузить данные из полученного в п.10 xml-файла и вывести в виде списка информацию о каждой записи, в виде 5 любых (выбранных Вами) свойств.

Get-ChildItem M2T2:\History.xml | Import-Clixml | Format-List -Property ID, CommandLine, ExecutionStatus, StartExecutionTime, EndExecutionTime

#12. Удалить созданный диск и папку С:\M2T2_ФАМИЛИЯ

Remove-PSDrive -Name M2T2

Remove-Item -Path C:\M2T2_KALLAUR -Recurse

