# Ethernet

[![ethernet_frame](../../../../cybersecurity/_badges/rootme/network/ethernet_frame.svg)](https://www.root-me.org/en/Challenges/Network/ETHERNET-frame)

<div class="row row-cols-lg-2"><div>

Ethernet is a widely used technology in LAN networks. Usually, devices are connected to a switch/hub using Ethernet.

Ethernet is based on IEEE 802.3 standard. It uses a "Carrier sensitive multiple access with collision detection" or **CSMA/CP** in short, to avoid collisions 💥.
</div><div>

If both the switch and the machine try to send a message at the same time, then both messages are colluding, and are destroyed 🔥. To avoid that, following the CSMA/CP, 

* ✅ each device listens for traffic before sending messages
* 💥 If there is a collision, each device signal that they will re-send the message after waiting a random amount of time
</div></div>