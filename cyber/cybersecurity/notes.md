# R

* Remember for web/general/security

<hr class="sep-both">

## OWASP

* https://owasp.org/www-project-top-ten/
* Juiceshop
* https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html
* https://github.com/OWASP/wstg
* https://wiki.owasp.org/index.php/OWASP_Testing_Guide_v4_Table_of_Contents
* https://github.com/OWASP/CheatSheetSeries
* https://www.zaproxy.org/
* https://github.com/OWASP/Amass

<hr class="sep-both">

## enum4linux

![Usage: Enumerating Information](https://img.shields.io/badge/usage-Enumerating%20Information-ffd700)

I don't know if there is still an `enum.exe`, because I can't find it, but you can use the tool [enum4linux](https://github.com/CiscoCXSecurity/enum4linux) for enumerating information from Windows, and Samba hosts.

```bash
$ ./enum4linux.pl <options> <ip>
# -U : list of users
# -M : list of devices
# -S : list of shares
# -o : os data
# -i : printer data
# -v : verbose
```

<hr class="sep-both">

# Notes

* https://tryhackme.com/resources/blog/online-training-for-careers
* https://tryhackme.com/resources/blog/cyber-security-awareness-month
* There are websites on the Internet that allow you to check the reputation of an IP address to see whether it's malicious or suspicious.
  * AbuseIPDB
  * Cisco Talos Intelligence
  * https://ipinfo.io/
* https://www.virustotal.com/gui/home/upload
* https://www.hybrid-analysis.com/
* https://otx.alienvault.com/ (An open-source threat tracking system)

<hr class="sep-both">

# Learn again

* netdiscover

## Burp

* take a request captured in the Proxy, edit it, and send the same request repeatedly as many times as we wish
* tabs per request

<hr class="sep-both">

# xxx

Sending a mail involves a Mail Submission Agent (MSA) to send the mails to someone who can send it, a Mail Transfer Agent, which will send it to the Mail Delivery Agent, that will achieve it to the other Mail User Agent. MTA+MTA is common.

* Simple Mail Transfer Protocol (SMTP): use plaintext. port 25.
  * helo hostname
  * mail from:
  * rcpt to:
  * data
    * subject:
    * <CR>.<CR>
* POP3/IMAP are protocols to download mails from a MDA
  * Post Office Protocol version 3 (POP3, 110): USER/PASS to the server. STAT to find the number of mails, and the size of the mailbox. LIST to list new messages. RETR 1 to retrieve the "1rst" one. plaintext. Email is deleted once downloaded (default), but you would lose track or read/unread.
  * Internet Message Access Protocol (IMAP) - 143: LOGIN username password. Synchronisation: if you read something, then the status is updated on the server.
    * c1 LIST "" "*" (list emails in any folder)
    * c2 EXAMINE INBOX
    * c3 LOGOUT
    * Send as clear text