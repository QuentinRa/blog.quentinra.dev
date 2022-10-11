# Linux networking commands

A lot of commands that can be used on Linux-based distributions, along with their most useful options, and some tips about their usage. This includes commands such as `hostname`, `ip`, `ifconfig`, `ss`, `ping`, `ncat/nc/netcat`, `whois`, `dig`, `wireshark`, `tcpdump`, `tshark`, `arp`, `route`, `iptables` and many more.

<hr class="sl">

## Explore

<details class="details-e mt-4">
<summary><code>ip</code>: the all-in-one networking command</summary>
<div class="row row-cols-md-2"><div>

Show all interfaces <small>(a=addr=address, l=link)</small>

```bash
$ ip a
$ ip l
```

Show one interface "eth0" addresses/links

```bash
$ ip addr show dev0
$ ip link show dev0
```
<br>

Useful option: `-r` to show names instead of IPs.
</div><div>

Show routing table <small>(r=route)</small>

```bash
$ ip r
```

To add a route, you need "_dest", "_gateway", and "_interface"

```bash
$ ip r add _dest via _gateway dev _interface
```

Show ARP cache <small>(n=neigh=neighbor)</small>

```bash
$ ip n
```
</div></div>
</details>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>hostname</code>: show hostname</summary>

```bash
$ hostname
```

Show host domain

```bash
$ hostname -d
```

</details>
</div><div>
<details class="details-e">
<summary><code>ifconfig</code>: DEPRECATED version of <code>ip a</code></summary>

Show information about the network. Note that RT = received, TX = emitted. Print info about all interfaces:

```bash
$ ifconfig -a
```

Only one interface "eth0"

```bash
$ ifconfig eth0
```

</details>
</div><div>
<details class="details-e">
<summary><code>ss</code>: show open ports</summary>

The command can be filtered (`-a`=all, `-4`=IPV4, `-u`=udp...)

```bash
$ ss
$ ss -a
$ ss -4
$ ss -u
```
</details>
</div></div>

<hr class="sr">

## Interact with the outside

<div class="row row-cols-md-2 mt-4"><div>
<details class="details-e">
<summary><code>ping</code>: send a signal</summary>

```bash
$ ping google.fr
$ ping 8.8.8.8
```

Do "x" pings

```bash
$ ping -c x google.fr
```

Other options

* `-b ip`: ping all addresses in the IP range
* `-t ttl`: set the time to live of the ping
* `-s size`: the size of the "ping"
</details>
</div><div>
<details class="details-e">
<summary><code>dig</code>: IP to name, name to IP</summary>

```bash
$ dig google.fr
$ dig -x 8.8.8.8
```

We can explicitly ask for some data by using the option `-t` with one of the following

* `NS`: nameserver
* `A`: IPV4
* `AAAA`: IPV6
* `MS`: mail server
</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>whois</code>: show data about IP</summary>

```bash
$ whois google.fr
$ whois 8.8.8.8
```
</details>
</div><div>
<details class="details-e">
<summary><code>nc/ncat/netcat</code>: utility to open connections</summary>

If you want to be a server, you can pick a port, and listen to find

```bash
$ netcat localhost 33666 -l
```

If you are a client, you can connect to a server, and send messages. The server will see them, along with any other client.

```bash
$ netcat localhost 33666
```
</details>
</div></div>

<hr class="sl">

## Monitoring

<details class="details-e mt-4">
<summary><code>tcpdump</code>: monitor network (root required)</summary>
<div class="row row-cols-md-2"><div>

* `-i interface` : listen to this interface
* `-e`: show the header of the request
* `-n`: show names instead of addresses
* `-l`: copy results in a buffer (`tcpdump -l | tee file`)
* `-o`: no optimizations (listen take a lot of resources)
* `-F`: read from a file
* `-v`, and `-vv`: show more, or even more verbosity
* `-t`: do not show time
* `host name_or_address`: listen to only one host, you can add other hots with `AND host ...`

</div><div>

No examples yet.
</div></div>
</details>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>tshark</code>: similar to tcpdump</summary>

* `-f "filter"`: see [wireshark capture filters](https://gitlab.com/wireshark/wireshark/-/wikis/CaptureFilters)
* `-F file`: read from a file

```bash
$ tshark -i eth0 -f "host some_ip"
```

</details>
</div><div>
<details class="details-e">
<summary><code>wireshark</code>: same as tcpdump, but with GUI</summary>

See [wireshark](https://www.wireshark.org/download.html).

You can enter these in the main bar to filter entries

* `ip.src == some_ip`, or `ip.dest == some_ip`
* `tcp.port == some_port`, or `udp.port == some_port`
* `http.request.method == GET`, or `http.request.method == POST`...
* You can use `&&` (logical AND), `||` (logical OR), `!=` (different)

Once you find something interesting, right-click on it > Follow > Flux, and pick a protocol.

Use File > Export > HTTP to GET download files.
</details>
</div></div>

<hr class="sr">

## ARP, and network filters

<details class="details-e mt-4">
<summary><code>iptables</code>: network filters (root required)</summary>
<div class="row row-cols-md-2"><div>

* `-t table`: FILTER by default
* `-A chain`: add a rule at the end of the chain
* `-I chain`: add a rule at the start of the chain
* `-D chain`: delete a rule
* `-o interface`: exit via "interface"
* `-i interface`: enter using "interface"
* `-j action`: a chain or:
  * `SNAT/DNAT`: translation source/destination
  * `ACCEPT`: allow
  * `DENY/DROP`: deny without notifying the sender
  * `REJECT`: deny, but notify the sender
* `-s ip`: source <small>(separated by colons)</small>
* `-d ip`: destination (s<small>(separated by colons)</small>
* `--sport port`: source port
* `--dport port`: destination port
* `--to ip`: if SNAT/DNAT, the new source/destination
* `-p protocol`: which protocol

**Note**: you can use `!` (NOT), such as `-s !127.0.0.1` meaning every packet not having "127.0.0.1" as `source` will be filtered.
</div><div>

No examples yet.
</div></div>
</details>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>arp</code>: show ARP cache</summary>

Obsolete. See `ip n`.
</details>
</div><div>
<details class="details-e">
<summary><code>route</code>: show routing table</summary>

Obsolete. See `ip r`.
</details>
</div></div>

<hr class="sl">

## Nmap

**nmap** ([nmap book](https://nmap.org/book/)) is used to detect services used by a server, such as SSH, FTP, HTTP/HTTPS... Each service is associated with a port, such as `21` for FTP, but they may be changed. A port may be filtered, meaning that a firewall is preventing you to find if a port is open, or closed.

<details class="details-e">
<summary>There are 6 kind of scans, called switches <code>-s</code></summary>
<div class="row row-cols-md-2"><div>

* **TCP scan** (3-ways handshake)

Default scan. Request a port with SYN. Receive RST if closed. Receive SYN/ACK if closed. Answer back ACK if open. Usually blocked by firewalls. 

```bash
$ nmap localhost
$ nmap localhost -sT
```

* **Syn "Half-open"/"Stealth" Scan**

Default scan if root. Need sudo/root. Same as TCP, but don't answer back ACK, meaning that the server will believe that your port was closed. Slightly faster than TCP. 

```bash
$ sudo nmap localhost
$ sudo nmap localhost -sS
```

* **UDP Scan**

Send a message asking if a port is open. If there is no response, then the port is assumed to be "open|filtered", otherwise, the target may send a packet (ping/ICMP) with a message that the port is closed. Because there are multiple tries, it's quite slower than TCP.

```bash
$ sudo nmap localhost -sU
# to avoid checking many ports
$ sudo nmap localhost -sU -top-ports 20
```
</div><div>

The 3 scans below are less used, so less likely to be detected, and blocked. They are even stealthier than SYN. The problem is that Windows <small>(and some others)</small>, are responding RST (closed) to such switches, because they are sending malformed packet.

* **TCP NULL scans**

```bash
$ sudo nmap localhost -sN
```

* **TCP FIN scans**

```bash
$ sudo nmap localhost -sF
```

* **TCP Xmas scans**

```bash
$ sudo nmap localhost -sX
```
</div></div>
</details>

<details class="details-e">
<summary>Other arguments</summary>

<div class="row row-cols-md-2"><div>

You can give an IP, a name, and even a range of IPs to nmap.

```bash
$ nmap 127.0.0.1
$ nmap 192.168.0.1-254 # from 1 to 254
$ nmap 192.168.0.0/24 # same
$ nmap google.fr
```

**TIP**: use at least `-vv` to add a level-2 verbosity.

```bash
$ nmap localhost -vv
```

Check if a host is up. Note that **Windows with its default firewall is blocking every ICMP request**, so ping is useless. If you are against such a host, use `-Pn` in every request.

```bash
$ nmap localhost -sn
```

Find...

```bash
$ nmap localhost -sL # hosts to scan
$ nmap localhost -sV # services, version
$ nmap localhost -O # OS
$ nmap localhost -A # -O, -sV, script scanning, and traceroute
```
</div><div>

Select which ports to scan

```bash
$ nmap localhost -p 22
$ nmap localhost -p 22,23
$ nmap localhost -p 0-65535
$ nmap localhost -p- # same :)
```

To reduce the risk of being detected, you can set some timing starting with 0=passive=slow, and up to 5=aggressive=fast.

```bash
$ nmap localhost -T0
```

Store results

```bash
$ nmap localhost > output_localhost
# generate .nmap=-oN, .gnmap=-oG, and .xml=oX 
$ nmap localhost -oA output_localhost
```
</div></div>
</details>

<details class="details-e">
<summary>Nmap Scripting Engine (NSE)</summary>

<div class="row row-cols-md-2"><div>

[NSE](https://nmap.org/book/nse-usage.html) is a library of scripts that can be used to scan vulnerabilities, and automatically exploit them. Scripts are stocked in categories

* `safe`: won't harm the target
* `intrusive`: will harm the target
* `vuln`: scan for vulnerabilities
* `exploit`: try to exploit a vulnerability
* `auth`
* `brute`: attempt bruteforce
* `discovery`: try to discover more about the network.

You can use a whole category of scripts, or a path to a script, or the name of a script (see [nsedoc scripts](https://nmap.org/nsedoc/scripts/)).

```bash
$ nmap localhost --script=vuln
$ nmap localhost --script=lua_script
$ nmap localhost --script vuln # same
```

You may have to pass arguments to a script.

```bash
$ nmap localhost --script=a,b --script-args a.key=value,...
```

</div><div>

Scripts are stored in `/usr/share/nmap/scripts`.

To install manually a script

```bash
$ script_name=<script-name>
$ sudo wget -O /usr/share/nmap/scripts/$script_name.nse https://svn.nmap.org/nmap/scripts/$script_name.nse
$ nmap --script-updatedb
```

To find a script

* Use NSEDoc, for instance ["smb" NSE scripts](https://nmap.org/search/?q=smb)
* Or, use commands, `ls -l /usr/share/nmap/scripts/*smb*`

</div></div>
</details>

There are techniques to try to bypass firewalls (fragment packet, add delay, use a badsum...).