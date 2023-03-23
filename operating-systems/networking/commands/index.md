# Networking commands

<div class="row row-cols-md-2"><div>

This section gather commands that are used quite used in networking. It doesn't include commands for each protocol, such as `ftp` or `ssh`.

➡️ See [Protocols](../knowledge/index.md#protocols)
</div><div>

Special shortcuts

* [DNS protocol](../protocols/dns.md#dns-commands): dig, whois...
</div></div>

<hr class="sep-both">

## Configuration

++++++

[**hostname** - host name]

<div class="row row-cols-md-2"><div>

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

<div class="row row-cols-md-2"><div>

**Usage** 🐚: merge of multiple commands <small>(`route`, `arp`, `ipconfig`)</small>. Note that `ipconfig` is still used on Windows.

**Example** 🔥:

Show all interfaces <small>(a=addr=address, l=link)</small>

```ps
$ ip a
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

<div class="row row-cols-md-2"><div>


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
++++++

<hr class="sep-both">

## Communication

++++++

[**ping** - xxx]

**Usage** 🐚: xxx

**Example** 🔥:

```ps
$ xxx
```

[**nc/ncat/netcat** - xxx]

**Usage** 🐚: xxx

**Example** 🔥:

```ps
$ xxx
```

[**traceroute** - xxx]

**Usage** 🐚: xxx

**Example** 🔥:

```ps
$ xxx
```

[**tracepath** - xxx]

**Usage** 🐚: xxx

**Example** 🔥:

```ps
$ xxx
```
++++++

<hr class="sep-both">

## Monitoring

++++++

[**tcpdump** - xxx]

**Usage** 🐚: xxx

**Example** 🔥:

```ps
$ xxx
```

[**tshark** - xxx]

**Usage** 🐚: xxx

**Example** 🔥:

```ps
$ xxx
```

[**wireshark** - xxx]

**Usage** 🐚: xxx

**Example** 🔥:

```ps
$ xxx
```
++++++

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [DNS commands](../protocols/dns.md#-to-do-)
* [NFS commands](../protocols/nfs.md#-to-do-)
</div><div>


</div></div>