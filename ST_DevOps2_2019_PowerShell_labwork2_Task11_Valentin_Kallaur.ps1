#11. Загрузить данные из полученного в п.10 xml-файла и вывести в виде списка информацию о каждой записи, в виде 5 любых (выбранных Вами) свойств.

Get-ChildItem M2T2:\History.xml | Import-Clixml | Format-List -Property ID, CommandLine, ExecutionStatus, StartExecutionTime, EndExecutionTime
