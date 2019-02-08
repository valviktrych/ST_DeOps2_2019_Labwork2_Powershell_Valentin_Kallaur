#10. Сохранить в XML -файле историческую информацию о командах выполнявшихся в текущем сеансе работы PS.

Get-History | Format-List * | Export-Clixml -Path M2T2:\History.xml