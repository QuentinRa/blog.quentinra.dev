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

<hr class="sl">

## Monitoring

<details class="details-e mt-4">
<summary><code>tcpdump</code>: monitor network</summary>
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
<summary><code>wireshark</code>: same as tcpdump</summary>

Just install, and start the software, everything should be fine.
</details>
</div></div>

<hr class="sl">

## ARP, and network filters

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