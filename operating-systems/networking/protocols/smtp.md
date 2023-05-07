# SMTP

[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)

<div class="row row-cols-md-2"><div>

Simple Mail Transfer Protocol (SMTP) is a protocol used by a mail client (**Mail User Agent**) to transfer emails (**Mail Submission Agent**) to a server called **Mail Transfer Agent**. This server will transfer emails to another server that will handle the delivery.

You could use the analogy of a MSA being the postman that takes mail from your inbox <small>(MUA)</small> and deliver them to the post center <small>(MTA)</small>.

🐊️ **Port**: 25 (TCP)

🔥 SMTP communications are not encrypted.

🔒 There is a secure version called SMTPS <small>(port 445, over SSL/TLS)</small>.

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

## SMTP vulnerabilities ☠️

<div class="row row-cols-md-2"><div>

SMTP credentials, if compromised, may have been reused.

* Metasploit

```bash
msf6 > use auxiliary/scanner/smtp/smtp_version # version
msf6 > use auxiliary/scanner/smtp/smtp_enum # users...
```
</div><div>

* Dig info using nmap

```bash
$ nmap IP -p 25 --script "*smtp*"
```

* Using `smtp-user-enum` <small>(not always working)</small>

```bash
# https://www.kali.org/tools/smtp-user-enum/
$ smtp-user-enum -M VRFY -u root -t IP
```
</div></div>