https://www.quadrotech-it.com/blog/list-office-365-mailboxes-with-a-forward/

$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

ADD FORWARDING
Set-Mailbox -Identity user@domain.co.uk -ForwardingSMTPAddress user@domain.co.uk

REMOVE FORWARDING
Set-Mailbox -Identity user@domain.co.uk -ForwardingSMTPAddress $null

LIST ALL FORWARDINGS CURRENTLY SET
Get-Mailbox | select ForwardingSmtpAddress,DeliverToMailboxAndForward

LIST FORWARDING SET FOR USER
Get-Mailbox user@domain.co.uk | Format-List ForwardingSMTPAddress,DeliverToMailboxandForward

Remove-PSSession $Session