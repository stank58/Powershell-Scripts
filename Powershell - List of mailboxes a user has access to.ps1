https://www.michev.info/Blog/Post/1516/quickly-list-all-mailboxes-to-which-a-particular-user-has-access

$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

Get-Mailbox | Get-MailboxPermission -User nameofuser/or emailaddress
(List all mailboxes a particular user has Full Access to)

Get-Mailbox -RecipientTypeDetails UserMailbox,SharedMailbox -ResultSize Unlimited | Get-MailboxPermission -User nameofuser/or emailaddress
(List all shared/user/room mailboxes etc a particular user has Full Access permissions to)

Remove-PSSession $Session 