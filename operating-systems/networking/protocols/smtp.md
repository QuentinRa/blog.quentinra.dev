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

#### Enumeration

* Metasploit

```shell!
msf6> use auxiliary/scanner/smtp/smtp_version # version
```

* Dig info using nmap

```shell!
$ nmap IP -p 25,465 --script "*smtp*"
$ nmap IP -p 25,465 --script smtp-open-relay
```

#### Foothold

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

* We can use [Metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md), which is quite reliable

```shell!
msf6> use auxiliary/scanner/smtp/smtp_enum # users...
```

* We can use `smtp-user-enum` which supports 3 methods: `VRFY` <small>(not always working, code 252, [doc](https://www.kali.org/tools/smtp-user-enum/))</small>, `RCPT` <small>(along with -D)</small> and `EXPN`

```shell!
$ sudo apt install smtp-user-enum
$ smtp-user-enum -M VRFY -u root -t IP
$ smtp-user-enum -M VRFY -U users.lst -t IP
$ smtp-user-enum -M RCPT -U users.lst -D example.com -t IP
```

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md).

```shell!
$ hydra -l username@example.com -P passwords.lst smtp://IP -v
```
</div><div>

#### Well-known CVEs

* **OpenSMTPD 6.6.2**: unauthenticated RCE. [CVE-2020-7247](https://nvd.nist.gov/vuln/detail/CVE-2020-7247).

#### Additional Notes

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

* [o365spray](https://github.com/0xZDH/o365spray) can be used to brute force usernames and passwords of Microsoft Office 365 accounts.

```
$ git clone https://github.com/0xZDH/o365spray
$ cd o365spray
$ python3 o365spray.py --validate --domain xxx.yyy # valid?
$ python3 o365spray.py --enum -U users.txt --domain xxx.yyy
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