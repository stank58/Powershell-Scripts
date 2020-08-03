$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

Set-Mailbox -Identity mailbox.needed@domain.com -GrantSendOnBehalfTo user@domain.com

Remove-PSSession $Session 