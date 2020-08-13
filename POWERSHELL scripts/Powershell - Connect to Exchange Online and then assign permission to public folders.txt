-Connect to Exchnge Online :
 -Open Powershell in Admin Mode .
 Then, run this command : set-executionpolicy -scope currentuser -executionpolicy unrestricted
 Then, type 'a' for 'yes to all'.
 Then, run the command : $UserCredential = Get-Credential
 It will give you a prompt. Please enter the global admin credentials for your tenant.
 Then, run command : $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
 Then, run command : Import-PSSession $Session -DisableNameChecking
Once the command is executed successfully, you are connected to the exchange online now.

Now, run the following cmdlet to assign permissions to the affected Public folder for the required user :
Get-PublicFolder  \<NameOfParentPublicFolder> -Recurse | Add-PublicFolderClientPermission -User <UserID of the user whom you wangt to give permissions> -AccessRights <Permission level>
