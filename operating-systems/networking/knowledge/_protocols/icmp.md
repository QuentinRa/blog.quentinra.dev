# Internet Control Message Protocol (ICMP)

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

The Internet Control Message Protocol (ICMP) is used by a machine to indicate success or failure when communicating with another machine.

* 💀 Host unreachable
* 🔒 Port closed
* ...

For instance, if someone tries to send a message using TCP to a closed port, then the server may respond with an ICMP message saying that the port is closed.

🐊️ **Port**: none <small>(encapsulated within IP packets)</small>

🗺️ **Used by**: `ping`, `traceroute`...
</div><div>

**Header**

* 1 byte for "type"
* 1 byte for "code"
* 2 bytes for "checksum of the message"
* 4 bytes for "additional/specific information"

Each code is associated with a type. Here are some of them (code: type). See [Control Messages (ICMP) on Wikipedia](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages)

* `0`: echo reply
* `3`: destination unreachable
* `5`: redirect
* `8`: echo
* `11`: time exceeded
</div></div>