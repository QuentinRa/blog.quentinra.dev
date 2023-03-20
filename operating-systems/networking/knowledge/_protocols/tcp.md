# Transmission Control Protocol (TCP)

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

Transmission Control Protocol (TCP) is a trustworthy protocol to ensure that the data sent is properly received, and in the correct order. If there is an error, the message is sent again.

* **connection-based** 🦘: a connection is established
* **stateful** 🐵: information about the session is kept

It's used when quality is more important than speed.

🐊️ **Port**: N/A

🗺️ **Used by**: `ssh`, `ftp`, `http`...

✍️ UDP PDUs are called **segments**.

TCP messages all have a [flag](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) according to they type:

* `1`: F=FIN
* `2`: S=Syn
* `4`: R=Reset
* `8`: P=Push
* `16`: A=Ack
* ...
</div><div>

**TCP three-way handshake** 📌

Using TCP, we establish a session between two machines A and B. A start with a SYN. B replies with SYN, ACK. A receives SYN, ACk, and replies with ACK.

There are sequence numbers and ack numbers on every message. The first SYN has a random value $a$. The second SYN has a random value $b$, while the ACK has the value $a+1$. The final ACK has the value $b+1$.

**Header**

* 2 bytes for the "source port"
* 2 bytes for the "destination port"
* 4 bytes for the "sequence number" (seq)
* 2 bytes for the "acknowledgment  number" (ack)
* 4 bits for the "offset"
* 3 bits that are "reserved" (000)
* 9 bits for the "flag"
* 2 bytes for the "frame/windows" (`cadre`)
* 2 bytes for the "checksum"
* 2 bytes for the "urgent pointer"
* 4 bytes for "options" (optional)

</div></div>