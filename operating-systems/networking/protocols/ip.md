# Internet Protocol (IP)

[![introductiontonetworking](../../../cybersecurity/_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)

<div class="row row-cols-lg-2"><div>

The Internet Protocol (IP) add necessary information to data allowing routing and internetworking communication.

🐊️ **Port**: N/A

🗺️ **Used by**: `tcp`, `udp`...

The IP protocol is using this header

![IP Header](_images/ip_headers.png)

The size of the payload is **TPL-IHL**.

Packets may be fragmented 🪓. Two fragmented packets must have:

* the same source, destination, id, and protocol
* every packet aside from the last one must have the flag MF <small>(flag[+])</small>, while the last one has the flag DF <small>(flag[none])</small>.
</div><div>

* **version** 🔢: 4 (IPV4), or 6 (IPV6)

* **IHL** ✉️: a quarter of the length of the header, which is usually 20 bytes <small>(so, the IHL would be 5)</small>.

* **TPL** 📫: the size of the entire packet in bytes

* **Fragment ID** 🔑: identifier of the packet. Fragmented packets have the same fragment ID.

* **FLAG** 👮:
    * 010 (DF): do not fragment
    * 001 (MF): more fragments are coming
    * 100 (X): reserved

<p></p>

* **Fragment Offset** 🎯: index of this package payload in the un-fragmented data. This is the sum of the length of previously fragmented packet payloads. This value is in **bytes** <small>(TPL divided by 8)</small>. For instance, the first fragment would have 0.

* **TTL** 💀: decrease by one each time a packet transit by a host. The packet is destroyed when the TTL reaches 0. This exist to prevent infinite looping.

* **Protocol** 💳: which protocol was used <small>(1=ICMP, 6=TCP, 17=UDP...)</small>. [See the list of IP protocol numbers](https://en.wikipedia.org/wiki/List_of_IP_protocol_numbers).
</div></div>