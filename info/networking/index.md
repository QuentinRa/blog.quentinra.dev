# Networking

...

<hr class="sl">

## xxx

...

<hr class="sr">

## IPV4 addresses

A Internet Protocol version 4 (**IPV4**) address is a **32-bits long address**.

<div class="row row-cols-md-2"><div>

**Dot-decimal notation** (`Notation décimale pointée`)

This is the most-known representation of a IPV4 address. We are splitting ours **32 bits** into **4 groups of 8 bits** called **bytes**/octets (`octect`), we are converting them to decimal, and separated with a **dot**.

* Starting with a binary IP <small>(ex: `0101100010[...]01`)</small>
* We are ending with **n.n.n.n** <small>(with each $n \in \[0,\ 255]$)</small>
* Example: `127.0.0.1`

<details class="details-e">
<summary>Example</summary>

Given this IP (binary): `01001101001000011110000100000000`

* Split into 4 blocs: `01001101`, `00100001`, `11100001`, and `00000000`
* We convert each bloc: `77`, `33`, `225`, and `0`
* We separate them with a dot: `77.33.225.0`
* [Online tool to convert bin to IP](https://www.browserling.com/tools/bin-to-ip)

</details>
</div><div>

The bits in the IP address are actually separated in 2 parts

* **id_net**: a fixed part for every address in a network, that is used to identify the network
* **id_host**: every remaining bit. Pointing to a host in a network, but if there is only null-bits (0), then this is the **address of the network**.

<details class="details-e">
<summary>Example: is xxx a network address?</summary>

We consider the IP `01001101001000011110000100000000` (`77.33.225.0`). We are told that for the fixed part is 17 bits long. 

* id_net: `01001101001000011` (17 bits)
* id_host: `110000100000000` (32-17=15 bits)

The id_host has non-null bits, so it's not a network address.
</details>
</div></div>