# Internet Control Message Protocol (ICMP)

[![introductiontonetworking](../../../cybersecurity/_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)
[![wireshark](../../../cybersecurity/_badges/thmp/wireshark.svg)](https://tryhackme.com/room/wireshark)

<div class="row row-cols-lg-2"><div>

The Internet Control Message Protocol (ICMP) is used by a machine to indicate success or failure when communicating with another machine.

* 💀 Host unreachable
* 🔒 Port closed
* ...

For instance, if someone tries to send a message using TCP to a closed port, then the server may respond with an ICMP message saying that the port is closed.

🐊️ **Port**: N/A <small>(encapsulated within IP packets)</small>

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

<hr class="sep-both">

## ICMP vulnerabilities

<div class="row row-cols-lg-2"><div>

* **Echo request and reply ICMP**

👉 The attacker send an echo request to check if the host is up. The attacker may further attack even if there is no reply, while assuming that the host is up, but the reply help in confirming it. 💥 DoS with a flood of echo requests. ➡️ Limit ICMP requests to specific hosts/subnets, as disabling them may be problematic.

* **ICMP unreachable**

👉 Used in reconnaissance to gain information on the network <small>(ex: open ports/services...)</small>. ➡️ Configure hosts to not respond, but it's not recommended.
</div><div>

* **ICMP mask reply**

👉 The attacker ask an host about its subnet mask, and may use it to map an internal network. ➡️ Configure hosts to not respond. Mostly disabled by default on modern devices.

* **ICMP redirection**

👉 Redirect traffic to a target host through a compromised device. 💥 MITM ➡️ Disable ICMP Redirect messages.

* **ICMP router discovery**

👉 Add false routing entries to the routing table, so that the host send traffic to the wrong destination. ➡️ Disable ICMP router messages. Mostly disabled by default on modern devices.
</div></div>