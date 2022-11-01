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

# Notes

* netdiscover
* security triad: CIA.

## Burp

* take a request captured in the Proxy, edit it, and send the same request repeatedly as many times as we wish
* tabs per request
* ISO/OSI

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

Servers implementing these protocols are subject to different kinds of attacks. To name a few, consider:

* Sniffing Attack (Network Packet Capture)
  * using a network packet capture tool to collect information about the target
  * Tcpdump is a free open source command-line interface (CLI) program that has been ported to work on many operating systems.
  * Wireshark is a free open source graphical user interface (GUI) program available for several operating systems, including Linux, macOS and MS Windows.
  * Tshark is a CLI alternative to Wireshark.
  * Before explaining this command, we should mention that this attack requires access to the network traffic, for example, via a wiretap or a switch with port mirroring. Alternatively, we can access the traffic exchanged if we launch a successful Man-in-the-Middle (MITM) attack.
  * `sudo tcpdump port 110 -A` (only port 110=POP3, and ASCII)
  * Wireshark: enter "pop" > same result but nicer
  * TLS have been added to HTTP, FTP, SMTP, POP3, and IMAP
* Man-in-the-Middle (MITM) Attack
  * A Man-in-the-Middle (MITM) attack occurs when a victim (A) believes they are communicating with a legitimate destination (B) but is unknowingly communicating with an attacker (E).
  * The attacker can modify the information send by the client, or sniff packets. It depends of the integrity checks/security of the protocol.
  * https://www.ettercap-project.org/
  * https://www.bettercap.org/
  * The solution lies in proper authentication along with encryption or signing of the exchanged messages. With the help of Public Key Infrastructure (PKI) and trusted root certificates, Transport Layer Security (TLS) protects from MITM attacks.
* SSL (Secure Sockets Layer) then TLS (more secure).
  * HTTPS: 443
  * FTPS: 990
  * SMTPS: 465
  * POP3S: 995
  * IMAPS: 993
  * They add an additional step when connected with the server, which is establishing a SSL/TLS connection
    * SSL: ClientHello (indicate supported algorithms)
    * Exchanges information to create a maser key
    * The server reply that it will use encryption
  * DOT (DNS Over TLS)
* Password Attack (Authentication Attack)
  * hydra -d, for debugging
  * Mitigations: https://tryhackme.com/room/protocolsandservers2

--- https://tryhackme.com/room/vulnerabilities101

vulnerabilities = weakness or flaw.  five main categories of vulnerabilities

* Operating System
* (Mis)Configuration-based
  * Version Disclosure
* Weak or Default Credentials
* Application Logic
* Human-Factor

Not all vulnerabilities are exploitable.

*  the popular Common Vulnerability Scoring System (CVSS, 2005, free+opens-source) awards points to a vulnerability based upon its features, availability, and reproducibility. It takes into account the impact on the CIA triad, the ease of use, and the existence of exploits. https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator
* Vulnerability Priority Rating (VPR): modern, based on the risks to an org

* “Common Vulnerabilities and Exposures”
* https://nvd.nist.gov/vuln/full-listing

Why they're worthy of learning about
How are vulnerabilities rated
Databases for vulnerability research
A showcase of how vulnerability research is used on ACKme's engagement