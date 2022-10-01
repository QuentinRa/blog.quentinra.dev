# Linux networking commands

A lot of commands, along with their most useful options, and some tips about their usage, that can be used on Linux-based distributions. This includes commands such as `hostname`, `ip`, `ifconfig`, `ss`, `ping`, `ncat/nc/netcat`, `whois`, `dig`, `wireshark`, `tcpdump`, `tshark`, `arp`, `route`, `iptables` and many more.

<hr class="sl">

## x

<div class="row row-cols-md-3 mt-4"><div>
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