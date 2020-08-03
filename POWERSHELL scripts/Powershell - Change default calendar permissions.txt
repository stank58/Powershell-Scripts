$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

Get-MailboxFolderPermission -identity user@domain.co.uk:\Calendar
(check the default permission of the calendar)

Set-MailboxFolderPermission user@domain.co.uk:\calendar –User Default –AccessRights Reviewer (insert permission needed)

Get-MailboxFolderPermission -identity user@domain.co.uk:\Calendar
(run again to check that the default has changed)

Remove-PSSession $Session 