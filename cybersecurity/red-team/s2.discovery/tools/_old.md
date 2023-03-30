# **ICMP Requests** ⚠

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

## 🔎 Nmap in practice 🔎

<div class="row row-cols-md-2"><div>

<p class="mt-3"><b>Stealth level</b></p>

You can set the intensity of the scan to decrease the risks of between detected by adding timing between requests from 0 to 5, while 0 means one request per 5 minutes <small>(paranoid (0), sneaky (1), polite (2), normal (3), aggressive (4), and insane (5))</small>. Note that T3 is the default, T0/T1 are usually used for stealth, T4 is the most used in CTFs, and T5 can be inaccurate as many packets may be lost.

```bash
$ nmap -vv scanme.nmap.org -T5 -p22
```

Other alternatives are `--min-rate/--max-rate` to set the rate per second, or `--min-parallelism/--max-parallelism` for the number of probes made in parallel.
</div><div>

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

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `nmap -sA x.x.x.x` (filtered/unfiltered)
* `nmap --log-errors`
</div><div>

</div></div>