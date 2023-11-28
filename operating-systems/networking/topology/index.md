# Network topology

<div class="row row-cols-lg-2"><div>

Network topology is the physical or logical layout of a network. It impacts performance, reliability, scalability, and security.

There are a few different kind of networks:

**Local Area Network** (LAN) 🏡: a network established within a limited area, such as your home, or a building. Devices are usually connected using Ethernet or WI-FI.

**Wide Area Network** (WAN) 🌍: a network made of multiple LAN networks.  What we refer to the Internet is the largest WAN network.
</div><div>

**Virtual Local Area Network** (VLAN) 🎮: a network of devices within a LAN, that are isolated from others devices. This segmentation is usually done to improve security and performances.

➡️ See also: MAN, SAN, CAN, GAN, and PAN. 
</div></div>

<hr class="sep-both">

## Networking devices

<div class="row row-cols-lg-2"><div>

Networking devices are interconnected by cables.

**Layer 7: Application Layer** <small>(data)</small> 🧑

* [Proxies](devices/proxy.md)
* [Load Balancers](devices/balancer.md)

**Layer 6: Presentation Layer** <small>(data)</small> 🔒

* N/A

**Layer 5: Session Layer** <small>(data)</small> 📶

* N/A

**Layer 4: Transport Layer** <small>(segment/datagram)</small> 📫

* [Load Balancers](devices/balancer.md)
* [Network Firewall](devices/firewall.md)
</div><div>

**Layer 3: Network Layer** <small>(packets)</small> 🌍

* [Routers](devices/router.md)
* [Gateways](devices/gateway.md)
* [Network Firewall](devices/firewall.md)

**Layer 2: Data Link Layer** <small>(frames)</small> 🔢

* [Switches](devices/switch.md)

**Layer 1: Physical Layer** <small>(stream)</small> 💺

* [Hubs](devices/hub.md)
* [Ethernet](devices/ethernet.md)
* Repeaters
* Modems

<br>

➡️ Note that some devices may operate at multiple layers.
</div></div>

<hr class="sep-both">

## Physical network topology

[![introtolan](../../../cybersecurity/_badges/thm/introtolan.svg)](https://tryhackme.com/room/introtolan)

<div class="row row-cols-lg-2"><div>

#### Star Topology ✨

All devices are only connected to a central networking device (hub or switch), forming a star. It's simple to set up, but require many cables. A problem in the central device will impact the whole network. 

#### Bus Topology 🚌

All devices are connected to a single "backbone" cable also called "bus". If a lot of packets are sent at the same time, the cable most likely be saturated. It's simple and rather cheap to set in place.

#### Point to Point Topology 🤝

Two devices are directly connected to each other. It's limited to two devices, and may be expensive, but is used when there is a need for high-speed and secure communication between two devices. 
</div><div>

#### Ring Topology 💍

Each device is connected to another one, forming a loop. Packets are only moving in one direction, meaning that sometimes packets will do a whole loop before reaching their target, which is not efficient, but it also means that there is no collision. If a computer/cable is faulty, then the loop is broken.

➡️ See the "Token ring" protocol.

#### Mesh Topology 🦴

Each device is connected to every other. It's efficient, and resilient, but costly and hard to maintain.

➡️ See also the partially-meshed topology.

#### Hybrid Topology 🤖

Combine two or more network topologies according to the need. It can be harder to maintain, but more appropriate for the company.
</div></div>

<hr class="sep-both">

## Logical network topology

<div class="row row-cols-lg-2"><div>

#### Peer-to-Peer Topology (P2P)

All network devices communicate with each other, without a centralized server (decentralized). It's easy to set up, but not much scalable, as it may become hard to maintain.

➡️ It's sometimes called "Point to Point", by mistake.
</div><div>

#### Client-Server Topology

Some network devices act as servers, and others as clients. It's the common approach, as client will request file servers/... for resources. It's harder to set up, but easier to maintain.
</div></div>

<hr class="sep-both">

## Network segmentation

<div class="row row-cols-lg-2"><div>

Network segmentation is the process of dividing a large network into smaller networks, isolated from each other.

It can be done for multiple reasons, such as increasing performances, security, or to make it easier to manage a group of machines.
</div><div>

#### Subnetting

[![introtolan](../../../cybersecurity/_badges/thm/introtolan.svg)](https://tryhackme.com/room/introtolan)

This is a technique to segment a network. We divide a large network into smaller subnetworks. Each subnet has its own address and can be managed separately.

* each subnet will have its own netmask, and broadcast mask <small>(the -2)</small>
* each subnet will have $2^{32-n} - 2$ addresses <small>($n$ fixed bits)</small>

<details class="details-n">
<summary>Example 🔥: divide $172.16.254.0/23$ in 2 subnets</summary>

* **Fix $n$ bits**: $2^{1} \ge 2$ giving us $n=1$
* **Ensure we have enough bits**: $23 + 1 \lt 32$ ✅
* Each network will have $2^{(32−(23+1))}−2 = 254$ IP addresses
* $172.16.254.0/23$ will be split in
  * $172.16.254.0/24$ <small>(the 24th bit is 0)</small>
  * $172.16.255.0/24$ <small>(the 24th bit is 1)</small>

The method is something like that:

* Given $k$ the number of subnets
* Given $N$ fixed bits
* Find the lowest $n$ solving $2^n \ge k$
* If $N + n \lt 32$, then you can't have $k$ subnets
* Each network will have $2^{(32−(N+n)}−2$ IP addresses

Each network is made by permutations of the newly added $n$ bits.
</details>
</div></div>

<hr class="sep-both">

## Topology design 🗺️

<div class="row row-cols-lg-2"><div>

**Plan the scalability**

* bandwidth requirements
* network capacity
* number of devices

And select an appropriate topology.

**To keep in mind**

* performance
* fault tolerance/availability
* monitoring and logging
* backups and updates

</div><div>

**Security**

* Network Segmentation
* Access control (the least privilege...)
* Firewalls
* Zoning and DMZ, VLANs and VPNs
* Password policy and MFA
* IDS/IPS/SIEM
* Data Loss Prevention system (DLP)
* Antispam server
* Physical measures
</div></div>

<hr class="sep-both">

## Network devices features

<div class="row row-cols-lg-2"><div>

#### High Availability (HA)

It's a feature available in many network devices. We design the network to avoid  single point of failure, for instance, using hardware redundancy, so that if a device fails, another one can take over without causing disruption to network traffic.
</div><div>

#### Traffic mirroring/spanning

This feature is available on many network switches. It allows us to duplicate the incoming and ongoing traffic to a monitored device such as a network analyzer or an IDS.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Topologies

* Tree network topology
* Daisy Chain topology
* Software-Defined Networking (SDN)
* Virtual Network Functions (VNFs)
* [Request-response](https://en.wikipedia.org/wiki/Request%E2%80%93response)
* HSM device
</div><div>

Devices

* Router on a stick
* [Jump server](https://en.wikipedia.org/wiki/Jump_server)
* [Bastion host](https://en.wikipedia.org/wiki/Bastion_host)

Random

* Port-forwarding
</div></div>