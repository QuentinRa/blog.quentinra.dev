# SMTP

[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)
[![networkservices2](../../../cybersecurity/_badges/thmp/networkservices2.svg)](https://tryhackme.com/room/networkservices2)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)

<div class="row row-cols-lg-2"><div>

Simple Mail Transfer Protocol (SMTP) is a protocol used by a mail client (**Mail User Agent**) to transfer emails (**Mail Submission Agent**) to a server called **Mail Transfer Agent**. This server will transfer emails to another server that will handle the delivery.

The Mail Transfer Agent will send the mail to a **Mail Delivery Agent** which is the server that the client will query to access his/her emails. It's common for a MTA to also be a MDA.

🐊️ **Ports**

* 25 (TCP)
* 587 (TCP) - with or without SSL/TLS
* 2525 (TCP) - unofficial

🔥 SMTP communications are not encrypted.

🔒 There is a secure version called SMTPS <small>(port 465, over SSL/TLS)</small>. Modern web servers use port 587 with SSL/TLS as smtps was revoked.
</div><div>

You could use the analogy of a MSA being the postman that takes mail from your inbox <small>(MUA)</small> and deliver them to the post center <small>(MTA)</small>.

```shell!
$ telnet IP 25
helo hostname
mail from: <helo@example.com>
rcpt to: <helo@example.com> NOTIFY=success,failure
data
subject: xxx
xxx
.
```

SMTP also has the commands `VRFY` to check if a user exists, and `EXPN` to see the emails/mailing lists/... for a user.
</div></div>

<hr class="sep-both">

## SMTP vulnerabilities ☠️

<div class="row row-cols-lg-2"><div>

SMTP credentials, if compromised, may have been reused.

* Metasploit

```shell!
msf6> use auxiliary/scanner/smtp/smtp_version # version
msf6> use auxiliary/scanner/smtp/smtp_enum # users...
```

📚 Metasploit is more reliable as it is able to find users even when `smtp-user-enum` fails to do so.
</div><div>

* Dig info using nmap

```shell!
$ nmap IP -p 25,465 --script "*smtp*"
$ nmap IP -p 25,465 --script smtp-open-relay
```

* Using `smtp-user-enum` <small>(not always working, code 252, [doc](https://www.kali.org/tools/smtp-user-enum/))</small>

```shell!
$ sudo apt install smtp-user-enum
$ smtp-user-enum -M VRFY -u root -t IP
$ smtp-user-enum -M VRFY -U wordlist.txt -t IP
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* SMTP protocol extension ESMTP with SMTP-Auth
* MSA is also called Relay server
* Open Relay (IPs allowed to use the SMTP Server, `0.0.0.0/0`=any%)
* [Mail Server Configuration](/operating-systems/cloud/webservers/tools/mails.md)
</div><div>
</div></div>