# POP3

[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

Post Office Protocol version 3 is a protocol that opens the box, checks if there are (new) emails, and if any, downloads and removes them from the box.

🐊️ **Port**: 110 (TCP)

🔥 POP3 communications are not encrypted.

🔒 There is a secure version called POP3S <small>(port 995, over SSL/TLS)</small>.

It's possible to configure POP3 so that emails aren't removed, but due to how it works, mails will remain marked as "new", and the client will lose track of whether a mail was read or not.
</div><div>

```ps
$ telnet IP 110
USER xxx
PASS xxx
STAT # find if there mails
LIST # list new messages
RETR 1 # retrieve the first message
$ curl -k 'pop3s://IP' --user username:password
$ openssl s_client -connect IP:pop3s
```
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

You may try to use [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md):

```shell!
$ msfconsole -q
msf6> auxiliary/scanner/pop3/pop3_login
msf6> set USER_FILE /path/to/users.lst
msf6> set PASS_FILE /path/to/pass.lst
msf6> setg RHOST IP
msf6> run
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* dovecot-pop3d
* `sudo nmap IP -p110,995 -sV -sC`
</div><div>
</div></div>