$ADGroups = Get-ADGroup -Filter '*' 
$Results = ForEach ($AdGroup in $ADGroups) 
{
$Members = Get-AdGroupMember -Identity $AdGroup.SamAccountName
ForEach ($Member in $Members) 
{
$Hash = @{
Group = $AdGroup.SamAccountName
Member = $Member.SamAccountName
}
New-Object -TypeName PSObject -Property $Hash
}
}

$Results | Export-Csv -Path c:\windows\temp\members.csv -NoTypeInformation


-----------------------
Export one particular group

Get-ADGroupMember -identity GROUPNAME | select name | Export-csv -path C:\Windows\Temp\FILENAME.csv -NoTypeInformation