# Internet Protocol version 4

[Go back](../index.md)

<div class="row row-cols-lg-2"><div>

Internet Protocol version 4 (IPV4) addresses are 32-bits long addresses. Ex: `01001101001000011110000100000000`. The bits in the IP address are actually separated into 2 parts:

* **id_net** 🏠: it is the same bits for every address in a network.
* **id_host** 💻: The remaining bits. Identify a network device. If there are only null bits (0), then this is the **network address**.

You can't guess the number of bits used by **id_net**. Either it is given by an organism <small>(such as an ISP)</small>, or you are given the [netmask](#netmask-).
</div><div>

**Example** 🔥: is `01001101001000011110000100000000` a network address?  We are told that the fixed part is 17 bits long.

* id_net: `01001101001000011` (17 bits)
* id_host: `110000100000000` (32-17=15 bits)

The id_host has non-null bits, so it's not a network address.
</div></div>

<hr class="sep-both">

## Dot-Decimal Notation (DDN)

<div class="row row-cols-lg-2"><div>

This is the most-known representation of an IPV4 address. We are splitting ours 32 bits into 4 groups of 8 bits called bytes/octets. Then, convert them to decimal, and separate them with a dot 🤓.

* Start with a binary IP <small>(e.g., `0101100010[...]01`)</small>
* End up with **n.n.n.n** <small>(where each $n \in \[0,\ 255]$)</small>
* Example: `127.0.0.1`
</div><div>

Given the following IP: `01001101001000011110000100000000`

* Split it into four blocks: `01001101`, `00100001`, `11100001`, and `00000000`
* Convert each block to decimal: `77`, `33`, `225`, and `0`
* Separate them with a dot: `77.33.225.0`

See also: [Online tool to convert bin to IP](https://www.browserling.com/tools/bin-to-ip) and [Encoding](/tools-and-frameworks/knowledge/encoding/index.md#from-radix-2-to-radix-10).
</div></div>

<hr class="sep-both">

## Classless Inter-Domain Routing (CIDR)

<div class="row row-cols-lg-2"><div>

CIDR is a way to write/share an IP address along the number of bits of the fixed part. The syntax is `IP/n`, such as `192.168.0.0/12` 🚀.

* `IP` is the network address
* `n` is the number of fixed bits

💀 Traditionally, before CIDR, `n` could only be 8, 16, or 24. They were called A-class, B-class, and C-class networks.
</div><div>

We have the address `01001101001000011110000100000001` (`77.33.225.1`). We were told that there are 24 fixed bits.

* We are extracting 24 bits from the address: `010011010010000111100001`
* We are filling the missing bits with `0` (32-24=8): `01001101001000011110000100000000`
* We are converting the bits to DDN: `77.33.225.0`
* We are adding `/24`: `77.33.225.0/24`

The CIDR notation is `77.33.225.0/24`.
</div></div>

<hr class="sep-both">

## Netmask 🕸️

<div class="row row-cols-lg-2"><div>

This IP address is called a mask, as it was not created to be assigned to a machine, but to find the number of fixed bits in another IP address.

* We are writing $n$ <small>(=number of fixed bits)</small> non-null bits (1)
* We are filling the remaining bits with null bits (0)

If we know that `77.33.225.0` has 24 fixed bits, then we will write 24 times "1", and 8 <small>(32-24)</small> times "0", giving us `11111111111111111111111100000000` which is `255.255.255.0`.
</div><div>

It's even easier to find the netmask. <small>Example with `77.33.128.0/17`.</small>

* Calculate $\frac{n}{8}$ (<small>$\frac{17}{8}$ gives us $q=2$, $r=1$</small>)
* Calculate $c=255-2^{8-r} + 1$ (<small>$c=255-2^{8-1}=128$</small>)
* The result is
    * $q$ times $255$ <small>(2 times $255$)</small>
    * 1 time $c$ <small>(1 times $128$)</small>
    * and $\min(4-q-1, 0)$ times $0$  <small>(1 times $0$)</small>
* <small>Giving us $255.255.128.0$</small>
</div></div>

<hr class="sep-both">

## Broadcast mask 📶

<div class="row row-cols-lg-2"><div>

This is also a mask for the same reason as the netmask. It is used to send a message to EVERY machine in the network.

We are simply filling the **id_host** with non-null bits (1).
</div><div>

Given the IP `77.33.225.0/24`,

* id_net: `010011010010000111100001` (extract 24 bits)
* id_host: `11111111` (fill last 8 bits with 1)

Giving us `01001101001000011110000111111111` which is `77.33.225.255`.
</div></div>

<hr class="sep-both">

## Reserved/Private IP addresses

<div class="row row-cols-lg-2"><div>

There are 3 ranges of IPV4 addresses that are "reserved" for internal use. They are also called private addresses.

* `10.0.0.0/8`
* `172.16.0.0/12`
* `192.168.0.0/16`
</div><div>
</div></div>