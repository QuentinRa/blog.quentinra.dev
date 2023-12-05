# Networking commands

<div class="row row-cols-lg-2"><div>

This section gather commands that are used quite used in networking. It doesn't include commands for each protocol, such as `ftp` or `ssh`.

* [DNS protocol](../protocols/dns.md#dns-commands): dig, whois...
* ...

Refer to the list of [protocols](../_knowledge/index.md#protocols).
</div><div>
</div></div>

<hr class="sep-both">

## Configuration

++++++

[**hostname** - host name]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: show the name of the host

**Example** 🔥:

```ps
$ hostname
```
</div><div>

Show host domain

```ps
$ hostname -d
```
</div></div>

[**ip** - all in one]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: merge of multiple commands <small>(`route`, `arp`, `ipconfig`)</small>. Note that `ipconfig` is still used on Windows.

**Example** 🔥:

Show all interfaces <small>(a=addr=address, l=link, s=show)</small>

```ps
$ ip a
$ ip -4 a s # only IPV4
$ ip -brief a s # only a brief description
$ ip l
```

Show one interface "eth0" addresses/links

```ps
$ ip addr show dev0
$ ip link show dev0
```

Useful option 🧪: `-r` to show names instead of IPs.
</div><div>

Show routing table <small>(r=route)</small>

```ps
$ ip r
```

To add a route, you need a "_dest", a "_gateway", and an "_interface". See [Routing](../topology/devices/router.md#routing-table).

```ps
$ ip r add _dest via _gateway dev _interface
```

Show ARP cache <small>(n=neigh=neighbor)</small>

```ps
$ ip n
```
</div></div>

[**ipconfig** - Windows 'ip']

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: on Linux, `ipconfig` is deprecated over `ip a`, but on Windows, it's still the command used.

**Example** 🔥 - Linux:

Show information about the network. Note that RT = received, TX = emitted. Print info about all interfaces:

```ps
$ ifconfig -a
```

Only one interface "eth0"

```ps
$ ifconfig eth0
```
</div><div>

**Example** 🔥 - Windows:

List more or less information about each network interface.

```ps
CMD> ifconfig
CMD> ipconfig /all
```

Release an IP address

```ps
CMD> ipconfig /release
```

Request a new IP address

```ps
CMD> ipconfig /release
```
</div></div>

[**arp** - obsolete]
Show ARP cache. Obsolete, see `ip n`.

[**route** - obsolete]
Show Routing table. Obsolete, see `ip r`.

[**ss** - sockets stats]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: list open ports

**Example** 🔥:

```ps
$ ss
$ ss -a # all
$ ss -4 # ipv4
$ ss -t # tcp
$ ss -u # udp
$ ss -l # listening
$ ss -n # no resolve
```
</div></div>

[**netstat** - network info]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: show network information and stats.

**Example** 🔥:

```ps
$ netstat -l # list ports
$ netstat -i # list interfaces
$ netstat -r # routes
$ netstat -rn # routable networks
```
</div><div>

```ps
$ netstat -a # all ports
$ netstat [...] -t # TCP only
$ netstat [...] -u # UDP only
$ netstat -s # stats per protocol
$ netstat -p # service name + pid
$ netstat -tulpn # common usage
```
</div></div>
++++++

<hr class="sep-both">

## Communication

++++++

[**ping** - probe a host]

[![introtonetworking](../../../cybersecurity/_badges/thm/introtonetworking.svg)](https://tryhackme.com/room/introtonetworking)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: send a message to see if a host is up and replying to pings.

**Example** 🔥:

```ps
$ ping example.com
$ ping 8.8.8.8
```

Do "x" pings

```ps
$ ping -c x example.com
```
</div><div>

Other options

* `-b ip`: ping all addresses in the IP range
* `-t ttl`: set the time to live of the ping
* `-s size`: the size of the "ping"
* `-i interval`: the interval between pings
* `-v`: verbose
* `-i interface`: pass via interface
</div></div>

[**nc** - open a connection]

<div class="row row-cols-lg-2"><div>

[![activerecon](../../../cybersecurity/_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

**Usage** 🐚: you can create a server, and create clients, and exchange messages between them.

Variants: `ncat`, `netcat`.

**Example** 🔥 - server: listen on a port

```ps
$ nc ip -l port
$ nc ip -l -p port
$ nc ip -lp port
$ nc ip -lnvp port # 👈
# keep listening after last client disconnect
$ nc ip -lnvpk port
```
</div><div>

**Example** 🔥 - client: connect to a server at IP using a specific port

```ps
$ nc ip port
$ nc ip -p port
```

➡️ Connect to a python webserver...

➡️ Use `-vv` for quite verbose.
</div></div>

[**traceroute** - trace a packet]

[![introtonetworking](../../../cybersecurity/_badges/thm/introtonetworking.svg)](https://tryhackme.com/room/introtonetworking)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: trace the route that a packet is taking.

**Example** 🔥:

```ps
$ traceroute ip
```
</div><div>

Specify an interface, such as `eth0`

```ps
$ traceroute ip -i eth0
```

Use TCP/SYN

```ps
$ sudo traceroute ip -T
```
</div></div>

[**tracepath** - trace a packet]

**Usage** 🐚: trace the route that a packet is taking.

**Example** 🔥:

```ps
$ tracepath ip
```

[**tracert** - trace a packet]

**Usage** 🐚: Windows traceroute command.

**Example** 🔥:

```ps
CMD> tracert ip
```
++++++

<hr class="sep-both">

## Monitoring

++++++

[**tcpdump** - monitor network]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: monitor the network. Root required.

**Example** 🔥:

Listen for ICMP requests passing by the interface `tun0`

```ps
$ sudo tcpdump ip proto \\icmp -i tun0
```
</div><div>

* `-i interface` : listen to this interface
* `-e`: show the header of the request
* `-n`: show names instead of addresses
* `-l`: copy results in a buffer (`tcpdump -l | tee file`)
* `-o`: no optimizations (listen take a lot of resources)
* `-F`: read from a file
* `-v`, and `-vv`: show more, or even more verbosity
* `-t`: do not show time
* `host name_or_address`: listen to only one host, you can add other hots with `AND host ...`
</div></div>

[**tshark** - monitor network]

**Usage** 🐚: monitor network.

**Example** 🔥:

* `-f "filter"`: see [wireshark capture filters](/operating-systems/networking/others/tools/wireshark/index.md)
* `-F file`: read from a file

```ps
$ tshark -i eth0 -f "host some_ip"
```

[**wireshark** - monitor network]

A popular tool to monitor a network. See [Wireshark](/operating-systems/networking/others/tools/wireshark/index.md).

++++++

<hr class="sep-both">

## Security

++++++

[**ufw** - traffic rules]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: [UFW](https://help.ubuntu.com/community/UFW), Uncomplicated Firewall, is the default firewall for Ubuntu. Like others, you define rules for incoming/outgoing traffic.

**Example** 🔥:

```ps
$ sudo ufw status # list 
$ sudo ufw allow 22/tcp # allow
$ sudo ufw deny 22/tcp # deny
$ sudo ufw delete deny 22/tcp # delete
```
</div><div>

You can only allow/deny some hosts:

```ps
$ sudo ufw allow from IP to IP port 22
$ sudo ufw allow from IP to any port 22
$ sudo ufw allow from CIDR to any port 22
```
</div></div>

[**iptables** - traffic rules]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: define rules for incoming/outgoing traffic.

**Example** 🔥:

List tables

```ps
$ sudo iptables -L
```

DROP any packet using TCP, on port 22, having our machine as destination, and emitted by `172.16.1.1`.

```ps
$ sudo iptables -t filter -A INPUT -s 172.16.1.1 -p tcp --dport 22 -j DROP
```

Hide the source IP address using 50.50.50.50, for any packet passing by our interface "eth2".

```ps
$ sudo iptables -t NAT -A POSTROUTING -o eth2 -j SNAT --to-source 50.50.50.50
```

Common chains are:

* `INPUT`: incoming traffic
* `OUTPUT`: outgoing traffic
* `FORWARD`: traffic passing through
</div><div>

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
</div></div>

[**nftables** - traffic rules]

[![linuxsystemhardening](../../../cybersecurity/_badges/thmp/linuxsystemhardening.svg)](https://tryhackme.com/room/linuxsystemhardening)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: define rules for incoming/outgoing traffic. It's replacing the legacy `iptables`, and supposedly more scalable and performant.

**Example** 🔥:

A table is used to store chains.

```ps
$ nft add table t_name # create
$ nft list table t_name # list chain+rules
$ nft delete table t_name # delete
```

A chain is a suite of rules.

```ps
# incoming traffic
$ nft add chain t_name c_name { type filter hook input priority 0 \; }
# outgoing traffic
$ nft add chain t_name c_name { type filter hook output priority 0 \; }
```
</div><div>

Add rules.

```ps
# accept traffic from port 22
$ nft add fwfilter c_name tcp sport 22 accept
# drop traffic to port 22
$ nft add fwfilter c_name tcp dport 22 drop
```

* `sport`/`dport`: based on the port
* `saddr`/`daddr`: based on the IP
* `accept`/`drop`: accept or drop the packet
* `limit rate 5/minute`: example to limit rate
</div></div>
++++++

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [DNS commands](../protocols/dns.md#-to-do-)
* [NFS commands](../protocols/nfs.md#-to-do-)
* `arp -a`, `arp -a -d`
* `iptables [...] -j REJECT --reject-with tcp-reset`
* `(timeout 1 bash -c '</dev/tcp/IP/port' && echo OPEN || echo CLOSED) 2> /dev/null`

```shell!
$ # sudo apt install bridge-utils
$ sudo brctl addbr xxx
$ sudo brctl show
$ sudo brctl delbr
$ sudo brctl addif name interface # can more multiple interfaces
$ # which will bridge them altogether
$ sudo ip link set dev xxx up # set up
```
</div><div>

* [vnstat](https://github.com/vergoh/vnstat): `sudo vnstat -l -i tun0`
</div></div>