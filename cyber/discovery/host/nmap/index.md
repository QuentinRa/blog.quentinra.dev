# nmap port scanner

[![nmap01](../../../_badges/thm/nmap01.svg)](https://tryhackme.com/room/nmap01)
[![nmap02](../../../_badges/thmp/nmap02.svg)](https://tryhackme.com/room/nmap02)
[![nmap03](../../../_badges/thmp/nmap03.svg)](https://tryhackme.com/room/nmap03)
[![nmap04](../../../_badges/thmp/nmap04.svg)](https://tryhackme.com/room/nmap04)
[![furthernmap](../../../_badges/thm/furthernmap.svg)](https://tryhackme.com/room/furthernmap)

<div class="row row-cols-md-2"><div>

**nmap** ([nmap book](https://nmap.org/book/)) is a tool to detect hosts, their open ports, and eventually run script trying to go more information, or even exploiting a vulnerability to gain access.

> There is an interface to `nmap` called [ZenMap](https://nmap.org/zenmap/).
</div><div>

A port is used by a protocol such as FTP (File Transfer Protocol) to transfer data. There are $2^{16}$ ports, while the first 1024 are restricted, and can only be used by standard protocols. A port can be changed. Look for **vulnerable ports** on Google. A port can be

* `open`: can be reached
* `filtered`: no response, usually meaning that it's filtered by a firewall
* `closed`: cannot be reached
</div></div><br>

> * [Networking/Ports](/info/networking/index.md#ports) to learn more about ports
> * [Networking/Services](/info/networking/protocols/index.md) to learn more about the services using these ports
> *  [Cyber/Services](/cyber/server/services.md) to learn more about how you can exploit services
> * [Cyber/Bruteforce services](/cyber/random/crack_password/services.md) to try to bruteforce a service credentials.

<hr class="sep-both">

## **ICMP Requests** ⚠

<div class="row row-cols-md-2"><div>

By default, nmap will send a query checking if a host is up. This query is a ICMP request, but they are **blocked on Windows** <small>(Windows replies closed to every ICMP request by default)</small>.

To scan Windows hosts, use the option `-Pn`. The problem with that, is that if the host is actually not running Windows, but down, then you will wait a lot, so only use that if you are sure that the host is up, or you were informed that the host do not accept ICMP requests.
</div><div>

If you receive a response using ping, everything is good. If you don't, then either the host is up, and blocking ICMP requests, or it's down.

```bash
$ ping -c 10 ip
```

Example of using `-Pn`

```bash
$ nmap ip # not working if it's a Windows host
$ nmap ip -Pn # fixed 😎
```
</div></div>

> **Random note**: if you try to use nmap on a host living in the same network, then, if the scan is run with elevated privileges, an ARP scan will be used instead. You can explicitly request an ARP scan with `-PR`. Another way of doing an ARP scan is using `sudo arp-scan -l -I eth0`.<br><br>
> **Random note**: ICMP echo requests `-PE`. ICMP timestamp requests `-PP`. ICMP 17/18 `-PM`. TCP 3-way handshake `-PS`. TCP ACK `-PA`. UDP `-PU`.

<hr class="sep-both">

##  🎯 Define the target(s) 🎯

<div class="row row-cols-md-2 mt-4"><div>

Nmap can scan a one, or more hosts to scan

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

> **TCP scans** are scans used to **detect TCP ports**, meaning port used by a protocol using the connection-based protocol TCP. TCP is a protocol in which every message send, is followed by a reply, and an acknowledgement of receiving the reply. This is slower than UDP, but, it allows us to ensure that a message is received.

*  **TCP Scan** | `-sT`. Default scan if not root. Usually blocked by firewalls. Send a SYN packet, receive RST (closed), or SYN/ACK (open). If the later, answer back with ACK (3-ways handshake).

* **TCP Syn (Half-open/Stealth) Scan** | `-sS` | `Need root privileges`. Default scan in root. Same as TCP scan, but don't answer "ACK", but "RST" instead. Sightly faster than `-sT`.

The 3 scans below can be used to try to bypass weak firewalls that have only rules for the two previous well-known scans. As they are only checking if a port is closed, every port is marked `open|filtered`. Note that some OS such as Windows, are responding `closed` to any malformed packet.

* **TCP NULL scans** | `-sN` | `Need root privileges`. Send a malformed packet with no flags. If the port is closed, a RST packet is received.

* **TCP FIN scans** | `-sF` | `Need root privileges`. Send a malformed packet with an invalid flag (FIN). If the port is closed, an RST packet is received.

* **TCP Xmas scans** | `-sX` | `Need root privileges`. Send a malformed packet.  If the port is closed, an RST packet is received.

</div><div>

> **UDP Scans** are scans used to **detect UDP ports**, meaning ports using the UDP connection-less protocol, in which a message is sent, with no reply, and without care if the message was received or not, corrupted or not.... This is quite faster than TCP.

* **UDP Scan** | `-sU` | `Need root privileges`. The scan is slow as UDP ports may only respond if they are closed (with a PING/ICMP), so the scan must send multiple requests, to ensure that the port isn't closed, as there is no way to ensure that the port is open, so they are usually marked as `open|filtered`.

> **ICMP Scans**: are used to check if a host is up or not.

* **Ping Scan** | `-sn`. Do not scan ports. If root, and targeting a host on the same network, then use ARP.

</div></div>

<hr class="sep-both">

## 🔎 Nmap in practice 🔎

<div class="row row-cols-md-2"><div>

<p class="mt-3"><b>1. Required parameters</b></p>

As mentioned before, we need a host (or multiple hosts)

```bash
$ nmap scanme.nmap.org
```

Then, we will try different kind of scans until one works out.

```bash
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

By default, `nmap` will scan the top 1000 of ports that should be checked.

```bash
$ nmap -vv scanme.nmap.org -F # Fast, only top 100
$ nmap -vv scanme.nmap.org -p 22 # only port 22
$ nmap -vv scanme.nmap.org -p 22,23 # both 22, and 23
$ nmap -vv scanme.nmap.org -p 0-65535 # from 0 to ...
$ nmap -vv scanme.nmap.org -p- # same !!!
$ nmap -vv scanme.nmap.org -p22-25,80,443 # mix
$ nmap -vv scanme.nmap.org -top-ports 20 # top 20
```

<p class="mt-3"><b>Stealth level</b></p>

You can set the intensity of the scan to decrease risks of between detected by adding timing between requests from 0=passive=very slow=one request per 5 minutes, and up to 5=aggressive=loud.

```bash
$ nmap -vv scanme.nmap.org -T5 -p22
```

<p class="mt-3"><b>Dig information</b></p>

* `-sV`: what are the services used by the open ports? What's their versions? <small>(ex: 80 is using Apache x.xx.xx)</small>. May also guess the OS.
* `-sC`: find hostname, maybe the OS too, the computer name
* `-O`: what's the operating system of the host, a bit unreliable
* `-A`: all the above, and some more
* Nmap by default may return `Service Info: Host: Os:` with some information.

```bash
$ nmap -sV scanme.nmap.org -vv
```
</div></div>

<hr class="sep-both">

## 📌 Nmap Scripting Engine (NSE) 📌

Actually, when you are requesting information about the host, this information is found using scripts. This is because nmap has a [library of scripts](https://nmap.org/book/nse-usage.html), that you can even use to exploit the target.

<div class="row row-cols-md-2"><div>

Scripts are stocked in categories such as

* `safe`: won't harm the target
* `intrusive`: will harm the target
* `vuln`: scan for vulnerabilities
* `exploit`: try to exploit a vulnerability
* `brute`: attempt bruteforce
* `discovery`: try to discover more about the network.

You can execute every script of a category

```bash
$ nmap scanme.nmap.org --script=vuln
$ nmap scanme.nmap.org --script vuln # same
```

> **Note**: I had to disable some functionalities of my antivirus, otherwise some NSE scripts would fail.

</div><div>

To find a script

* Use NSEDoc, for instance ["smb" NSE scripts](https://nmap.org/search/?q=smb)
* Or, use commands, `ls -l /usr/share/nmap/scripts/*smb*`

You can run a specific script that you selected

```bash
$ nmap scanme.nmap.org --script=lua_script
# run two scripts, set argument "key" of "s1" to "value"
$ nmap scanme.nmap.org --script=s1,s2 --script-args s1.key=value
```
</div></div>