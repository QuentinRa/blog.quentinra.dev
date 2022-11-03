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

> As you reminder, you can check [Networking/Ports](/info/networking/index.md#ports) to learn more about ports, you can check [Networking/Services](/info/networking/protocols/index.md) to learn more about the services using these ports, you can use [Cyber/Services](/cyber/server/services.md) to learn more about how you can exploit services, and you may also check [Cyber/Bruteforce services](/cyber/random/crack_password/services.md) to try to bruteforce a service credentials.

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

## 🗺️ Examples of scans 🗺️

<div class="row row-cols-md-2"><div>

To scan a host <small>(it's a TCP SCAN, as it's the default as non-root)</small>

```bash
$ nmap 127.0.0.1
$ nmap 192.168.0.1-254 # from 1 to 254
$ nmap 192.168.0.0/24 # same
$ nmap scanme.nmap.org
```

Usually, as scans take a lot of time, we are adding `-v` to increase the verbose. The more you add, the more verbose nmap is.

```bash
$ nmap -vv scanme.nmap.org # level 2 verbose
```

You can use flags to fetch information about your targets

* `-sV`: what are the services used by the open ports? What's their versions? <small>(ex: 80 is using Apache x.xx.xx)</small>
* `-sC`: find hostname, maybe the OS too, the computer name
* `-O`: what's the operating system of the host?
* `-A`: look for every kind of information

```bash
$ nmap -sV scanme.nmap.org -vv
```

Run a fast scan

```bash
$ nmap -F scanme.nmap.org -vv
```

</div><div>

You can select a range of ports to scan, or only scan the "top ports". By default, nmap scan the top 1000 ports.

```bash
$ nmap -vv scanme.nmap.org -p 22
$ nmap -vv scanme.nmap.org -p 22,23 # both 22, and 23
$ nmap -vv scanme.nmap.org -p 0-65535 # from 0 to ...
$ nmap -vv scanme.nmap.org -p- # same :)
$ nmap -vv scanme.nmap.org -p22-25,80,443 # mix
$ nmap -vv scanme.nmap.org -top-ports 20
```

To set the intensity of the scan, reducing the risks of between detected, you can set a timing between requests from 0=passive=very slow, and up to 5=aggressive=faster.

```bash
$ nmap -vv scanme.nmap.org -T5 -p22
```

Store results

```bash
$ nmap scanme.nmap.org > output_localhost
# generate .nmap=-oN, .gnmap=-oG, and .xml=oX 
$ nmap -vv scanme.nmap.org -oA output_localhost
```
</div></div><br><br>

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