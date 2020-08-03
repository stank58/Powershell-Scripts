Set-ExecutionPolicy RemoteSigned

$UserCredential = Get-Credential
- User email address with new app password

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell-liveid?DelegatedOrg=lbdgacom.onmicrosoft.com -Credential $UserCredential -Authentication Basic -AllowRedirection
- Change domain after DelegatedOrg= to connect to Exchange server

Import-PSSession $Session

Remove-PSSession $Session
