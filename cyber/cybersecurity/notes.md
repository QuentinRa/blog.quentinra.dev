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

## Web

* "You need to understand a website, to find weakness, and process hacking a website."

* Attack a vulnerable machine, scan the network to discover more vulnerable machines.

* find "password" in some conversations > try to get access to some stuff with it

* Intrusion Detection System (IDS) is a system that detects unauthorised network and system intrusions. Examples include detecting unauthorised devices connected to the local network and unauthorised users accessing a system or modifying a file.

<hr class="sep-both">

## Web tools

* https://osintframework.com/

<hr class="sep-both">

## Linux

* python3 -m  http.server: start web server, was used to open a "root" file without perms
* `cron` process to schedule tasks, with `crontabs` (file)
  * ...
  * https://crontab-generator.org/
  * https://crontab.guru/
  * edit `crontab -e`
* Logs
  * `/var/log`
    * ufw: firewall
    * apache
    * fail2ban

![img.png](_images/bits.png)

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

* Address Resolution Protocol (ARP)
  * Protocol, allow a device to associate its MAC address with an IP
  * broadcast using ARP protocol to find MAC
    * ARP Request broadcasted, is it you having this MAC for this IP?
      * src mac
      * dest mac: FF:FF:FF:FF:FF:FF
    * ARP Reply: yes
      * src mac
      * dest mac
    * cache result

* **DHCP**
  * IP adresses can be assigned manually
  * or most commonly by using a DHCP (Dynamic Host Configuration Protocol) server
  * If device connect, and has no IP
    * Send request to retrieve an IP: DHCP Discover
    * DHCP server replies if any, with an IP: DHCP Offer
    * The device confirm the IP: DHCP Request
    * The server ack: DHCP ACK
    * NOTE: ACK, REQUEST... are DHCP packets

## Stuff

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