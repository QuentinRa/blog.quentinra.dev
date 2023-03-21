# Network topology

Network topology is the physical or logical layout of a network. It impacts performance, reliability, scalability, and security.

<hr class="sep-both">

## Networking devices

<div class="row row-cols-md-2"><div>

Networking devices are interconnected by cables.

**Layer 7: Application Layer** <small>(data)</small> 🧑

* Proxies

**Layer 6: Presentation Layer** <small>(data)</small> 🔒

* N/A

**Layer 5: Session Layer** <small>(data)</small> 📶

* N/A

**Layer 4: Transport Layer** <small>(segment/datagram)</small> 📫

* Load Balancers
</div><div>

**Layer 3: Network Layer** <small>(packets)</small> 🌍

* Routers
* Gateways/Jumpoint

**Layer 2: Data Link Layer** <small>(frames)</small> 🔢

* Switches

**Layer 1: Physical Layer** <small>(stream)</small> 💺

* [Hubs](devices/hubs.md)
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
</div><div>

#### Ring/Token Topology 💍

Each device is connected to another one, forming a loop. Packets are only moving in one direction, meaning that sometimes packets will do a whole loop before reaching their target, which is not efficient, but it also means that there is no collision. If a computer/cable is faulty, then the loop is broken.

#### Mesh Topology 🦴

Each device is connected to every other. It's efficient, and resilient, but costly and hard to maintain.

#### Hybrid Topology 🤖

Combine two or more network topologies according to the need. It can be harder to maintain, but more appropriate for the company.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>
</div><div>
</div></div>