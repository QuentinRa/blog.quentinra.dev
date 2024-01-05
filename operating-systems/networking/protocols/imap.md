# IMAP

[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![imap](../../../cybersecurity/_badges/hacktricks/imap.svg)](https://book.hacktricks.xyz/network-services-pentesting/pentesting-imap)

<div class="row row-cols-lg-2"><div>

Internet Message Access Protocol (IMAP) is a protocol designed for synchronization between mailboxes. It allows the user to create folders, and sort mails inside. If a mail is read inside a mailbox, then it's marked as read in every other mailbox.

🐊️ **Port**: 143 (TCP)

🔥 IMAP communications are not encrypted.

🔒 There is a secure version called IMAPS <small>(port 993, over SSL/TLS)</small>.
</div><div>

```ps
$ telnet IP 143
$ openssl s_client -connect IP:imaps
```

Once a session is available, you can run commands:

```ps
# every command must start with a token of your choice
# "a" was used for commands below
LOGIN username password
a LIST "" "*"       # list mails in every folder
a EXAMINE INBOX     # show number of emails in INBOX
a FETCH 1:* (FLAGS) # list all mails
a FETCH 1 (BODY[])  # show message uid=1 body
a LOGOUT            # logout
```
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

You may try to use [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md):

```ps
$ hydra -L /path/to/users.lst -P /path/to/pass.lst imap://IP
```

If you compromise an email account, make sure to take note of the internal employees emails as they may be their usernames.
</div><div>
</div></div>

<hr class="sep-both">

## Alternatives to CLI

<div class="row row-cols-lg-2"><div>

#### Using cURL to fetch emails

You can use cURL to fetch emails.

```ps
$ curl -k 'imaps://IP' --user username:password
$ curl -k 'imaps://IP/INBOX?ALL' --user username:password
$ curl -k 'imaps://IP/INBOX;MAILINDEX=1' --user username:password
```
</div><div>

#### Using evolution to fetch emails

You can use [evolution](https://en.wikipedia.org/wiki/GNOME_Evolution) to fetch emails. It's a graphical mail client.

```ps
$ sudo apt install evolution
$ evolution
```

Configure a new mailbox.

* **Step 1**: Add a random full name, and the targeted email, and optionally toggle "Don't lookup."
* **Step 2**: Fill `server`, `port`, and `username`
* **Step 3**: Unselect all
* **Step 4**: Select 'None'
* Finish, Apply
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* dovecot-imapd
* `sudo nmap IP -p143,993 -sC -sV`
</div><div>
</div></div>