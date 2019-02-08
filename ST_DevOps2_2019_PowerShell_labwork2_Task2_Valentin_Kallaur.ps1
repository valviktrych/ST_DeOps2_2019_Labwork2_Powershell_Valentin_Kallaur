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