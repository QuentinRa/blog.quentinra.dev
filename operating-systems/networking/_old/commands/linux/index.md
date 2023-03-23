# Linux networking commands

<hr class="sl">

## Explore

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

<hr class="sr">

## Interact with the outside

<div class="row row-cols-md-2 mt-4"><div>
</div><div>
<details class="details-e">
<summary><code>dig</code>: IP to name, name to IP</summary>

You can give a domain name, or an IP (`-x`).

```bash
# Name
$ dig example.com
# IP
$ dig -x 8.8.8.8
```

Domain name resolution is done by asking a **DNS server**. You can pick which DNS server should be used with `@` (1.1.1.1, 8.8.8.8/8.8.4.4=google...).

```bash
$ dig google.fr @8.8.8.8
```

We can explicitly ask for some data by using the option `-t` with one of the following

* `NS`: nameserver
* `A`: IPV4
* `AAAA`: IPV6
* `MX`: mail server

```bash
$ dig example.com -t A
;; ANSWER SECTION:
google.fr.              300     IN      A  172.217.13.131
$ dig example.com -t AAAA
;; ANSWER SECTION:
google.fr.              300     IN      AAAA 2607:f8b0:4020:805::2003
```

You can also add options: `+stats +trace +nodnssec`.
</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>whois</code>: show data about IP</summary>

You can also use [whois via their website](https://www.whois.com/whois/).

```bash
$ whois google.fr
$ whois 8.8.8.8
```
</details>
</div><div>
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

Listen for ICMP requests passing by the interface `tun0`

```bash
$ sudo tcpdump ip proto \\icmp -i tun0
```
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

See [wireshark](https://www.wireshark.org/download.html). Wireshark is providing a graphical interface. Inside the search bar, you can filter requests/responses

* `ip.src == some_IP`, or `ip.dest == some_IP`
* `ip.addr == some_IP`
* `tcp.port == some_port`, or `udp.port == some_port`
* `http.request.method == GET`, or `... == POST`...
* You can use `&&` (logical AND), `||` (logical OR), `!=` (different)
* You can enter a protocol, or `tcp`/`udp`

Once you find something interesting, right-click on it > Follow TCP Stream, and you will see in a human-readable way the data exchanged.

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

List tables

```bash
$ sudo iptables -L
```

DROP any packet using the protocol TCP, on the port 22, that has our machine for destination, emitted by `172.16.1.1`.

```bash
$ sudo iptables -t filter -A INPUT -s 172.16.1.1 -p tcp --dport 22 -j DROP
```

Hide any IP address using host1 IP address (50.50.50.50), when machines are sending a packet passing by this machine, using the network interface "eth2".

```bash
$ sudo iptables -t NAT -A POSTROUTING -o eth2 -j SNAT --to-source 50.50.50.50
```
</div></div>
</details>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* learn more about what can I do with netstat (-tulpn?)
* See cyber commands (ex: `nslookup`)
* [wireshark](https://unit42.paloaltonetworks.com/wireshark-workshop-videos/)
* `-j REJECT --reject-with tcp-reset`
</div><div>

* `nc -v` Verbose output` -vv` Very Verbose `-k` Keep listening after client disconnects and `-lvnp`
* `arp – a`, `arp –a –d`
</div></div>