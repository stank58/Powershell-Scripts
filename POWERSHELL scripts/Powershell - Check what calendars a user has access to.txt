$Mailboxes = Get-Mailbox -ResultSize Unlimited
foreach ($mailbox in $Mailboxes) {Get-MailboxFolderPermission -Identity ($mailbox.UserPrincipalName + ":\Calendar") -user "Email address you want to check"  | select-object @{Label = "Mailbox"; Expression = {($mailbox.UserPrincipalName)}}, FolderName, User , AccessRights 
}