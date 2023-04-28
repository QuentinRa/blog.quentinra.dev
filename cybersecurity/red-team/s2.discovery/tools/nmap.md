# Nmap

[![nmap01](../../../_badges/thm/nmap01.svg)](https://tryhackme.com/room/nmap01)
[![nmap02](../../../_badges/thmp/nmap02.svg)](https://tryhackme.com/room/nmap02)
[![nmap03](../../../_badges/thmp/nmap03.svg)](https://tryhackme.com/room/nmap03)
[![nmap04](../../../_badges/thmp/nmap04.svg)](https://tryhackme.com/room/nmap04)
[![furthernmap](../../../_badges/thm/furthernmap.svg)](https://tryhackme.com/room/furthernmap)
[![vulnversity](../../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![blue](../../../_badges/thm-p/blue.svg)](https://tryhackme.com/room/blue)
[![ice](../../../_badges/thm-p/ice.svg)](https://tryhackme.com/room/ice)
[![blaster](../../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)
[![kenobi](../../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![rrootme](../../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![basicpentestingjt](../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![netsecchallenge](../../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)
[![startup](../../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![cowboyhacker](../../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)
[![steelmountain](../../../_badges/thmp-p/steelmountain.svg)](https://tryhackme.com/room/steelmountain)

<div class="row row-cols-md-2"><div>

nmap <small>([nmap book](https://nmap.org/book/), [GitHub](https://github.com/nmap/nmap) 7.7k ⭐)</small> is the most popular tool to scan hosts and map a network. This includes

* 🔎 Detecting open ports <small>(+may find the running protocol and version)</small>
* 📻 Guessing the host operating system
* 💥 Exploiting vulnerabilities in some protocols
* ...

➡️ There is a graphical version called [ZenMap](https://nmap.org/zenmap/).
</div><div>

According to nmap, a [port](/operating-systems/networking/knowledge/index.md#ports) can be 

* `open`: can be reached
* `filtered`: no response, usually meaning there is a firewall
* `unfiltered`: nmap can't determine if the port is open, or filtered
* `closed`: cannot be reached

Once you found a port, refer to the [protocols](/operating-systems/networking/knowledge/index.md#protocols) section to find more about each protocols and its vulnerabilities.
</div></div>

<hr class="sep-both">

## Basic usage 🚸

<div class="row row-cols-md-2"><div>

nmap is quite complex. First, provide some **hosts**. We can use `scanme.nmap.org` for testing purposes. 

```ps
$ nmap scanme.nmap.org
```

##### Scan type

nmap has many types of scans. Each type is a flag starting with `s` such as `-sT` or `-sS`.

```ps
$ nmap -sT [...] # no root required for sT
$ sudo nmap -sS [...] # root required for sS
```

##### Verbosity

As scans are usually slow, we usually increase the verbosity to know what's happening. You can use `-v`, `-vv`, `-d`, and `-dd`.

```ps
$ nmap -vv [...]
```

📌 You can press <kbd>Enter</kbd> during a scan in progress to prompt the progression of the scan.


##### Host probing

nmap will try to see if a host is up before scanning it. Many hosts, including Windows hosts, do not reply to ICMP requests, so the scan will fail. In such case, you should skip this check:

```ps
$ nmap -Pn [...]
```

➡️ An ARP request is used if the target in on the same network.
</div><div>

##### Store results

To avoid losing the result, especially as it takes time, and we may work a lot on it, you should **store** it.

```ps
$ nmap [...] > output_file_name # 🤔
$ nmap [...] -oA output_file_name # all formats
$ nmap [...] -oN output_file_name # .nmap
$ nmap [...] -oG output_file_name # grep-able
$ nmap [...] -oX output_file_name # xml
```

##### Port range

We often only limit the scan to some **ports**. By default, the top 1000 most common ports are randomly tested.

```ps
$ nmap [...] -F # Fast, only top 100
$ nmap [...] -p 22 # only port 22
$ nmap [...] -p 22,23 # both 22, and 23
$ nmap [...] -p 0-65535 # from x to y
$ nmap [...] -p- # same as 0-65535
$ nmap [...] -p22-25,80,443 # mix
$ nmap [...] -top-ports 20 # top 20
$ nmap [...] -p T:21 # TCP port 21
$ nmap [...] -p U:53 # UDP port 53
```

➡️ Use `-r` to sequentially test ports.
</div></div>

<hr class="sep-both">

## Scan types 🤯

<div class="row row-cols-md-2"><div>

There are many types of scans, and we will usually use the most appropriate given the target host network architecture <small>(firewall...)</small>, and what action we want to perform <small>(detect TCP ports...)</small>.

<br>

#### TCP scans

Used for ports using the [TCP](/operating-systems/networking/protocols/tcp.md) protocol.

* **TCP Scan** | `-sT`. Default scan if not root. Usually blocked by firewalls. Send an SYN packet, and receive RST <small>(closed)</small>, or SYN/ACK <small>(open)</small>. If the latter, answer back with ACK <small>(3-ways handshake)</small>.

* **TCP Syn (Half-open/Stealth) Scan** | `-sS` | `Need root privileges`. Default scan as root. Same as a TCP scan, but close the connection with 'RST,ACK'. Sightly faster than `-sT`.

<br>

#### TCP scans - firewall bypass

The 3 scans below are used to bypass (old/weak) firewalls. They check if a port is `closed`, so we don't know if the port is `open`. Most modern or Windows OS are answering `closed` to any malformed packet.

* **TCP NULL scans** | `-sN` | `Need root privileges`. Send a malformed packet with no flags. If the port is closed, an RST packet is received.

* **TCP FIN scans** | `-sF` | `Need root privileges`. Send a malformed packet with an invalid flag (FIN). If the port is closed, an RST packet is received.

* **TCP Xmas scans** | `-sX` | `Need root privileges`. Send an unexpected packet with FIN+PSH+URG flags.  If the port is closed, an RST packet is received.

* **Maimon scan** | `-sM` | `Need root privileges`. Send an unexpected packet with FIN+ACK flags. If the port is closed, an RST packet is received. It's not quite used because it's often blocked.
</div><div>

#### UDP Scans

Used for ports using the [UDP](/operating-systems/networking/protocols/udp.md) protocol.

* **UDP Scan** | `-sU` | `Need root privileges`. The scan is slow as UDP ports may only respond if they are closed <small>(with a PING/ICMP)</small>. We don't know if the port is actually open or filtered.

<br>

#### ICMP Scans

* **Ping Scan** | `-sn`. Do not scan ports. Check if a host is up and replying to pings. Uses ARP if run as root, and the target is on the same network.

<br>

#### Firewall Detection Scans

We may want to find if a port is protected by a firewall, by checking who answered. Note that it doesn't mean that the port is open.

* **ACK scan** | `-sA`. Send a packet with ACK, any port will reply with RST. The response is analyzed to find who answered.

* **Window scan** | `-sW`. Same as ACK, but analyze the window field to identify who answered. On some systems, it may even help in determining if the port is open, or not.

<br>

#### Custom Scan

You can create custom scans with `--scanflags`

```ps
# RST SYN FIN enabled
$ sudo nmap [...] --scanflags RSTSYNFIN
```
</div></div>

<hr class="sep-both">

## Host specification 🎯

<div class="row row-cols-md-2 mt-4"><div>

Nmap can scan one or more hosts

```ps
$ nmap 192.168.0.0
$ nmap 192.168.0.* # from 0 to 254
$ nmap 192.168.0.0-254 # same
$ nmap 192.168.0.0/24 # same
$ nmap scanme.nmap.org # a domain name
$ nmap -iL hosts.txt # file
$ nmap xxx yyy zzz # list
```

You can exclude a machine from a scan

```ps
$ nmap [...] --exclude x.x.x.x
```
</div><div>

If you don't want `nmap` to fetch DNS records, use `-n`. You can use `-R` to force `nmap` to query DNS servers.

```ps
$ nmap -n x.x.x.x [...]
# won't look for the domain associated with this IP
```

You can use `-sL` to list every host that will be scanned.

```ps
$ nmap -sL -n 192.168.0/29 [...]
# Nmap scan report for 192.168.0.0
# [...]
# Nmap scan report for 192.168.0.7
# Nmap done: 8 IP addresses (0 hosts up)
```

👉 This may be useful to know how many hosts will be scanned.
</div></div>

<hr class="sep-both">

## Target host information 🎣

<div class="row row-cols-md-2"><div>

nmap can try to guess the [protocols](/operating-systems/networking/knowledge/index.md#protocols) and service running on a port, along with its version. If a service has been secured, then it may not leak much information <small>(i.g. the version may be hidden...)</small>.

* **Service and versions**: guess the service and version used by an open port <small>(ex: 80 $\to$ Apache x.xx.xx)</small>. May expose the OS too.

```ps
$ nmap -sV [...]
```

➡️ You may set the intensity with `--version-intensity level` <small>(from 0 to 9)</small>. There are shortcuts `--version-light` (2), and `--version-all` (9).
</div><div>

* **Operating system**: try to guess the OS. Sometimes `-sV` or others may be more reliable.

```ps
$ nmap -O [...]
```

* **Default scripts**: run default scripts to find vulnerabilities, find the hostname/computer name and other information...

```ps
$ nmap -sC [...]
```

* **All**: operating system, script, services, and traceroute

```ps
$ nmap -A [...]
```
</div></div>

<hr class="sep-both">

## Stealth 🐈

<div class="row row-cols-md-2"><div>

nmap can send more or less stealthy by adding a timing between requests. It ranges from 0 to 5, while 0 means one request per 5 minutes <small>(paranoid (0), sneaky (1), polite (2), normal (3), aggressive (4), and insane (5))</small>. `3` is the default, `0`/`1` are usually used for stealth, `4` is used in CTFs, and `5` can be inaccurate as many packets may be lost.

```ps
$ nmap [...] -T4
```

➡️ See also `--min-rate`/`--mix-parallelism` (resp. max).

<br>

##### IP spoofing

Spoof the requester IP. It's useless if you can't get the response.

```ps
$ nmap [...] -S SOME_OTHER_IP
```
</div><div>

##### MAC spoofing

Spoof the requester MAC. It's useless if you can't get the response. Also, it may be useless if you don't use a MAC address that is on the same network that the target.

```ps
$ nmap [...] --spoof-mac SPOOFED_MAC
```

##### Decoys

Simulate that multiple IP are making the request, to hide yours in the list of provided IPs.

```ps
$ nmap [...] -D XXX,YYY,YOUR_IP
```

##### ️🧟️ Zombies/Idle host `-sI` 🧟 

An idle host is not making any requests, such as a printer. We can use it to make requests instead of us. Every packet has an ID that is usually incrementing by one at every request. We will query the zombie once to know the starting number, spoof a request using the zombie IP, then query again the packet ID, and we will know if the target replied to them, or not.
</div></div>

<hr class="sep-both">

## Other options 🥾

<div class="row row-cols-md-2"><div>

##### Select a network interface

```ps
$ nmap [...] -e NETWORK_INTERFACE
```

<br>

##### Ask for the reason

You can ask nmap to give the reason why a port is identified as "xxx". This will add a column "REASON" in the result, which is usually present by default <small>(at least on Kali)</small>.

```ps
$ nmap [...] --reason
```
</div><div>

##### Traceroute

You can ask nmap to do a traceroute, much like with `traceroute`.

```ps
$ nmap [...] --traceroute
```

##### Fragmentation

You can fragment packets which may be used to bypass firewalls

```ps
$ nmap -f # create packets of 8 bytes or less
$ nmap -ff # create packets of 16 bytes or less
$ nmap --mtu xxx # maximum transfer unit (multiple of 8)
$ nmap --data-length length # split by length
```
</div></div>

<hr class="sep-both">

## Nmap Scripting Engine (NSE) 📌

<div class="row row-cols-md-2"><div>

When using flags such as `-sV` or `-sC`, you are actually using [nmap scripts](https://nmap.org/book/nse-usage.html). They are categorized in 6 categories as follows:

* `safe`: won't harm the target
* `intrusive`: will harm the target
* `vuln`: scan for vulnerabilities
* `exploit`: try to exploit a vulnerability
* `brute`: attempt to brute force
* `discovery`: try to discover more about the network.

You can execute every script of a category

```ps
$ nmap [...] --script=vuln
$ nmap [...] --script vuln # same
```

🔥 I had to disable some functionalities of my antivirus, otherwise some/most NSE scripts would fail.

</div><div>

To find a script

* Use NSEDoc, for instance ["smb" NSE scripts](https://nmap.org/search/?q=smb)
* Or, use commands, `ls -l /usr/share/nmap/scripts/*smb*`
* Note that there are also CVEs!

You can run a specific script that you selected

```ps
$ nmap [...] --script=lua_script
# run two scripts, set argument "key" of "s1" to "value"
$ nmap [...] --script=s1,s2 --script-args s1.key=value
```

You can also use patterns to select scripts, but you may inadvertently use scripts that you were not supposed to.

```ps
$ nmap [...] --script "ftp*"
```
</div></div>

<hr class="sep-both">

## Common scripts

<div class="row row-cols-md-2"><div>

#### Brute force scripts

Refer to [nmap list of brute force scripts](https://nmap.org/nsedoc/categories/brute.html). nmap will do the cartesian product of the list of usernames by the list of passwords.

```shell!
$ nmap IP -p 22 --script ssh-brute --script-args userdb=users.lst,passdb=pass.lst
```

```shell!
$ nmap IP --script "*brute*" --script-args userdb=users.lst,passdb=pass.lst
```
</div><div>

...
</div></div>

<hr class="sep-both">

## Uncommon usages

<div class="row row-cols-md-2"><div>

#### Banner grabbing

```ps
$ nmap --script=http-server-header.nse IP -p80,443
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `nmap --log-errors `
* `nmap --badsum`: if answer, should be from a firewall/IDS
* `--script-trace`
* `mysql-enum`
</div><div>

Host probing

* `-PE`: ICMP echo requests (default if root)
* `-PP`: ICMP timestamp requests
* `-PM`: ICMP type 17/18 packets
* `-PS`: TCP SYN packet to port 80
* `-PA`: TCP ACK packet to port 80
* `-PU`: UDP packet to a random port
</div></div>