# Network topology

<div class="row row-cols-md-2"><div>

Network topology is the physical or logical layout of a network. It impacts performance, reliability, scalability, and security.

There are a few different kind of networks:

**Local Area Network** (LAN) 🏡: a network established within a limited area, such as your home, or a building. Devices are usually connected using Ethernet or WI-FI.
</div><div>

**Wide Area Network** (WAN) 🌍: a network made of multiple LAN networks.  What we refer to the Internet is the largest WAN network.

**Virtual Local Area Network** (VLAN) 🎮: a network of devices within a LAN, that are isolated from others devices. This segmentation is usually done to improve security and performances.

➡️ See also: MAN, SAN, and CAN. 
</div></div>

<hr class="sep-both">

## Networking devices

<div class="row row-cols-md-2"><div>

Networking devices are interconnected by cables.

**Layer 7: Application Layer** <small>(data)</small> 🧑

* [Proxies](devices/proxy.md)
* Load Balancers

**Layer 6: Presentation Layer** <small>(data)</small> 🔒

* N/A

**Layer 5: Session Layer** <small>(data)</small> 📶

* N/A

**Layer 4: Transport Layer** <small>(segment/datagram)</small> 📫

* Load Balancers
</div><div>

**Layer 3: Network Layer** <small>(packets)</small> 🌍

* [Routers](devices/router.md)
* [Gateways](devices/gateway.md)

**Layer 2: Data Link Layer** <small>(frames)</small> 🔢

* [Switches](devices/switch.md)

**Layer 1: Physical Layer** <small>(stream)</small> 💺

* [Hubs](devices/hub.md)
* Repeaters
* Modems

<br>

➡️ Note that some devices may operate at multiple layers.
</div></div>

<hr class="sep-both">

## Physical network topology

<div class="row row-cols-md-2"><div>

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

#### Hybrid Topology 🤖

Combine two or more network topologies according to the need. It can be harder to maintain, but more appropriate for the company.
</div></div>

<hr class="sep-both">

## Logical network topology

<div class="row row-cols-md-2"><div>

#### Peer-to-Peer Topology (P2P)

All network devices communicate with each other, without a centralized server (decentralized). It's easy to set up, but not much scalable, as it may become hard to maintain.

➡️ It's sometimes called "Point to Point", by mistake.
</div><div>

#### Client-Server Topology

Some network devices act as servers, and others as clients. It's the common approach, as client will request file servers/... for resources. It's harder to set up, but easier to maintain.
</div></div>

<hr class="sep-both">

## Networking segmentation

<div class="row row-cols-md-2"><div>

Segmenting a large network into smaller networks if often used in security to isolate each subnetwork, and apply separate security controls to each of them 🔎.

It can also be done to make it easier to manage a group of machines, or to improve performances.
</div><div>

...
</div></div>

<hr class="sep-both">

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Topologies

* Tree network topology
* Software-Defined Networking (SDN)
* Virtual Network Functions (VNFs)
</div><div>

Devices

* Router on a stick
</div></div>