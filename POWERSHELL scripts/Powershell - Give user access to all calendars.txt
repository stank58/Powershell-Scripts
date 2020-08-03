$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

$users = Get-Mailbox | Select -ExpandProperty Alias

Foreach ($user in $users) {Add-MailboxFolderPermission $user":\Calendar" -user usersemailaddress -accessrights Reviewer}

LIST ALL CALENDARS WITH DEFAULT PERMISSIONS
$allMailbox = Get-Mailbox -RecipientType UserMailbox

$allMailbox | ForEach {Get-MailboxFolderPermission -Identity “$($_.alias):\Calendar” | Select User,AccessRights}

Remove-PSSession $Session 
