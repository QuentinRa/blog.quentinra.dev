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