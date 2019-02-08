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
