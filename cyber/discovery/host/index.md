# Host discovery

[![activerecon](../../_badges/activerecon.svg)](https://tryhackme.com/room/activerecon)

Host discovery is the core of the active reconnaissance (recon) activities. A hacker could other things such as getting in touch with employees, and trying to use social engineering to learn more about their company.

<div class="row row-cols-md-2"><div>

**Nmap**

Use **nmap** to find open ports, their services+version with `-sV`, the os with `-O` <small>(`-sV` too, if a service is talkative)</small>, the hostname / computer name, or some info that may be relevant with `-sC`.

You should also save the scans: it may take a long time, so you want to do it only once, and they can be imported in other tools too 🚀!

You can use it to find, and exploit vulnerabilities, or to bruteforce services such as SSH (see [bruteforce services](../../random/crack_password/services.md#nmap)).

> CTF: Lunch at least a scan on all ports in the background while exploring the first interesting ports.
</div><div>

**Nessus**

Nessus is much like nmap, while providing a web interface, but a few differences are that you got way more information about the vulnerabilities, and how you can exploit them <small>(list of tools)</small>. On top of that, if you got credentials, you can also easily login, and scan the system from the inside.

Scans may be exported too, and imported in others tools, such as in `metasploit`.
</div></div>

> You may also use commands such as `ping` <small>(test if the host is up, and accepting ICMP packets)</small>, `traceroute/tracepath` which are using the TTL to know how much steps/hops it took for a packet to reach the target <small>(they increase the TTL by one, and try to get the intermediaries IPs as they respond that the packet was destroyed, but most aren't responding, so we got no information. Also, the route may change, as routers are always calculating the most optimal route)</small>.

<hr class="sl">

## nmap port scanner

[![nmap01](../../_badges/nmap01.svg)](https://tryhackme.com/room/nmap01)
[![furthernmap](../../_badges/furthernmap.svg)](https://tryhackme.com/room/furthernmap)

<div class="row row-cols-md-2"><div>

**nmap** ([nmap book](https://nmap.org/book/)) is a tool to detect hosts, their open ports, and eventually run script trying to go more information, or even exploiting a vulnerability to gain access.

> There is an interface to `nmap` called [ZenMap](https://nmap.org/zenmap/).
</div><div>

A port is used by a protocol such as FTP (File Transfer Protocol) to transfer data. There are $2^{16}$ ports, while the first 1024 are restricted, and can only be used by standard protocols. A port can be changed. Look for **vulnerable ports** on Google. A port can be

* `open`: can be reached
* `filtered`: no response, usually meaning that it's filtered by a firewall
* `closed`: cannot be reached
</div></div><br>

🤯 **Kinds of scans** 🤯

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

> **ICMP Requests** ⚠️: By default, nmap will send a query checking if a host is up. This query is a ICMP request, but they are **blocked on Windows** <small>(Windows replies closed to every ICMP request by default)</small>. To scan Windows hosts, use the option `-Pn`. The problem with that, is that if the host is actually not running Windows, but down, then you will wait a lot, so only use that if you are sure that the host is up.

```bash
$ nmap 55.55.55.55 # not working if it's a Windows host
$ nmap 55.55.55.55 -Pn # fixed 😎
```

> **ICMP Scans**: are used to check if a host is up or not.

* **Ping Scan** | `-sn`. Do not scan ports. If root, and targeting a host on the same network, then use ARP.

</div></div><br><br>

🗺️ **Examples of scans** 🗺️

<div class="row row-cols-md-2"><div>

To scan a host <small>(TCP SCAN, as it's the default as non-root)</small>

```bash
$ nmap 127.0.0.1
$ nmap 192.168.0.1-254 # from 1 to 254
$ nmap 192.168.0.0/24 # same
$ nmap scanme.nmap.org
```

Usually, as scans take a lot of time, we are adding `-v` to increase the verbose. The more you add, the more verbose nmap is.

```bash
$ nmap -sT -vv scanme.nmap.org # level 2 verbose
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

📌 **Nmap Scripting Engine (NSE)** 📌

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

<hr class="sr">

## Nessus vulnerability scanner

[![rpnessusredux](../../_badges/rpnessusredux.svg)](https://tryhackme.com/room/rpnessusredux)

<div class="row row-cols-md-2"><div>

**Nessus vulnerability scanner** is a tool to find, and report vulnerabilities.

* [Download Nessus](https://www.tenable.com/downloads/nessus)

```bash
$ sudo dpkg -i  Nessus-10.3.0-ubuntu1404_amd64.deb
$ sudo systemctl start nessusd.service
```

* Open `https://localhost:8834/`
* [You will need an activation code](https://www.tenable.com/products/nessus/nessus-essentials)
</div><div>

Once you are logged on the website, you can create new scans.

* **Host Discovery**: find alive hosts
* **Basic network scan**: sort of nmap
  * Set a target
  * In Discovery, you can select a range of ports
  * In Assessment, you can select the kind of scan
  * In Advanced, you may go for a "low bandwidth scan"
  * **Launch**: explore vulnerabilities to see results
* **Web application test**: see vulnerabilities in your web app
</div></div>

<hr class="sl">

## Manual mapping using commands

<div class="row row-cols-md-2"><div>

`nmap` bellow is doing a lot of stuff for us, but it may be worthwhile to know a bit more about how you could fetch such information manually.

**telnet** (TCP): telnet can be used to send cleartext to an HOST. You will have to "talk" in the protocol running on this port language defined in the RFC through, but when you manage too, you may find some stuff like the OS/the service running.

```bash
$ telnet ip port
# Example in HTTP
GET / HTTP/1.1
HOST: random_value

# after two <CR>, you will receive a response (hopefully)
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
# ...
```

Of course, in such case as it's HTTP, you can use `curl`!

```bash
$ curl -I ip:port
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
# ...
```
</div><div>

You can also do the same with **netcat**, the difference with telnet being that you can connect to TCP, and UDP ports, and `ncat` support encryption (SSL).

```bash
$ nc ip 21
[...] FTP server (Version 6.4/OpenBSD/Linux-ftpd-0.17) ready.
```

</div></div>

<hr class="sr">

## MASSCAN: Mass IP port scanner

[![nmap01](../../_badges/nmap01.svg)](https://tryhackme.com/room/nmap01)

<div class="row row-cols-md-2"><div class="align-self-center">

* `masscan` is a fast, quite aggressive, port scanner.
* [Masscan GitHub](https://github.com/robertdavidgraham/masscan)
* Most options are the same as in nmap (`masscan --nmap`)
* It uses a TCP SYN Scan.
</div><div>

```bash
$ masscan scanme.nmap.org -p21
$ masscan scanme.nmap.org -p21,22
$ masscan scanme.nmap.org -p21-25
$ masscan scanme.nmap.org ‐‐top-ports 100
$ masscan scanme.nmap.org ‐‐top-ports 100 --rate 1000
```
</div></div>