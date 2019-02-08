#8.	Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp

$FolderSize = Get-ChildItem C:\Windows\* -Recurse -Exclude *.tmp | measure -Property length -Sum
"{0:N2}" -f $($FolderSize.Sum / 1Gb) +"Gb"