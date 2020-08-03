$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

$all=Get-Mailbox -RecipientTypeDetails UserMailbox

$all | ForEach {Set-MailboxFolderPermission -Identity “$($_.alias):\Calendar” -User Default -AccessRights Reviewer}

LIST ALL CALENDARS WITH DEFAULT PERMISSIONS
$allMailbox = Get-Mailbox -RecipientType UserMailbox

$allMailbox | ForEach {Get-MailboxFolderPermission -Identity “$($_.alias):\Calendar” | Select User,AccessRights}

Remove-PSSession $Session 