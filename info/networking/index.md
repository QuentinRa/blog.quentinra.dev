# Networking

...

<hr class="sl">

## xxx

...

<hr class="sr">

## Communication

<div class="row row-cols-md-2"><div>

A communication between two machines implies

* an IP to identify the network, and the machine outside the network
* a MAC address, to identify the current owner of an IP address
* a port, that is "where" the communication will pass by on a machine
* a protocol, which is "how" the communication will be handled
</div><div>
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

<hr class="sr">

## IPV6 addresses

<div class="row row-cols-md-2"><div>

A Internet Protocol version 6 (**IPV6**) address is a **128-bits long address**. It was introduced because of the shortage of IPV4.

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