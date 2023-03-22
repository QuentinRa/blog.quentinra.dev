# IMAP

<div class="row row-cols-md-2"><div>

Internet Message Access Protocol (IMAP) is a protocol designed for synchronization between mailboxes. It allows the user to create folders, and sort mails inside. If a mail is read inside a mailbox, then it's marked as read in every other mailbox.

🐊️ **Port**: 143 (TCP)

🔥 IMAP communications are not encrypted.

🔒 There is a secure version called IMAPS <small>(port 993, over SSL/TLS)</small>.
</div><div>

```bash
$ telnet IP 143
LOGIN username password
# every command must start with a unique token of your choice
unique_token1 LIST "" "*" # list mails in every folder
unique_token2 EXAMINE INBOX # list mails in INBOX
unique_token3 LOGOUT # logout
```
</div></div>