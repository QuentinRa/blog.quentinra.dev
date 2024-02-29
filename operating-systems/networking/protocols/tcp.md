# Transmission Control Protocol (TCP)

[![introductiontonetworking](../../../cybersecurity/_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)
[![intro_to_network_traffic_analysis](../../../cybersecurity/_badges/htb/intro_to_network_traffic_analysis.svg)](https://academy.hackthebox.com/course/preview/intro-to-network-traffic-analysis)
[![packetsframes](../../../cybersecurity/_badges/thmp/packetsframes.svg)](https://tryhackme.com/room/packetsframes)
[![wireshark](../../../cybersecurity/_badges/thmp/wireshark.svg)](https://tryhackme.com/room/wireshark)

<div class="row row-cols-lg-2"><div>

Transmission Control Protocol (TCP) is a trustworthy protocol to ensure that the data sent is properly received, and in the correct order. If there is an error, the message is sent again.

* **connection-based** 🤝: a prior connection is established
* **stateful** 🐵: information about the session is kept
* **flow-control** 🐌: the sender can slow down the transmission rate

It's used when quality is more important than speed.

🐊️ **Port**: N/A

🗺️ **Used by**: `ssh`, `ftp`, `http`...

✍️ TCP PDUs are called **segments**.

TCP messages all have a [flag](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) according to they type:

* `1`: F=FIN
* `2`: S=Syn
* `4`: R=Reset
* `8`: P=Push
* `16`: A=Ack
* ...
</div><div>

**TCP three-way handshake** 📌

Using TCP, we establish a session between two machines A and B. A start with a SYN. B replies with SYN, ACK. A receives SYN, ACK, and replies with ACK. The closing handshake is the same with FIN.

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
* 0 to 40 bytes for "options" (optional)

</div></div>

<hr class="sep-both">

## TCP vulnerabilities

<div class="row row-cols-lg-2"><div>

* **SYN Flood Attack**

👉 An attacker send mass SYN requests creating many half-open connections and slowing down the target. 💥 DoS ➡️ Limit-rate the number of SYN packets accepted per second.

* **TCP Reset Attack**

👉 An attacker send RST to terminate legitimate connections to disrupt service. ➡️ Protect TCP connections <small>(ex: filters, encryption...)</small>.
</div><div>

* **TCP Session Hijacking**

👉 An attacker steal a session by stealing or guessing the session ID. ➡️ Use encryption, timeouts, forbid many active sessions...
</div></div>