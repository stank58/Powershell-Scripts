$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

Set-Mailbox email@domain.org.uk -Type Shared

TYPE: Regular, Room, Equipment, Shared

Remove-PSSession $Session