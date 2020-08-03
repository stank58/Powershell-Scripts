$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

(If Import Session fails run Set-ExecutionPolicy RemoteSigned) and select 'y'

Set-UnifiedGroup -Identity *** Email address is removed for privacy *** -HiddenFromAddressListsEnabled $true

Remove-PSSession $Session 
