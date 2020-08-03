https://www.morgantechspace.com/2015/06/powershell-export-distribution-list-members-to-csv.html

$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

$Groups = Get-DistributionGroup
$Groups | ForEach-Object {
$group = $_.Name
$members = ''
Get-DistributionGroupMember $group | ForEach-Object {
        If($members) {
              $members=$members + ";" + $_.Name
           } Else {
              $members=$_.Name
           }
  }
New-Object -TypeName PSObject -Property @{
      GroupName = $group
      Members = $members
     }
} | Export-CSV "C:\Location\Name-of-file.csv" -NoTypeInformation -Encoding UTF8

--------------------------------------------------------------------------------------------
foreach ($group in Get-DistributionGroup) { get-distributiongroupmember $group | sort displayname | ft @{expression={$_.displayname};Label=”$group”} | Out-File c:\support\DistributionListMembers.csv -append}

Remove-PSSession $Session