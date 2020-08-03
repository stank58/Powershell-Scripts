$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

New-MailboxExportRequest -Mailbox user@domain.co.uk -FilePath \\filepath\nameoffile.pst

Get-MailboxExportRequest -Status InProgress
Get-MailboxExportRequest | Get-MailboxExportRequestStatistics

Remove-PSSession $Session