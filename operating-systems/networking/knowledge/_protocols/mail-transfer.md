# Mail transfer

[Go back](../index.md)

<hr class="sep-both">

## SMTP

<div class="row row-cols-md-2"><div>

Simple Mail Transfer Protocol (SMTP) is a protocol used by a mail client (**Mail User Agent**) to transfer emails (**Mail Submission Agent**) to a server called **Mail Transfer Agent**. This server will transfer emails to another server that will handle the delivery.

You could use the analogy of a MSA being the postman that takes mail from your inbox <small>(MUA)</small> and deliver them to the post center <small>(MTA)</small>.

🐊️ **Port**: 25 (TCP)

🔥 SMTP communications are not encrypted.

🔒 There is a secure version called SMTPS (port 445).

The Mail Transfer Agent will send the mail to a **Mail Delivery Agent** which is the server that the client will query to access his/her emails. It's common for a MTA to also be a MDA.
</div><div>

```bash
$ telnet IP 25
helo hostname
mail from:
rcpt to:
data
subject: xxx
xxx
.
```

SMTP also has the commands `VRFY` to check if a user exists, and `EXPN` to see the emails/mailing lists/... for a user.
</div></div>

<hr class="sep-both">

## POP3

<div class="row row-cols-md-2"><div>

Post Office Protocol version 3 is a protocol that opens the box, checks if there are (new) emails, and if any, downloads and removes them from the box.

🐊️ **Port**: 110 (TCP)

🔥 POP3 communications are not encrypted.

🔒 There is a secure version called POP3S (port 995).

It's possible to configure POP3 so that emails aren't removed, but due to how it works, mails will remain marked as "new", and the client will lose track of whether a mail was read or not.
</div><div>

```bash
$ telnet IP 110
USER xxx
PASS xxx
STAT # find if there mails
LIST # list new messages
RETR 1 # retrieve the first message
```
</div></div>

<hr class="sep-both">

## IMAP

<div class="row row-cols-md-2"><div>

Internet Message Access Protocol (IMAP) is a protocol designed for synchronization between mailboxes. It allows the user to create folders, and sort mails inside. If a mail is read inside a mailbox, then it's marked as read in every other mailbox.

🐊️ **Port**: 143 (TCP)

🔥 IMAP communications are not encrypted.

🔒 There is a secure version called IMAPS (port 993).
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