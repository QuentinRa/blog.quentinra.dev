# Networking

...

<hr class="sl">

## ...

...

<hr class="sr">

## MAC address

<div class="row row-cols-md-2"><div>

A **media access control address (MAC address)** is a **unique (physical) address** associated with the network card (`carte réseau`) of the machine uses to connect itself to the internet.

* Can be [spoofed](https://en.wikipedia.org/wiki/MAC_spoofing) <small>(some hacker can usurp your MAC)</small>

</div><div>

This is a 6-bytes-long address such as `FF:FF:FF:FF:FF:FF` with 12 hexadecimal character, separated with a colon.

* The first 6 characters are the vendor/manufacturer
* The last 6 characters are the unique address
</div></div>

<hr class="sl">

## IPV4 addresses

A Internet Protocol version 4 (**IPV4**) address is a **32-bits long address**.

<details class="details-e">
<summary>Dot-decimal notation (<code>Notation décimale pointée</code>, DDN)</summary>


<div class="row row-cols-md-2"><div>

This is the most-known representation of a IPV4 address. We are splitting ours **32 bits** into **4 groups of 8 bits** called **bytes**/octets (`octect`), we are converting them to decimal, and separated with a **dot**.

* Starting with a binary IP <small>(ex: `0101100010[...]01`)</small>
* We are ending with **n.n.n.n** <small>(with each $n \in \[0,\ 255]$)</small>
* Example: `127.0.0.1`

</div><div class="align-self-center">

Given this IP (binary): `01001101001000011110000100000000`

* Split into 4 blocs: `01001101`, `00100001`, `11100001`, and `00000000`
* We convert each bloc: `77`, `33`, `225`, and `0`
* We separate them with a dot: `77.33.225.0`
* [Online tool to convert bin to IP](https://www.browserling.com/tools/bin-to-ip)
</div></div>
</details>

<details class="details-e">
<summary>id_net, id_host, and network address</summary>

<div class="row row-cols-md-2"><div>

The bits in the IP address are actually separated in 2 parts

* **id_net**: a fixed part for every address in a network, that is used to identify the network
* **id_host**: every remaining bit. Pointing to a host in a network, but if there is only null-bits (0), then this is the **address of the network**.

You can't guess the number of fixed bits, either it is given by an organism <small>(such as your ISP)</small>, or you are given something called the netmask which is explained a bit further.
</div><div>

Example: is xxx a network address?

We consider the IP `01001101001000011110000100000000` (`77.33.225.0`). We are told that for the fixed part is 17 bits long.

* id_net: `01001101001000011` (17 bits)
* id_host: `110000100000000` (32-17=15 bits)

The id_host has non-null bits, so it's not a network address.
</div></div>
</details>

<details class="details-e">
<summary>Classless Inter-Domain Routing (CIDR)</summary>

<div class="row row-cols-md-2"><div>

It is a way to write/share an IP address along the number of bits of the fixed part. The syntax is `ip/n`, such as `192.168.0.0/12`.

* `ip` is the network address
* `n` is the amount of fixed bits
</div><div>

We have the address `01001101001000011110000100000000` (`77.33.225.0`). We were told that there is 24 fixed bits.

* We are extracting 24 bits from the address: `010011010010000111100001`
* We are filling the missing bits with `0` (32-24=8): `01001101001000011110000100000000`
* We are converting the bits to DDN: `77.33.225.0`
* We are adding `/24`: `77.33.225.0/24`

The CIDR notation is `77.33.225.0/24`.
</div></div>
</details>

<details class="details-e">
<summary>netmask (<code>Masque de sous-réseau</code>)</summary>

<div class="row row-cols-md-2"><div>

This is an IP address which is a mask that can be used to find the number of fixed bits in another IP address.

* We are writing **n** non-nul bits (1), with $n$ the number of fixed bits
* We are completing with nul bits (0)

If we know that `77.33.225.0` has 24 fixed bits, then we will write 24 times "1", and 8 <small>(32-24)</small> times "0", giving us `11111111111111111111111100000000` which is `255.255.255.0`.
</div><div>

Given a CIDR address `77.33.128.0/17`, it's even easier to find the netmask.

* Calculate $\frac{n}{8}$: $\frac{17}{8}$ gives us $q=2$, $r=1$
* Calculate $c=255-2^{8-r} + 1$: $255-2^{8-1}=128$
* The result is $q$ times $255$, 1 time $c$, and $\min(4-q-1, 0)$ times $0$
* Giving us $255.255.128.0$
</div></div>
</details>

<details class="details-e">
<summary>broadcast mask (<code>Masque de diffusion</code>)</summary>

<div class="row row-cols-md-2"><div>

This mask is used to send a message to EVERY machine of the network. 

Basically, you are simply filling the **id_host** with non-nul bits (1).
</div><div>

Given the IP `77.33.225.0/24`,

* id_net: `010011010010000111100001` (extract 24 bits)
* id_host: `11111111` (fill last 8 bits with 1)

Giving us `01001101001000011110000111111111` which is `77.33.225.255`.
</div></div>
</details>

<details class="details-e">
<summary>Reserved/Private IP addresses</summary>

There are 3 ranges of IPV4 addresses that are said private/reserved for internal use

* `10.0.0.0/8`
* `172.16.0.0/12`
* `192.168.0.0/16`
</details>

<hr class="sr">

## IPV6 addresses

<div class="row row-cols-md-2"><div>

The Internet Protocol version 6 (**IPV6**) address is a **128-bits long address**. It was introduced because of the shortage of IPV4. It's also more efficient due to new technologies.

It looks like this: `2002:6963:6961:2046:616c:636f:6e20:3c33`, which is 8 blocs of 16 bits, separated with `:`. Because it's somewhat long, there are a few rules to shorten it

* Any leading $0$ in a bloc can be removed <small>(`0014 -> 14`)</small>
* A whole bloc of $0$ can be replaced with one $0$ <small>(`0000 -> 0`)</small>
* **One**, and only one suite of nul-groups, may be merged in `..` <small>(`...:0000:0000:... -> ...::...`)</small>
</div><div>

There are 8 kind of IPV6 addresses

| Type/Name                        | Prefix (128 bits) | IPV6 notation            |
|----------------------------------|-------------------|--------------------------|
| Unspecified (`non spécifié`)     | 0...0             | ::/128                   |
| LoopBack (=localhost)            | 0...01            | ::1/128                  |
| Multicast (=broadcast)           | 111111110...0     | ff00::/8                 |
| Multicast (using ARP)            |                   | ff02::/8                 |
| Link-local Unicast (subnet only) | 1111111110...0    | ff80::/10                |
| Unique local Unicast (private)   | 11111101...0      | ffd0:://8<br>ffc0::/7    |
| Global Unicast (Internet)        | ...               | 2001..<br>2002...<br>... |
</div></div>

<hr class="sl">

## OSI model

The Open Systems Interconnection (**OSI**) model is a standardised representation of how we could send a message between two machines. It's made of **7 layers** (`couche`): Physical, Data Link, Network, Transport, Session, Presentation, and Application. Although it's newer that the TCP/IP model, the later remain the most widely used one as it is more compact.

<div class="row"><div class="col-md-7">

When a computer send a message, it will be send starting a layer, and go down. When a computer receive a message, it will go up every layer in the reverse order.

* **Layer 7 - Application**: Programs are exchanging data <small>(HTTP, SSH, FTP, SMTP...)</small>
* **Layer 6 - Presentation**: Standardize, add encryption/compression... <small>(SSL, TLS...)</small>
* **Layer 5 - Session**: Try to establish a connexion <small>(RPC, PAP...)</small>
* **Layer 4 - Transport**: select a protocol <small>(TCP, UDP...)</small>
* **Layer 3 - Network** (`Réseau`, Router): create a packet <small>(IP, NAT...)</small>
* **Layer 2 - Data Link** (`Liaison`, Switch): resolve MAC <small>(ARP, ETH...)</small>
* **Layer 1 - Physical** (HUB): binary to signals <small>(links, USB...)</small>
</div><div class="col-md-5">

Each time a `data` go down to be sent, a header is added. This process is called **encapsulation**. 

When a message is received, each header will be removed when going up. This process is called **de-encapsulation**.

The data being send is named differently according to the headers that were added

* **Level 5 to 7**: data
* **Level 4**: segments (TCP), or datagrams (UDP)
* **Level 3**: packets
* **Level 2**: frames
* **Level 1**: stream (bits)
</div></div>

<hr class="sr">

## TCP/IP model

The TCP/IP model was introduced way before the OSI model, and remain the most used because it's more compact. It's made of 4 layers

* **Layer 4 - Application**: Layers 5 to 7 of OSI
* **Layer 3 - Transport**: Layers 4 of OSI <small>(socket, port...)</small>
* **Layer 2 - Internet**: Layers 3 of OSI <small>(IP, ETH...)</small>
* **Layer 1 - Physical**: Layers 1, and 2 of OSI <small>(WIFI, ADSL, ETH...)</small>

Some are splitting the "Layer 1" back in two layers, but it's not in the RFC1122 standard.

<hr class="sl">

## Protocols

<details class="details-e mt-4">
<summary>TCP (6): transmission control protocol</summary>
<div class="row row-cols-md-2"><div>

It's a **connection-based protocol**. It's used when there is a need for a **trustworthy/reliable** (`fiable`), and ordered way of sending messages.. If there is an error, then the sender is notified, and the message is sent again.

> **TCP** messages are called segments.

**Example**

* `ssh`

TCP messages all have a [flag](https://en.wikipedia.org/wiki/Transmission_Control_Protocol)

* `1`: F=FIN
* `2`: S=Syn
* `4`: R=Reset
* `8`: P=Push
* `16`: A=Ack
* ...

</div><div>

**Header**

* 2 bytes for "source port"
* 2 bytes for "destination port"
* 4 bytes for "sequence number" (seq)
* 2 bytes for "acknowledgement number" (ack)
* 4 bits for the "offset"
* 3 bits "reserved" (000)
* 9 bits for the "flag"
* 2 bytes for the "frame/windows" (`cadre`)
* 2 bytes for the "checksum"
* 2 bytes for the "urgent pointer"
* 4 bytes for "options" (optional)
</div></div>
</details>

<details class="details-e mt-4">
<summary>UDP (17): user datagram protocol</summary>
<div class="row row-cols-md-2"><div>

It's a **connection-less protocol**. It's used for fast messaging, by applications that don't mind if a packet is loss/incorrect. It's **not trustworthy** (`fiable`)

* No warranty that the message will be received
* No warranty that the message received is correct

> **UPD** messages are called datagrams.
</div><div>

**Example**

* `dig`

**Header**

* 2 bytes for "source port"
* 2 bytes for "destination port"
* 2 bytes for "size of the message"
* 2 bytes for "checksum of the message"
</div></div>
</details>

<details class="details-e mt-4">
<summary>ICMP (1): internet control message protocol</summary>
<div class="row row-cols-md-2"><div>

It's used by a machine to indicate success or failure when communicating with another machine.

* Host unreachable
* Port closed

For instance, if someone tries to send a message using TCP to a closed port, then the server may respond with an ICMP message saying that the port is closed.

**Example**

* `ping`
* `traceroute`
</div><div>

**Header**

* 1 byte for "type"
* 1 byte for "code"
* 2 bytes for "checksum of the message"
* 4 bytes for "additional/specific information"

Each code is associated with a type. Here some of them (code: type). See [Control Messages (ICMP) on Wikipedia](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages)

* `0`: echo reply
* `3`: destination unreachable
* `5`: redirect
* `8`: echo
* `11`: time exceeded

</div></div>
</details>

<details class="details-e mt-4">
<summary>IP (?): internet protocol</summary>
<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>
</details>

> One thing to note, is that for instance in UDP, there is no "IP address" in the header. You should remember than UDP is working at a layer above (Layer 4) the one adding such information (Layer 3). And, as written before, each layer is adding its header, so still for UDP, you would have the header of IP followed by the header of UDP...

<hr class="sr">

## Domain Name System (DNS) protocol

<div class="row row-cols-md-2"><div>

Remembering IP addresses can be a trough process. Because of that, **Fully Qualified Domain Name** (FQDN), mostly simply called **Domain names**, were introduced, pointing to IP addresses.

For instance, the domain name `example.com` is pointing to `93.184.216.34`.

> Note: `example.com` is actually `example.com.`, with a "`.`" at the end. That's why "`.`" is called the root, as every domain is "starting" with "`.`".

</div><div>

When a computer requests the IP associated with a domain name

<details class="details-n">
<summary>1. It will check if there is the answer in the cache</summary>

DNS records are stored in the cache for a duration determined by their **Time-to-live (TTL)** which is sent along the IP when requesting a DNS record.
</details>

<details class="details-n">
<summary>2. If not cached, it will ask a <b>recursive DNS server</b></summary>

Your internet provider (ISP) maintain its own recursive servers.

The **root domain** is "`.`", and its servers are keeping track of the IP addresses of the **Top level domain (TLD)** servers: `.com`, `.net`, `.fr`... TLD are keeping track of servers one-level down: **Authoritative name servers**, in which DNS records are stored.
</details>

<details class="details-n">
<summary>RFC 1034 approach</summary>

The iterative approach mandated by the RFC 1034 is

* A client is asking the IP of `www.example.com` to the root server `.`
* The root server tell him to ask `.com`, and give the IP of `.com`
* The client asks `.com`, which responds with the IP of `example.com`
* The client asks `example.com`, which responds with the IP we were looking for

But, in practice, to reduce traffic, and not put a heavy pressure on the root servers, practices such as caching are used.
</details>
</div></div>