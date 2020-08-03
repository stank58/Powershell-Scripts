$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

Add-MailboxPermission -Identity mailbox that needs adding -User email of user that needs access setting up -AccessRights FullAccess -InheritanceType All
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
REMOVE ACCESS
Remove-MailboxFolderPermission -Identity email of mailbox no longer needed -User email of user who needs access removing
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Remove-PSSession $Session 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
If mailbox access is erroring, run this command, then re-run mailbox access command
New-MoveRequest -identity email@domain.com

Check the status:
Get-moverequest -identity email@domain.com
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

If access has been removed but the mailbox is still showing check to make sure the auto-mapping feature is turned off. You will need to grant access to the mailbox again with the
below command and then remove access.

Add-MailboxPermission -Identity mailbox needing access to -User email of user who needs access -AccessRights FullAccess -InheritanceType All -Automapping $false

Remove-MailboxPermission -Identity mailbox that needs access removing -User email of user no longer needing access -AccessRights FullAccess