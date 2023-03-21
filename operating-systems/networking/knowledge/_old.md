# Networking

We call a network of devices "internet", and what we refer to (THE) "Internet" are many small networks all joined together.

<details class="details-n">
<summary>Imunes - free open-source network emulator</summary>
<div class="row row-cols-md-2"><div>

[**imunes**](http://imunes.net/) is a free open-source network emulator in which you can create nodes (hosts, switches, routers...), connect them, add rules (see iptables), and send requests from one computer to another, mostly to test your network configuration.

```bash
$ sudo imunes &
```

You may have multiple sessions.

```bash
$ imunes image -l # list
$ imunes -b -e <id> # kill
```

> There are a lot of newer (and better?) alternatives...
</div><div>

Using the graphical interface

* <kbd>experiment | execute</kbd>: run simulation
* <kbd>experiment | terminate</kbd>: terminate simulation
* <kbd>double-click on a host</kbd>: open a terminal on the host
* <kbd>right-click on a node | configure</kbd>: setup rules <small>(routing, ARP)</small>
  * enable "custom startup config"
  * enable "editor | create | fill default"
  * then use your head

You can run a command on a machine from the terminal with

```bash
$ sudo himage <hostname>@<id> <command>
```
</div></div>
</details>

<hr class="sl">

## LAN, and WAN networks

<div class="row row-cols-md-2"><div>

**Wide area network** (WAN, `réseau mondial/étendu`) is every network outside your LAN network.

**Local Area Network** (LAN, `réseau domestique`) is a network established within a limited area, such as your home.

<details class="details-n">
<summary><b>Ethernet</b>: a cable to connect a device to a Hub/Switch.</summary>

Instead of connecting nodes/devices to each other, they all are connected to a switch/hub using Ethernet (norm IEE 802.3). They are using a technique called "Carrier sensitive multiple access with collision detection", or **CSMA/CP** in short, to handle collisions.

If both the switch and the machine try to send a message at the same time, then both messages are colluding, and are destroyed
  * each other signal that they will re-send the message
  * each network card has its own delay before sending a message again
  * the machine/switch sends the message first, and there is hopefully no problem this time
</details>
</div><div>

</div></div>

<hr class="sr">

## IPV4 addresses

<details class="details-e">
<summary>Subnetwork, subnet, subnetting: divide your network</summary>

<div class="row row-cols-md-2"><div>

Dividing a network into subnetworks/subnet (`sous-réseaux`), is called **subnetting**. For instance, given a network address, you may split it into $n$ subnetworks. In such case

* each network will have its own netmask, and broadcast address <small>(the "minus 2" when counting IPs)</small>
* it means that each network will have $2^{32-n} - 2$ addresses, with $n$ the number of fixed bits

The process is a bit complicated to explain 😢, please read the example too. Your current network address has $N$ fixed bits. Let's say you want to divide your network so that there are $x$ subnetworks.

* Find the lowest $n$ solving $2^n \ge x$
* If $N + n \ge 32$, then you can't
* Each network will have $2^{(32−N-n)}−2$ IP addresses
* Each network is made by permutations of the newly added $n$ bits
</div><div>

Example: Given $172.16.254.0/23$, we have $N = 23$, and we want to divide our network in $x=2$. Currently, your network can host $2^{32-23} - 2 = 512 - 2 = 510$. Dividing the network won't give us $255$ per subnet...

* $2^{1} \ge 2$ giving us $n=1$
* $22 + 1 \le 32$, so we can split our network in two
* Each network will have $2^{(32−23-1)}−2 = 254$ IP addresses
* $172.16.254.0/23$ will be split in
  * $172.16.254.0/24$ <small>(the 24th bit is 0)</small>
  * $172.16.255.0/24$ <small>(the 24th bit is 1)</small>

> **Subnets** are a logical way of dividing a network, while **network segments** are a physical way of doing so.
</div></div>
</details>

<hr class="sr">

## Network filters

<div class="row row-cols-md-2"><div>

Network filters are behaviors applied to a packet matching predefined rules. This section will highly refer to the command `iptables`. 

This command is using tables, the most widely used are **filter packets** (filter), and **network address translation** (NAT). Each table is made of sets of **chains** which are statements "`<expression> <action>`"

* `expression`: is a condition, that if false, will trigger action
* `action`: an action on the packet (filter/NAT), or another chain
</div><div>

<details class="details-e">
<summary>Table "filter"</summary>

This table is used to accept, or drop a packet. There are 3 chains, according to what packets are doing

* **FORWARD**: packets are transiting/passing by this machine
* **INPUT**: packets that have this machine for destination
* **OUTPUT**: packets that have been emitted from this machine

And you have actions such as **ACCEPT/DENY/DROP/...** to drop a packet. 

For instance, this command will DROP any packet using the protocol TCP, on the port 22, which has our machine as the destination, emitted by `172.16.1.1`.

```bash
$ sudo iptables -t filter -A INPUT -s 172.16.1.1 -p tcp --dport 22 -j DROP
```
</details>

<details class="details-e">
<summary>Table "NAT"</summary>

This table is used to modify the IP_SRC, or IP_DEST, usually referred to as translating, mostly to allow machines to communicate with each other, without being aware of which machine they are communicating with.

![NAT](_images/nat.png)

In the schema above, host1 wants to allow PC1, and PC2 to communicate, but doesn't want PC2 to know that messages are from PC1. When host1 receives a message from PC1, it will replace PC1 address (source) with its own address, and send it to PC2. When receiving a reply from PC2, it will replace its address (dest) with PC1 address, and send the reply to PC1. 

Another case, is that if a machine inside your network is sending a message to the outside world, instead of exposing your machines' IP addresses, you could only expose your host IP address by using NAT. 

There are 3 chains

* **POSTROUTING**: change source (action: SNAT)
* **PREROUTING**: change destination (action: DNAT)
* **OUTPUT**: applied on locally generated packets

For instance, this command will hide the IP addresses of pc1, and pc2, using host1 IP address (50.50.50.50), when they are sending a packet to the world using the network interface "eth2".

```bash
$ sudo iptables -t NAT -A POSTROUTING -o eth2 -j SNAT --to-source 50.50.50.50
```
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Websites

* [ccna](https://cisco.goffinet.org/ccna/)
* [faidherbe](https://www.faidherbe.org/tutoriel/)
* [Request-response](https://en.wikipedia.org/wiki/Request%E2%80%93response)

Notes about Virtual Private Network (VPNs)

* Create a secure tunnel allowing devices on different networks to communicate.
* PPP (internal VPNs using public/private key)
* PPTP use PPP, Point-to-Point Tunneling Protocol, allow leave network
* IPSec Internet Protocol Security (IPsec) encrypts data using the existing Internet Protocol (IP) framework.

Notes about ...

* VLAN (Virtual Local Area Network)
</div><div>

Notes about protocols

* Port-forwarding
* IPV6 EUI64

Notes about devices

* Switch: Layer2 (use MAC)
* Switch: Layer3 (use MAC/IP): can do routing

Notes about security

* Access Control List (ACL): rules determining which traffic is allowed/not allowed.
* Streaming network telemetry (modern SNMP?)
* Network Access Control (used with SNMP?)
</div></div>