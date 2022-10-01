# Linux networking commands

A lot of commands, along with their most useful options, and some tips about their usage, that can be used on Linux-based distributions. This includes commands such as `hostname`, `ip`, `ifconfig`, `ss`, `ping`, `ncat/nc/netcat`, `whois`, `dig`, `wireshark`, `tcpdump`, `tshark`, `arp`, `route`, `iptables` and many more.

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

Useful option: `-r` to show names instead of ips.
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

* `-b ip`: ping all address in the ip range
* `-t ttl`: set the time to live of the ping
* `-s size`: size of the ping
</details>
</div><div>
<details class="details-e">
<summary><code>dig</code>: ip to name, name to ip</summary>

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

<details class="details-e">
<summary><code>nmap</code>: scan a machine to get some data (ports...)</summary>
<div class="row row-cols-md-2"><div>

List targets to scan

```bash
$ nmap 127.0.0.1 -sL
$ nmap localhost -sL
$ nmap google.fr -sL
```

Start a ping-scan (do not scan ports)

```bash
$ nmap localhost -sn
```

Pick a protocol: UDP (U), TCP(S, or T)

```bash
$ nmap localhost -sU # root
$ nmap localhost -sS
$ nmap localhost -sT
```

You can execute a lua script with `--script=lua_script`, see [nsedoc](https://nmap.org/nsedoc/) ([nsedoc scripts](https://nmap.org/nsedoc/scripts/): simply give the name of the script to execute).
</div><div>

Only try to map some ports

```bash
$ nmap localhost -p 22
$ nmap localhost -p 22,23
$ nmap localhost -p 0-65535
```

To reduce the risk of being detected, you can set some timing starting 0=passive=slow, and up to 5=aggressive=fast.

```bash
$ nmap localhost -p 22 -T0
```

Detect OS (-o), OS+Version (-A), or all information (-v).

```bash
$ nmap localhost -O
$ nmap localhost -A
$ nmap localhost -v
```
</div></div>
</details>

<hr class="sl">

## Monitoring

<details class="details-e mt-4">
<summary><code>tcpdump</code>: monitor network (root required)</summary>
<div class="row row-cols-md-2"><div>

* `-i interface` : interface à écouter
* `-e`: affiche l’entête de la requête
* `-n`: affiche les noms plutôt que les adresses
* `-l`: copy results in a buffer (`tcpdump -l | tee file`)
* `-o`: no optimisations (listen take a lot of resources)
* `-F`: read from a phile
* `-v` et `-vv`: show more, or even more verbosity
* `-t`: do not show time
* `host name_or_address`: listen only one host, you can add other hots with `AND host ...`

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

You can enter theses in the main bar to filter entries

* `ip.src == some_ip`, or `ip.dest == some_ip`
* `tcp.port == some_port`, or `udp.port == some_port`
* `http.request.method == GET`,or `http.request.method == POST`, or ...
* You can use `&&` (logical AND), `||` (logical OR), `!=` (different)

Once you find something interesting, right-click on it > Follow > Flux, and pick a protocol.

Use File > Export > HTTP to GET download files.
</details>
</div></div>

<hr class="sl">

## ARP, and network filters

<details class="details-e mt-4">
<summary><code>iptables</code>: network filters (root required)</summary>
<div class="row row-cols-md-2"><div>

* `-t table`: FILTER by default
* `-A chain`: add a rule at the end of the chain
* `-I chain`: add a rule at the start of the chain
* `-D chain`: supprime une règle
* `-o interface`: sort par l’interface
* `-i interface`: entre par l’interface
* `-j action`: chain or
  * `SNAT/DNAT`: translation source/destination
  * `ACCEPT`: allow
  * `DENY/DROP`: deny without notifying sender
  * `REJECT`: deny, but notify sender
* `-s ip`: source <small>(separated by colons)</small>
* `-d ip`: destination (s<small>(separated by colons)</small>
* `--sport port`: source port
* `--dport port`: destination port
* `--to ip`: if SNAT/DNAT, the new source/destination
* `-p protocol`: which protocol

**Note**: you can use `!` (NOT), such as `-s !127.0.0.1` meaning every packet not having "127.0.0.1" as source will be filtered.
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