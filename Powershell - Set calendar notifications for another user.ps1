$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

First set up delegate access to receive calednar invites. "SharingPermissionFlags" can be specified only when access rights is Editor
Set-MailboxFolderPermission -Identity user@domain.co.uk:\Calendar -User userneedingaccess@domain.co.uk -AccessRights Editor -SharingPermissionFlags Delegate -SendNotificationToUser $true (to change current permission)
Add-MailboxFolderPermission -Identity user@domain.co.uk:\Calendar -User userneedingaccess@domain.co.uk -AccessRights Editor -SharingPermissionFlags Delegate -SendNotificationToUser $true (add new permission)

If permissions need changing run the following command with the required access
Set-MailboxFolderPermission -identity user@domain.co.uk:\Calendar -user userneedingaccess@domain.co.uk -AccessRights Owner

Remove-PSSession $Session