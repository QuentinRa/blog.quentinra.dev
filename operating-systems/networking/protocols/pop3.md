# POP3

[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)

<div class="row row-cols-md-2"><div>

Post Office Protocol version 3 is a protocol that opens the box, checks if there are (new) emails, and if any, downloads and removes them from the box.

🐊️ **Port**: 110 (TCP)

🔥 POP3 communications are not encrypted.

🔒 There is a secure version called POP3S <small>(port 995, over SSL/TLS)</small>.

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