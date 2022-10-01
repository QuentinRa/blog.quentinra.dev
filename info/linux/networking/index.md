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

## x

<div class="row row-cols-md-3 mt-4"><div>
<details class="details-e" open>
<summary><code>hostname</code>: show hostname</summary>

```bash
$
```
</details>
</div><div>
<details class="details-e" open>
<summary><code>xxx</code>: xxx</summary>

```bash
$
```
</details>
</div><div>
<details class="details-e" open>
<summary><code>xxx</code>: xxx</summary>

```bash
$
```
</details>
</div></div>