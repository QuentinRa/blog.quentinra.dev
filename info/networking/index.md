# Networking

...

<hr class="sl">

## xxx

...

<hr class="sr">

## IPV4 addresses

<div class="row row-cols-md-2"><div>

A Internet Protocol version 4 (**IPV4**) address is 

* a 32-bits long address = 4 bytes/octet (`octects`, 8 bits)
* with each byte separated with a dot (`.`)

For instance: `127.0.0.1`.

Such address is made of two parts

* **id_net**: a fixed part for every address in a network, that is used to identify the network
* **id_host**: if every remaining bit is 0, then this is the **network address**, otherwise, this is the address of a host.

<details class="details-e">
<summary>Example</summary>

We consider the IP `77.33.225.0` which is `01001101.00100001.11100001.00000000` if we are converting each byte to binary. We will assume that for this IP, the **id_net** is made of 17 bits. If so,

* id_net (17 bits): `01001101.00100001.1`
* id_host (15 bits): `1100001.00000000`

The id_host has non-null bits, so it's not a network address.
</details>
</div><div>
</div></div>