# User Datagram Protocol (UDP)

<div class="row row-cols-md-2"><div>

User Datagram Protocol (UDP) is used for fast messaging, by applications that don't mind if a packet is lost/incorrect. It's

* **connection-less** 🦘: no prior connection is established
* **stateless** 🙉: no information about the session is kept

It's used when speed is more important than quality.

🐊️ **Port**: N/A

🗺️ **Used by**: `dhcp`, `dig`, `dns`...

✍️ UDP PDUs are called **datagrams**.
</div><div>

It's not trustworthy:

* 🚮 No warranty that the message will be received
* 🙅 No warranty that the message received is correct
* 🥏 No warranty that the message are received in the correct order

**UDP Header**

* 2 bytes for the "source port"
* 2 bytes for the "destination port"
* 2 bytes for the "size of the message"
* 2 bytes for the "checksum of the message"
</div></div>