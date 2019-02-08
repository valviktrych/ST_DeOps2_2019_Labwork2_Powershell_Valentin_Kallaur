# 3. Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.

# 3.1 Создание папки C:\M2T2_KALLAUR 
New-Item -Path 'C:\M2T2_KALLAUR' -ItemType "directory"

# 3.2 Создание диска, ассоциированного с папкой C:\M2T2_KALLAUR

New-PSDrive -Name M2T2 -PSProvider FileSystem -Root "C:\M2T2_KALLAUR" -Description "Maps to M2T2"

# 3.2.1 Просмотр результата

Get-PSDrive -Name M2T2

