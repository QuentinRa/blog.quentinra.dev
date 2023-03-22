# Address Resolution Protocol (ARP)

<div class="row row-cols-md-2"><div>

The Address Resolution Protocol (ARP) is used **to find a MAC given an IPV4 address**. Once found, the MAC is stored in the ARP cache.

🐊️ **Port**: N/A

➡️ Some systems have an ARP table on top of the ARP cache.

You can observe an ARP request by using `tcpdump`, and a `ping` on an uncached target

```text!
... request who-has <target_IP> tell <sender_IP> ...
```

```text!
... reply <target_IP> is-at <MAC_address> ...
```

⚠️ ARP packets are bound to their subnet, and they can't leave it. If a target is not found within the subnet, then the request will be sent to the gateway. The gateway will most likely either return the IP address <small>(if cached)</small> or repeat the same process.
</div><div>

There are two kind of messages:

**ARP Request broadcast** 🔎: A machine is asking every machine of a network is a MAC is theirs using the broadcast MAC address.

* Mac source (requester MAC address)
* Mac destination (`ff:ff:ff:ff:ff:ff`)
* IP source (requester IP)
* IP destination (target IP)

**ARP Reply**/Response 🧑: if a machine found its IP in the Request, they are replying to the sender with its MAC.

* Mac source (its MAC address)
* Mac source (requester MAC address)
* IP source (target IP)
* IP destination (requester IP)
</div></div>

<hr class="sep-both">

## ARP vulnerabilities

<div class="row row-cols-md-2 mt-3"><div>

* **ARP cache poisoning**

👉 An attacker send its MAC address to usurp the identity of a legitimate IP address. ➡️ You can use static ARP tables...
</div><div>

* **ARP spoofing**

👉 Similar to ARP cache poisoning, but the attacker only eavesdrops the traffic. ➡️ Use encryption/... to prevent unauthorized access to the network.

DHCP servers are used to assign an IP address to a host, and may keep track of IP addresses of DNS servers and domain names, and additional information such as default gateways/...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* ARP snooping
</div><div>
</div></div>