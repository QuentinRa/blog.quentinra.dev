# Notes

**offensive security**

Look for vulnerabilities, recommend patches. Exploiting bugs. Finding loopholes. Gain unauthorized access.

* **penetration tester**: "Responsible for testing technology products for finding exploitable security vulnerabilities." (web security, network security knowledge, use various programming languages, cloud security)
* **Red Teamer**: "Plays the role of an adversary, attacking an organization and providing feedback from an enemy's perspective."
* **Security Engineer**: "design, monitor, and maintain security controls, networks, and systems to help prevent cyberattacks".

**defensive Security**. 
  * **Security Analyst** (monitor - splunk?)
  * **Incident Responder** (impact? goal? what can they do? - Volatility?)
  * **malware analysis**

Detect, and stop attacks. Monitor, analyze. Investigate infected computers, try to find how they were hacked, track down cybercriminals.

* Linux security researcher > Hashing

<hr class="sep-both">

## Random

* Attack a vulnerable machine, scan the network to discover more vulnerable machines.

* find "password" in some conversations > try to get access to some stuff with it

* Intrusion Detection System (IDS) is a system that detects unauthorised network and system intrusions. Examples include detecting unauthorised devices connected to the local network and unauthorised users accessing a system or modifying a file.

* "bug bounty programs"

<hr class="sep-both">

## Tools

* https://osintframework.com/

Not-related to cyber

* https://www.zoho.com/office/

Moar

* https://dhilipsanjay.gitbook.io/ctfs/

<hr class="sep-both">

## Linux

* python3 -m  http.server: start web server, was used to open a "root" file without perms
* `cron` process to schedule tasks, with `crontabs` (file)
  * ...
  * Automated tasks in Linux
  * https://crontab-generator.org/
  * https://crontab.guru/
  * edit `crontab -e`
* Logs
  * `/var/log`
    * ufw: firewall
    * apache
    * fail2ban
* `scp -r`
* `nc -l -p 12345`

<hr class="sep-both">

## Networking

* Default Gateway: special address that is capable of sending information to another network (.1 or .254)
       Any data that need to go to a device that isn't on the same network will be sent here.
     * subnetting: use Network Address to split the network
       * is achieved by splitting up the number of hosts that can fit within the network, represented by a number called a subnet mask
       * 32 bits

* Local Area Network (LAN)
  * **Star Topology**: all devices are connected to a central networking device such as a switch or hub
  * **Bus Topology**: a single cable "backbone cable", all devices connect to the cable, too much packets: satured
  * **Ring/Token Topology**: each computer is connected to another forming a loop, data do the whole loop if needed, only one direction, not efficient, if hardware/cable is down/dead/fault network broken
  * **Switch**: aggregate multiples devices (4-64 ports), send packet to target because they know which target is on which of its ports
  * **Router**: connect networks, do "routing" (decide which route packets take)

* **DHCP**
  * IP adresses can be assigned manually
  * or most commonly by using a DHCP (Dynamic Host Configuration Protocol) server
  * If device connect, and has no IP
    * Send request to retrieve an IP: DHCP Discover
    * DHCP server replies if any, with an IP: DHCP Offer
    * The device confirm the IP: DHCP Request
    * The server ack: DHCP ACK
    * NOTE: ACK, REQUEST... are DHCP packets

<hr class="sep-both">

### Samba

"Samba is the standard Windows interoperability suite of programs for Linux and Unix. It allows end users to access and use files, printers and other commonly shared resources on a companies intranet or internet. Its often referred to as a network file system.

Samba is based on the common client/server protocol of Server Message Block (SMB). SMB is developed only for Windows, without Samba, other computer platforms would be isolated from Windows machines, even if they were part of the same network."

* Using nmap we can enumerate a machine for SMB shares:
  * port 445, and 139
  * `nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse <ip> -vv`
* `smbclient //<ip>/anonymous` login without password
* You may find useful information

<hr class="sep-both">

### Hashing

* Take input, and generate a hash. It's a one-way function.
* Ex: https://www.md5hashgenerator.com/ (weak, so is SHA1, as two input same output)
* most important use: integrity checking
* bruteforce, with **John the Ripper**
  * john --format=raw-md5 myHash.txt
  * john --format=raw-md4 --wordlist=xxx.txt myHash.txt
  * john --format=raw-sha1
  * john --format=gpg
  * if it takes a lot of time, try another algorithm first
  * if it takes a lot of times, try reversing the wordlist
  * you can use "cat x & cat y && cat z > hhh", then "grep -e something > stuff" to merge then filter
* Type of Hash
  * `hash-identifier <input>` to find the type for well-known hashes
  * https://hashes.com/en/tools/hash_identifier
  * Modern alternative: https://github.com/noraj/haiti

base64

* a group of binary-to-text encoding schemes that represent binary data in an ASCII string format
* `xxx | base64 -d`
* https://www.base64encode.net/

gpg

* way to encrypt something
* `gpg --cipher-algo [encryption type] [encryption method] [file to encrypt]`
* `[encryption type]`: AES-256
* `[encryption method]`: `--symmetric`
* way to decrypt
* `gpg encrypted_file`
* crack
* `sudo gpg2john file`: convert gpg to hash

<hr class="sep-both">

## SQL

* service mysql start
* mysql -u root -p -h ip
* Type "source" followed by the filename of the mysql database to specify that you wish to view its database.
* `DESCRIBE [table name]`
* `source [sql filename]`: import. Don't write a path, move to the folder with the file.

<hr class="sep-both">

### Steganography

Hide things in images: [Steganography](https://0xrick.github.io/lists/stego/).

<hr class="sep-both">

### Search engines

Crawler/spiders are indexing websites. Follow URL by URL.

Search Engine Optimisation

* easy to crawl (sitemaps)
* keywords
* responsiveness

Robots.txt can be used to disallow robots from indexing pages. Maybe they add some config files (ini Windows, conf Linux).

**Google dorking**

* `"exact"`
* `site:domain`
* `filetype:pdf`
* `cache:domain`: cached version of URL
* `intitle:...`: must be in the title

<hr class="sep-both">

### DNS

TLD

* gTLD (Generic Top Level)
* ccTLD (Country Code Top Level Domain)

Historically, gTLD were used to tell the purpose (.com=commercial), and ccTLD were used for geographical purposes.

Second-Level Domain: xxx.com, xxx is a SLD.
Subdomain: www

DNS records

* A = IPV4
* AAAA = IPV6
* CNAME Record: sort of "A" pointing to "B", so go ask the IP of "B"?
* MX Record = Mail server
* TXT Record = a lot of uses, such as to verify ownership of the domain name when signing up for third party services

A recursive server is provided by your ISP, you can pick your own. This server has a cache.

The authoritative server is often also known as the nameserver for the domain.

TTL is in seconds.

<hr class="sep-both">

### Websites

* Identification and Authentication Failure
  * Do not prevent bruteforce
  * Allow users to use weak passwords
  * Not encrypting passwords
* Broken Access Control (can access files/URLs we shouldn't)
  * principle of the least privilege not applied correctly
  * use someone token/id to view/edit/...
  * Access "authenticated-only" page without logging in
* Injection
  * validation
  * sanitization
* Cryptographic Failures
  * using clear text
  * HTTP instead of HTTPS
  * weak algorithm

BAC : Insecure Direct Object References (IDOR). Example is a server service resources, with a URL in which we can guess other files names.

<hr class="sep-both">

## Forensics

"You need to understand a website, to find weakness, and process hacking a website."

https://tryhackme.com/room/introdigitalforensics

Forensics is the application of science to investigate crimes and establish facts -> digital forensics. Digital forensics is used in two types of investigations:

* Public-sector investigations (gov, law enforcement)
* Private-sector investigations (hired by companies)

---------

pdfinfo DOCUMENT.pdf
sudo apt install poppler-utils
Open in edge -> details.

------

Images.

* Camera model / Smartphone model
* Date and time of image capture
* Photo settings such as focal length, aperture, shutter speed, and ISO settings
* GPS coordinates (if there is a GPS sensor)

exiftool. ExifTool is used to read and write metadata in various file types, such as JPEG images.

sudo apt install libimage-exiftool-perl

https://jimpl.com/
https://www.geekyhumans.com/tools/image-metadata-viewer

<hr class="sep-both">

## IPP - (TCP/631)

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