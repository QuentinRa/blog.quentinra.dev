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

## Networking

The OSI (Open Systems Interconnection) Model is a standardised model which we use to demonstrate the theory behind computer networking.
In practice industry is using the TCP/IP model (more compact)

* Layer 7 -- Application: interface for programs - ex: FTP
* Layer 6 -- Presentation: standardize the message, handle encryption, compression...
* Layer 5 -- Session: try to establish a connection
* Layer 4 -- Transport: Select protocol, and make segments (TCP), or datagrams (UDP)
* Layer 3 -- Network: IP (network) - packet
* Layer 2 -- Data Link: MAC (machine), and integrity check, along preparations for transmission
* Layer 1 -- Physical: binary to signals, receive signals and convert them back

![OSI headers](_images/osi_headers.png)

Headers: verify integrity, store src, dest...

* encapsulation: add headers
* de-encapsulation: reverse process

TCP/IP (introduced first)

* Application (L7-L5)
* Transport (L4)
* Internet (L3)
* Network interface (L2-L1) - some are breaking it into two, but not in RFC1122

TCP (connection-based protocol) "three-way handshake": SYN (synchronise) SYN/ACK ACK (Acknowledgement)
UDP (connectionless)
ICMP protocol, one of the TCP/IP protocols / Network Level

* `ping -i`: interval, -4 ipv4, -v verbose, -I interface
* `traceroute`: Traceroute can be used to map the path your request takes as it heads to the target machine.
* `traceroute host`, -I interface, -t USE TCP SYN
  * Layer Internet

protocol called DNS (Domain Name System): domain to IP
- check local cache
- ask recursive DNS server
  - Many Internet Service Providers (ISPs) maintain their own recursive servers,
  - Top-Level Domain servers: records for specific extensions
- TLD servers keep track of the next level down: Authoritative name servers
- Authoritative name servers: store DNS records
- dig domain `@dns-server-ip` such as @1.1.1.1 @8.8.8.8/8.8.4.4 (google)
- **ANSWER**
  - domain ttl IN type IP
  - ttl, time to live (in seconds), how much time this result is valid

* whois: https://www.whois.com/whois/
* https://osintframework.com/

Networks: things connected.
  * (The) Internet: many small networks all joined together
  * public/private networks
  * To identify a device: MAC+IP
    * IP **logical identifier**: 4 octets=32 bits, 0-255, private/public ips, given by Internet Service Provider (or ISP)
      * Network Address
      * Host Address
      * Default Gateway: special address that is capable of sending information to another network (.1 or .254)
        Any data that need to go to a device that isn't on the same network will be sent here.
      * subnetting: use Network Adress to split the network
        * is achieved by splitting up the number of hosts that can fit within the network, represented by a number called a subnet mask
        * 32 bits
    * IPV6: 2^128 of IP addresses (340 trillion-plus), "More efficient due to new methodologies"
    * MAC (Media Access Control) - **physical identifier**, assigned to network card, twelve-character hexadecimal number, colon-separated
      can be spoofed/faked
      * 6 first: vendor/manufacturer
      * 6 last: unique address

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

## SQL

* service mysql start
* mysql -u root -p -h ip
* Type "source" followed by the filename of the mysql database to specify that you wish to view its database.
* `DESCRIBE [table name]`
* `source [sql filename]`: import. Don't write a path, move to the folder with the file.