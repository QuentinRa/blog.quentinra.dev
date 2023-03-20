# Dynamic Host Configuration Protocol (DHCP)

[Go back](../index.md)

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