# Nmap: the Network Mapper

[![nmap01](../../_badges/thm/nmap01.svg)](https://tryhackme.com/room/nmap01)
[![nmap02](../../_badges/thmp/nmap02.svg)](https://tryhackme.com/room/nmap02)
[![nmap03](../../_badges/thmp/nmap03.svg)](https://tryhackme.com/room/nmap03)
[![nmap04](../../_badges/thmp/nmap04.svg)](https://tryhackme.com/room/nmap04)
[![furthernmap](../../_badges/thm/furthernmap.svg)](https://tryhackme.com/room/furthernmap)
[![vulnversity](../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![blue](../../_badges/thm-p/blue.svg)](https://tryhackme.com/room/blue)
[![ice](../../_badges/thm-p/ice.svg)](https://tryhackme.com/room/ice)
[![blaster](../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)
[![kenobi](../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![rrootme](../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![basicpentestingjt](../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![netsecchallenge](../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)
[![startup](../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![cowboyhacker](../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)
[![steelmountain](../../_badges/thmp-p/steelmountain.svg)](https://tryhackme.com/room/steelmountain)

<div class="row row-cols-md-2"><div>

**nmap** ([nmap book](https://nmap.org/book/), [GitHub](https://github.com/nmap/nmap) 7.1k ⭐) is a tool to detect hosts, their open ports, and eventually run script trying to go more information, or even exploiting a vulnerability to gain access.

We are calling **probe** a request made to inquire about something from a host, such as testing if a port is open.

> There is an interface to `nmap` called [ZenMap](https://nmap.org/zenmap/).

> It may take a long time to scan, so you should save your scans, and this is one stone two birds as they can be imported in other tools 🚀!
</div><div>

A port is used by a protocol such as FTP (File Transfer Protocol) to transfer data. There are $2^{16}$ ports, while the first 1024 are restricted, and can only be used by standard protocols. A port can be changed. Look for **vulnerable ports** on Google. A port can be

* `open`: can be reached
* `filtered`: no response, usually meaning that it's filtered by a firewall
* `unfiltered`: nmap can't determine if the port is open, or filtered
* `closed`: cannot be reached
</div></div><br>

> * [Networking/Ports](/_it/networking/general/index.md#ports) to learn more about ports
> * [Networking/Services](/_it/networking/protocols/index.md) to learn more about the services using these ports
> *  [Cyber/Services](/_cybersecurity/exploitation/services/index.md) to learn more about how you can exploit services
> * [Cyber/Brute force services](/_cybersecurity/exploitation/services/bruteforce.md) to try to brute force a service credentials.

<hr class="sep-both">

## **ICMP Requests** ⚠

<div class="row row-cols-md-2"><div>

By default, nmap will send a query checking if a host is up. This query is an ICMP request, but they are **blocked on Windows** <small>(Windows replies closed to every ICMP request by default)</small>.

To scan Windows hosts, use the option `-Pn`. The problem with that, is that if the host is actually not running Windows, but is down, then you will wait a lot, so only use that if you are sure that the host is up, or you were informed that the host does not accept ICMP requests (#CTF).
</div><div>

If you receive a response using ping, everything is good. If you don't, then either the host is up, and blocking ICMP requests, or it's down.

```bash
$ ping -c 10 IP
```

Example of using `-Pn`

```bash
$ nmap IP # not working if it's a Windows host
$ nmap IP -Pn # fixed 😎
```
</div></div>

> **Random note**: if you try to use nmap on a host living in the same network, then, if the scan is run with elevated privileges, an ARP scan will be used instead. You can explicitly request an ARP scan with `-PR`. Another way of doing an ARP scan is using `sudo arp-scan -l -I eth0`.<br><br>
> **Random note**: ICMP echo requests `-PE`. ICMP timestamp requests `-PP`. ICMP 17/18 `-PM`. TCP 3-way handshake `-PS`. TCP ACK `-PA`. UDP `-PU`.

<hr class="sep-both">

##  🎯 Define the target(s) 🎯

<div class="row row-cols-md-2 mt-4"><div>

Nmap can scan one or more hosts

```bash
$ nmap 127.0.0.1
$ nmap 192.168.0.1-254 # from 1 to 254
$ nmap 192.168.0.0/24 # same
$ nmap scanme.nmap.org scanme.nmap.org # list
$ nmap -iL hosts.txt
```

If you don't want `nmap` to fetch DNS records, use `-n`. You can use `-R` to force `nmap` to query DNS servers.

```bash
$ nmap -n 10.10.12.13
# won't look for the domain associated with this IP
```
</div><div>

You can use `-sL` to list every host that will be scanned.

```bash
$ nmap -sL -n 92.168.0.1/29
# Nmap scan report for 92.168.0.0
# [...]
# Nmap scan report for 92.168.0.7
# Nmap done: 8 IP addresses (0 hosts up) scanned in 0.01 seconds
```
</div></div>

<hr class="sep-both">

## 🤯 Kinds of scans 🤯

Nmap can do multiple **scans** with `-s<type>`, and it's up to you to pick the "right" one according to your case, and what you are looking for, along with the constraints that you may have.

<div class="row row-cols-md-2"><div>

### ➡️ TCP Scans

> **TCP scans** are scans used to **detect TCP ports**, meaning ports used by a protocol using the connection-based protocol TCP. TCP is a protocol in which every message sent, is followed by a reply, and an acknowledgment of receiving the reply. This is slower than UDP, but, it allows us to ensure that a message is received.

*  **TCP Scan** | `-sT`. Default scan if not root. Usually blocked by firewalls. Send an SYN packet, and receive RST (closed), or SYN/ACK (open). If the latter, answer back with ACK (3-ways handshake).

* **TCP Syn (Half-open/Stealth) Scan** | `-sS` | `Need root privileges`. Default scan as root. Same as a TCP scan, but close the connection with 'RST,ACK'. Sightly faster than `-sT`.

The 3 scans below can be used to try to bypass weak firewalls that have only rules for the two previous well-known scans. As they are only checking if a port is closed, every port is marked `open|filtered`. Note that some OS such as Windows, are responding `closed` to any malformed packet.

* **TCP NULL scans** | `-sN` | `Need root privileges`. Send a malformed packet with no flags. If the port is closed, an RST packet is received.

* **TCP FIN scans** | `-sF` | `Need root privileges`. Send a malformed packet with an invalid flag (FIN). If the port is closed, an RST packet is received.

* **TCP Xmas scans** | `-sX` | `Need root privileges`. Send an unexpected packet with FIN+PSH+URG flags.  If the port is closed, an RST packet is received.

* **Maimon scan** | `-sM` | `Need root privileges`. Useless. Send an unexpected packet with FIN+ACK flags. Most modern targets will reply with RST regardless of whether the port is open, or not.

</div><div>

### ➡️ UDP Scans

> **UDP Scans** are scans used to **detect UDP ports**, meaning ports using the UDP connection-less protocol, in which a message is sent, with no reply, and without care if the message was received or not, corrupted or not... This is quite faster than TCP.

* **UDP Scan** | `-sU` | `Need root privileges`. The scan is slow as UDP ports may only respond if they are closed (with a PING/ICMP), so the scan must send multiple requests, to ensure that the port isn't closed, as there is no way to ensure that the port is open, so they are usually marked as `open|filtered`.

### ➡️ ICMP Scans

* **Ping Scan** | `-sn`. Do not scan ports, instead, check if a host is up. It uses ARP if started as root, and the target is on the same network.

### ➡️ Scans to find ports unprotected by a firewall

* **ACK scan** | `-sA`. Send a packet with ACK, any port will reply with RST. But, the response is analyzed to find if the firewall or the port responded.

* **Window scan** | `-sW`. Same as ACK, but analyze the window field to identify who responded. On some systems, it may even help in determining if the port is open, or not.

Note that a port not being protected by a firewall does not imply that the port is open, as the firewall may not have been updated.

### ➡️ Custom

You can create custom scans with `--scanflags`

```bash
# RST SYN FIN enabled
$ sudo nmap [...] --scanflags RSTSYNFIN
```

</div></div>

<hr class="sep-both">

## 🔎 Nmap in practice 🔎

<div class="row row-cols-md-2"><div>

<p class="mt-3"><b>1. Required parameters</b></p>

As mentioned before, we need a host (or multiple hosts)

```bash
$ nmap scanme.nmap.org
```

Then, we will use a kind of scan according to the situation.

```bash
# in CTF, these two are the most used ones
$ nmap -sT scanme.nmap.org
$ sudo nmap -sS scanme.nmap.org
# ...
```

<p class="mt-3"><b>2. Verbose</b></p>

Usually, as scans take a lot of time, we are adding `-v` to increase the verbosity. You can use `-v`, `-vv`, `-d`, and `-dd`.

```bash
$ nmap -vv scanme.nmap.org # level 2 verbose
```

<p class="mt-3"><b>3. Store result</b></p>

```bash
# primitive, and not really handy way
$ nmap scanme.nmap.org > output_file_name
# generate .nmap=-oN, .gnmap=-oG, and .xml=oX
# -oG is kinda nice, as the file is grep-able (grep xxx output)
$ nmap -vv scanme.nmap.org -oA output_file_name
```
</div><div>

<p class="mt-3"><b>Select port ranges</b></p>

By default, `nmap` will scan the top 1000 ports that should be checked.

```bash
$ nmap -vv scanme.nmap.org -F # Fast, only top 100
$ nmap -vv scanme.nmap.org -p 22 # only port 22
$ nmap -vv scanme.nmap.org -p 22,23 # both 22, and 23
$ nmap -vv scanme.nmap.org -p 0-65535 # from 0 to ...
$ nmap -vv scanme.nmap.org -p- # same !!!
$ nmap -vv scanme.nmap.org -p22-25,80,443 # mix
$ nmap -vv scanme.nmap.org -top-ports 20 # top 20
```

You can ask for ports to be queried in consecutive order with `-r`.

<p class="mt-3"><b>Stealth level</b></p>

You can set the intensity of the scan to decrease the risks of between detected by adding timing between requests from 0 to 5, while 0 means one request per 5 minutes <small>(paranoid (0), sneaky (1), polite (2), normal (3), aggressive (4), and insane (5))</small>. Note that T3 is the default, T0/T1 are usually used for stealth, T4 is the most used in CTFs, and T5 can be inaccurate as many packets may be lost.

```bash
$ nmap -vv scanme.nmap.org -T5 -p22
```

Other alternatives are `--min-rate/--max-rate` to set the rate per second, or `--min-parallelism/--max-parallelism` for the number of probes made in parallel.

<p class="mt-3"><b>Dig information</b></p>

* `-sV`: what are the services used by the open ports? What are their versions? <small>(ex: 80 $\to$ Apache x.xx.xx)</small>. May also guess the OS. You may set the intensity with `--version-intensity level` (from 0 to 9). There are shortcuts `--version-light` (2), and `--version-all` (9).
* `-sC`: execute default scripts <small>(find hostname, OS, computer name...)</small>
* `-O`: what's the operating system of the host, a bit unreliable
* `-A`: all the above, and some more
* The line `Service Info: Host: Os:` usually has some information.

```bash
$ nmap -sV scanme.nmap.org -vv
```
</div></div>

> **Random**: you can press <kbd>Enter</kbd> during a scan in progress to query the progress of the scan.

<hr class="sep-both">

## 📌 Nmap Scripting Engine (NSE) 📌

Actually, when you are requesting information about the host, this information is found using scripts. This is because nmap has a [library of scripts](https://nmap.org/book/nse-usage.html), that you can even use to exploit the target.

<div class="row row-cols-md-2"><div>

Scripts are stocked in categories such as

* `safe`: won't harm the target
* `intrusive`: will harm the target
* `vuln`: scan for vulnerabilities
* `exploit`: try to exploit a vulnerability
* `brute`: attempt brute force
* `discovery`: try to discover more about the network.

You can execute every script of a category

```bash
$ nmap scanme.nmap.org --script=vuln
$ nmap scanme.nmap.org --script vuln # same
```

> **Note**: I had to disable some functionalities of my antivirus, otherwise some/most NSE scripts would fail.

</div><div>

To find a script

* Use NSEDoc, for instance ["smb" NSE scripts](https://nmap.org/search/?q=smb)
* Or, use commands, `ls -l /usr/share/nmap/scripts/*smb*`
* Note that there are also CVEs!

You can run a specific script that you selected

```bash
$ nmap scanme.nmap.org --script=lua_script
# run two scripts, set argument "key" of "s1" to "value"
$ nmap scanme.nmap.org --script=s1,s2 --script-args s1.key=value
```

You can also use patterns to select scripts 👑

```bash
$ nmap scanme.nmap.org --script "ftp*"
```
</div></div>

<hr class="sep-both">

## 👑 Other notes 👑

<div class="row row-cols-md-2 mt-4"><div>

**IP Spoofing**

Change the IP making the request. Beware that it's useless if you can't grab the response, either because you have control over the machine, or something like that.

```bash
$ nmap -S SOME_OTHER_IP
```
<span></span>

️🧟️ **Zombies/Idle** 🧟 | `-sI`.

A host idle is a host that is not making any requests, such as a printer. We can use it to make requests instead of us. Every packet has an ID that is usually incrementing by one at every request. We will query the zombie once to know the starting number, spoof a request using the zombie IP, then be querying again the packet ID, we will know if the host replied, or not.

**MAC spoofing**

You can also use someone else MAC, but it's only useful if you are on the same network, I admit I don't know why.

```bash
$ nmap --spoof-mac SPOOFED_MAC
```

**Option `--reason`**

You can ask nmap to give the reason why a port is identified as "xxx". This will add a column "REASON" in the result, which is usually present by default (at least on Kali).

</div><div>

**Select a network interface**

```bash
$ nmap -e NETWORK_INTERFACE
```
<span></span>

**Decoys**

You can create decoys, i.e. make nmap create multiple packets with the same request but different IPs, with the hacker IP being one of them.

```bash
$ nmap -D A,B,YOUR_IP target
```
<span></span>

**Fragmentation**

You can fragment packets which may be used to bypass firewalls

```bash
$ nmap -f # create packets of 8 bytes or less
$ nmap -ff # create packets of 16 bytes or less
$ nmap --mtu xxx # maximum transfer unit (multiple of 8)
$ nmap --data-length length # split by length
```
<span></span>

**Traceroute**

You can ask nmap to do a traceroute, much like with `traceroute`.

```bash
$ nmap [...] --traceroute
```
</div></div>

<hr class="sep-both">

## 🥳 metasploit and nmap ⚡

[![metasploitexploitation](../../_badges/thmp/metasploitexploitation.svg)](https://tryhackme.com/room/metasploitexploitation)

[See metasploit framework - Database / Workspaces](/_cybersecurity/exploitation/general/metasploit/msfconsole.md#-the-metasploit-database-)

<div class="row row-cols-md-2"><div>

* First, start msf database
* Second, create a workspace (optional)
* Third, start your scan with `db_nmap`
* Four, work on it
</div><div>

The command `db_nmap` is the same as `nmap`.

```bash
msf6 > db_nmap -sV -p- IP
```
</div></div>