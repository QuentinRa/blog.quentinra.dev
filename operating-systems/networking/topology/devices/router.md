# Routers

[Go back](../index.md#networking-devices)

<div class="row row-cols-md-2"><div>

A device usually connecting a LAN network with a WAN network, while more generically, it connects two networks. 

It routes packets, meaning, it selects the best path to send traffic. This choice is determined by algorithms such as:

* 💨 Open Shortest Path First (OSPF)
* ☠️ Routing Information Protocol (RIP)
* ...
</div><div>

👉 These algorithms are using information such as the shortest number of devices to reach the target (hops), the reliability of the path <small>(are packet often lost?)</small>, the network speed <small>(fibre?)</small>...

A router can perform other operations such as 📥 converting local addresses <small>(ex: 192.168.0.\*)</small> 📤 to "world" addresses <small>(ex: 77.225.89.\*)</small>, or filter packets based on rules... See [Gateways](gateway.md).
</div></div>

<hr class="sl">

## Routing table

<div class="row row-cols-md-2"><div>

A router will use a routing table to determine

* if we can send the packet directly to the destination
* or, which machine can we delegate the delivery

![Routing table](../_images/routing_table.png)

**IFace** is the interface used to send the packet.
</div><div>

**Destination** is a range of IPs. It must be used with **GenMask** (NetMask) to identify what's the range. A destination of `0.0.0.0` with the GenMark `0.0.0.0` means every IP. It's used as a default rule.

⚠️️ The order of rules is important, the first matching one is used.

**Gateway**: if the IP is within a destination, the message is sent to the gateway. If the gateway is `0.0.0.0`, then it means that the device is directly connect to the machine.

➡️ Gateways associated with the default rule are usually IPs ending with `.1` or `.254`, while it's not mandatory.
</div></div>