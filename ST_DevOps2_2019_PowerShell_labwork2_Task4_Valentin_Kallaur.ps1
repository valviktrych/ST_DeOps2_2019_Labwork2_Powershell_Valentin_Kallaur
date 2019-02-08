﻿#4.	Сохранить в текстовый файл на созданном диске список запущенных(!) служб. Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.

#4.1 Сохраняем в текстовый файл Services.txt список запущенных служб на созданном диске M2T2.
Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath M2T2:\Services.txt

#4.2 Просмотреть содержимое диска.

dir M2T2:

#4.3 Вывести содержимое файла в консоль PS.

Get-Content M2T2:\Services.txt

