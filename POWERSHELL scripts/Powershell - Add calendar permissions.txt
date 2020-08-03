$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

Get-MailboxFolderPermission -identity user@domain.co.uk:\Calendar

Add-MailboxFolderPermission -identity user@domain.co.uk:\Calendar -user 'user (email address) that needs access' -AccessRights 'permission level'

REMOVE PERMISSIONS TO CALENDAR
Remove-MailboxFolderPermission -Identity User@domain.co.uk:\Calendar -User removeduser@domain.co.uk

Remove-PSSession $Session 