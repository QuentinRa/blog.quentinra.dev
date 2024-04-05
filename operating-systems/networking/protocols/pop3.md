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
$ curl -k 'pop3s://IP' [...] -X 'RETR 1'
$ openssl s_client -connect IP:pop3s
```
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Foothold

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

* You may try to use [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md):

```shell!
$ msfconsole -q
msf6> use auxiliary/scanner/pop3/pop3_login
msf6> set USER_FILE /path/to/users.lst
msf6> set PASS_FILE /path/to/pass.lst
msf6> setg RHOSTS IP
msf6> run
```

* You can try to use `USER`:

```shell!
$ telnet IP 110
USER xxx
-ERR
USER yyy
+OK
```
</div><div>
</div></div>

<hr class="sep-both">

## APOP

[![pop_apop](../../../cybersecurity/_badges/rootme/network/pop_apop.svg)](https://www.root-me.org/en/Challenges/Network/POP-APOP)

<div class="row row-cols-lg-2"><div>

The [APOP](https://www.rfc-editor.org/rfc/rfc1939#page-15) is an authentication method that can be implemented by a POP3 Server. Instead of sending the cleartext password:

* The server will send a challenge text to the client
* The client will return the hash of `md5(challenge + password)`
* The server will compute the hash `md5(challenge + saved_password)` and compare it with the hash it received

This authentication method is still vulnerable to sniffing.

A hacker having both the challenge and the hash can try to brute force the password. With `hashcat`:

```shell!
$ cat hash
hash:challenge
$ hashcat -m 20 hash wordlist
```
</div><div>

With John, it's sightly complex:

```shell!
$ cat apop2john.py
```

```py
import argparse

parser = argparse.ArgumentParser(description="Generate output based on user, hash, and salt.")
parser.add_argument("hash", type=str, help="Hash string")
parser.add_argument("salt", type=str, help="Salt string")
args = parser.parse_args()
print(f':$dynamic_1017${args.hash}$HEX${args.salt.encode().hex()}')
```

```ps
$ python apop2john.py "hash" "challenge" > hash
$ john hash --wordlist=wordlist --format=raw-md5 --rules rule
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* dovecot-pop3d
* `sudo nmap IP -p110,995 -sV -sC`
</div><div>
</div></div>