# Notes

* **offensive**

Look for vulnerabilities. **penetration tester** (web security, 
network security knowledge, use various programming languages, cloud security)

* **defensive Security**. 
  * **Security Analyst** (monitor - splunk?)
  * **Incident Responder** (impact? goal? what can they do? - Volatility?)
  * **malware analysis**

Detect, and stop attacks.

<hr class="sep-both">

## Web

"You need to understand a website, to find weakness, and process hacking a website."

* Try hacking "reset password"

<hr class="sep-both">

## know how?

Attack a vulnerable machine, scan the network to discover more vulnerable machines.

<hr class="sep-both">

## Linux

* `<command> <flag> <input>`
* `&` bg
* `$USER`, `export <varname>=<value>`
* `cat -`
* `;`
* ugo or uge = everyone else?
* `/etc/shadow`
* `Secure copy, or SCP` scp file_to_upload user@ip:path/to/upload scp user@ip:path/to/ddl dest
* python3 -m  http.server: start web server, was used to open a "root" file without perms
* `ps aux`: process not attached to a session / belonging to others
* `top`, `kill` SIGTERM (soft kill, allow cleanup), SIGSTOP (suspend), SIGKILL (kill)
* `systemctl` allow to interact with the systemd process/daemon
  * `systemctl start apache2` (start, stop, enable, disable)
* `cron` process to schedule tasks, with `crontabs` (file)
  * ...
  * https://crontab-generator.org/
  * https://crontab.guru/
  * edit `crontab -e`
* `dpkg` / apt in /etc/apt/sources.list.d
* Logs
  * `/var/log`
    * ufw: firewall
    * apache
    * fail2ban
* `nc address port`
* `find` -size (c for bytes, k for kilobytes, M megabytes, G for gigabytes)
  * `-user username`
  * `-group gname`
  * -newermt
  * -newerat
  * find a file with a modified date of 2016-09-12
    * `find ~/workflows/ -newermt 2016-09-11 ! -newermt 2016-09-13`
* `grep -iRl` find files by keyword, `grep -o "....{.*}"` (match only)
* http://explainshell.com/
* CTRL+L same as clear
* `2>/dev/null`
* search with `/`, then ENTER or n

![img.png](_images/bits.png)

<hr class="sep-both">

## Tools

* Putty
* Nmap
  * 65535 available ports
  * standard ports (https://techhyme.com/list-of-commonly-used-well-known-ports/)
  * open, closed, or filtered (usually by a firewall)
  * `Syn Scan` (SYN "Half-open"/"stealth" Scan) -sS
  * version only: -sv
  * Each of these values after "s" are called switches
  * **advised to use at least** `-vv`!!!!!!!!!!!!!!!!!!!!!!!!!!
  * `-oA` to save results in normal (N), XML (X), and grepble (G) formats at once
  * -a: shorthand service detection, operating system detection, a traceroute and common script scanning
  * `-p-` scan all ports
  * `--script=vuln` `--script vuln` activate all scripts in the vuln category
  * TCP scan (request with SYN/ACK=ok RST=closed), but firewall
  * SYN: when receving response that port open, then respond that yours is closed, slightly faster than TCP, need sudo
    * default if sudo, TCP otherwise
  * UDP is slower cause no ACK "open|filtered": no response, "ICMP" (protocol, ping): closed
    * `-top-ports 20`
  * -sN (NULL scans), -sF (FIN scans), -sX (Xmas scans): even stealthier than SYN,
    but they may bypass firewall drop TCP packets SYN flag
    Windows (and a lot of Cisco network devices) may respond "RST" to all 3 scans, as they are sending malformed packets
  * nmap -sn 192.168.0.1-254 / nmap -sn 192.168.0.0/24
  * Nmap Scripting Engine (NSE)
    * from scanning for vulnerabilities, to automating exploits for them
    * safe:- Won't affect the target
    * intrusive:- Not safe: likely to affect the target
    * vuln:- Scan for vulnerabilities
    * exploit:- Attempt to exploit a vulnerability
    * auth:- Attempt to bypass authentication for running services (e.g. Log into an FTP server anonymously)
    * brute:- Attempt to bruteforce credentials for running services
    * discovery:- Attempt to query running services for further information about the network (e.g. query an SNMP server).
    * https://nmap.org/book/nse-usage.html
    * --script=a,b --script-args a.key=value,...
    * /usr/share/nmap/scripts
    * To install manually a script
      * sudo wget -O /usr/share/nmap/scripts/<script-name>.nse https://svn.nmap.org/nmap/scripts/<script-name>.nse
      * nmap --script-updatedb
    * ls -l /usr/share/nmap/scripts/*smb* (ex: script smb server)
  * -Pn: do not ping, so don't check host is up, which is allowing us to scan host that block ICMP packets
  * SYN + -Pn results, no -Pn: no results
  * https://nmap.org/book/
  * if you see "no-response", then it's closed
  * firewall evasion
    * -f fragment packet
    * --scan-delay xms
    * --badsum: some firewall respond automatically without checking the checksum, so you can know if there is a firewall
    * https://nmap.org/book/man-bypass-firewalls-ids.html

## Folk

Intrusion Detection System (IDS) is a system that detects unauthorised network and system intrusions. Examples include detecting unauthorised devices connected to the local network and unauthorised users accessing a system or modifying a file.

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

"Samba is the standard Windows interoperability suite of programs for Linux and Unix. It allows end users to access and use files, printers and other commonly shared resources on a companies intranet or internet. Its often referred to as a network file system.

Samba is based on the common client/server protocol of Server Message Block (SMB). SMB is developed only for Windows, without Samba, other computer platforms would be isolated from Windows machines, even if they were part of the same network."

* Using nmap we can enumerate a machine for SMB shares:
  * port 445, and 139
  * `nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse <ip> -vv`
* `smbclient //<ip>/anonymous` login without password
* You may find useful information