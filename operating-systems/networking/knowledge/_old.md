# Networking

<details class="details-n">
<summary><b>Ethernet</b>: a cable to connect a device to a Hub/Switch.</summary>

Instead of connecting nodes/devices to each other, they all are connected to a switch/hub using Ethernet (norm IEE 802.3). They are using a technique called "Carrier sensitive multiple access with collision detection", or **CSMA/CP** in short, to handle collisions.

If both the switch and the machine try to send a message at the same time, then both messages are colluding, and are destroyed
  * each other signal that they will re-send the message
  * each network card has its own delay before sending a message again
  * the machine/switch sends the message first, and there is hopefully no problem this time
</details>