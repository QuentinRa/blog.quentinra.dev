# Dynamic Host Configuration Protocol (DHCP)

[![introtolan](../../../cybersecurity/_badges/thm/introtolan.svg)](https://tryhackme.com/room/introtolan)

<div class="row row-cols-md-2"><div>

IPV4 addresses are usually not attributed to a host manually. We use a Dynamic Host Configuration Protocol (DHCP) server instead.

🐊️ **Ports**:

* 67 (UDP): to receive messages
* 68 (UDP): to send messages

➡️ See DHCPv6 for IPV6.

</div><div>

If a new device with no address IP is connecting to the network

1. **DHCP Discover**: the device sends a request to retrieve an IP
2. **DHCP Offer**: if there is a DHCP server, it answers with an IP
3. **DHCP Request**: the device confirms that it wants the IP address
4. **DHCP ACK**: the DHCP server confirms that the device was assigned the given IP address

➡️ DNS server can also store network information such as default gateways, other DNS servers addresses...
</div></div>

<hr class="sep-both">

## DHCP vulnerabilities

<div class="row row-cols-md-2"><div>

* **Rogue DHCP server attacks**

👉 An attacker set up a fake DHCP providing fake IP addresses to clients 💥 IP conflicts, MITM ➡️ See DHCP snooping and dynamic ARP inspection (DAI).
</div><div>

* **DHCP snooping attacks**

👉 An attacker intercept DHCP traffic to monitor it, and potentially prepare an attack. ➡️ See DHCPv6.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* DHCP, hacker answer before DHCP server
</div><div>


</div></div>