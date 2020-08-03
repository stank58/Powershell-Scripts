Connect-MsolService

$LiveCred = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

Set-MsolUserPrincipalName -NewUserPrincipalName enter new email address

cmdlet Set-MsolUserPrincipalName at command pipeline position 1
Supply values for the following parameters: Enter Object ID - ObjectId can be found here: Office 365\admin centers\azure active directory\users\look for user\object ID

Remove-PSSession $Session 