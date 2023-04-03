# Networking

<div class="row row-cols-md-2"><div>

A network is a net of devices connected to each other, such as all the devices connected to your internet box 💻.

These devices need to communicate <small>(securely!)</small> between each other ✉️.

![Random Network](_images/radom_network.png)
</div><div>

Some elements that are involved, shown in the simplified schema:

* **IP Address** 🌍: each network device has an IP address. This allows us to find **where** a machine is. Example: `188.155.18.0`.

* **MAC Address** 🏠: an IP address is not fixed. If a network device is connected to another network, they will have a new IP address. A MAC address is a **unique identifier** to find **who** is this device.

* **Network interface** 📶: this is the logical representation of the network card used to connect to the network. Example: `eth0`.

* **Protocol** 🔐: we define a common language for messages, so that both devices can understand each other. Example: `SSH`.

* **Port** 🐊: this is where <small>(logically)</small> a machine expect a message in a pre-defined protocol. For instance, if a machine receives a message on port `22`, they will expect the protocol to be `SSH`...
</div></div>

<hr class="sep-both">

## IP Addresses and MAC address

<div class="row row-cols-md-2"><div>

#### IP addresses 🌍

An IP address is a unique identifier assigned to each device on a network. It's used to locate a device on the network. There are two kind of IP addresses:

* [IPV4](ip/ipv4.md): a 32 bits address
* [IPV6](ip/ipv6.md): a 128 bits address

There is a shortage of IPV4 since many years, due to the great amount of connected devices, leading to a shift from IPV4 to IPV6.
</div><div>

#### MAC address 🏠

A media access control address (MAC address) is a unique address set by the network interface vendor.

This is a 6-bytes-long address such as `ff:ff:ff:ff:ff:ff` with 12 hexadecimal characters, separated by a colon.

* The first 6 characters are identifying the vendor/manufacturer. This is called a [OUI](http://standards-oui.ieee.org/oui/oui.txt) <small>(Organizationally unique identifier)</small>.
* The last 6 characters are the unique address
</div></div>

<hr class="sep-both">

## Interfaces and ports

<div class="row row-cols-md-2"><div>

#### Interfaces

A **network interface/adapter/card** is a physical component connecting your machine and the network. A **virtual network interface** is the virtual representation of the physical component 📶.

Common (virtual network) interfaces are

* `eth0`, `eth1`... 🧦: for ethernet adapters
* `tun0`, `tun1`... 🪂: for VPN adapters
* `lo` <small>(loopback)</small> 🏡: for the **localhost** virtual network (127.0.0.1)

The loopback interface is used by local applications to share data between themselves, over the localhost network.

**Maximum Transmission Unit (MTU)** 🛂: to avoid data loss, each interface has a maximum size for a packet. The default MTU of `lo` is 65536ko, while for others it is 1500ko. Bigger packets are fragmented.
</div><div>

#### Ports

A port is a virtual messaging channel which is only associated with **one protocol**, such as `22` associated with `SSH`. This association allows a machine to correctly handle a message using the correct protocol.

* 🗃️ There are 65535 <small>(or in short $2^{16}$)</small> available ports
* 🔒 The first 1024 ports are called "well-known/system ports"
* ☘️ Ports 1024 to 49151 are called "registered ports"
* 🍀 Ports 1024 to 49151 are called "dynamic/private ports"

🗺️ List of [TCP/UDP ports](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers) and their protocols.

* 🤔 Protocols can be assigned to another port <small>(security)</small>
* ✅ Ports can be "open", "filtered" <small>(firewall)</small>, and "closed"
* 🍸 A port can, according to the protocol, receive TCP, UDP, or TCP and UDP... messages.
</div></div>

<hr class="sep-both">

## Networking models

<div class="row row-cols-md-2"><div>

#### OSI model

The Open Systems Interconnection (**OSI**) model is a standardized representation of how we could send a message between two machines 🤝. It's made of 7 layers:

* **Layer 7 - Application**: programs are exchanging data
* **Layer 6 - Presentation**: standardize, encrypt, compress
* **Layer 5 - Session**: try to establish a connection
* **Layer 4 - Transport**: select a protocol
* **Layer 3 - Network**: create a packet
* **Layer 2 - Data Link**: resolve MAC
* **Layer 1 - Physical**: binary to signals

A computer generate a message at a layer. The message go down every layer until it's sent 📩. When a computer receives a message, it will go up every layer in reverse order 📖.

Each time a message go down, a header is added. This is called **encapsulation** 📥. When it goes up, it's called **de-encapsulation** 📤.
</div><div>

The **Protocol Data Unit** 📜 (PDU) is generated at each layer. It's both the layer protocol headers, and the previous PDU as the data, which is usually called **payload**.

#### TCP/IP model

The TCP/IP model was introduced before the OSI model, but remains the most used because it's more compact 🤏. It's made of 4 layers:

* **Layer 4 - Application**: Layers 5 to 7 of OSI
* **Layer 3 - Transport**: Layers 4 of OSI <small>(socket, port...)</small>
* **Layer 2 - Internet**: Layers 3 of OSI <small>(IP, ETH...)</small>
* **Layer 1 - Physical**: Layers 1, and 2 of OSI <small>(Wi-Fi, ADsr, ETH...)</small>

➡️ Some are splitting "Layer 1" back into two layers like in OSI, but it's not what's defined in the RFC1122 standard.

➡️ See also the model OSI/TCP/IP.
</div></div>

<hr class="sep-both">

## Protocols

<div class="row row-cols-md-2"><div>

A protocol is a set of instructions formalizing the way of communicating between devices <small>(endianness, floating numbers format, charset, separators, integrity, errors...)</small>.

Each protocol can be represented using a [Message Sequence Chart](https://en.wikipedia.org/wiki/Message_sequence_chart), describing how two machines are interacting using this protocol.

**Layer 7: Application Layer** <small>(data)</small> 🧑

* File transfer 📂: [FTP](../protocols/ftp.md), [SFTP](../protocols/sftp.md), or [SCP](../protocols/scp.md)
* Mail transfer 📫: [SMTP](../protocols/smtp.md), [POP3](../protocols/pop3.md), [IMAP](../protocols/imap.md)
* Web requests 🌍: [HTTP](../protocols/http.md)
* Remote shell access 🧑‍💻: [SSH](../protocols/ssh.md), or [telnet](../protocols/telnet.md)
* Remote desktop access 💻: [RDP](../protocols/rdp.md)
* Domain resolution 📍: [DNS](../protocols/dns.md)
* Network file system 🗃️: [NFS](../protocols/nfs.md), or [Samba](../protocols/samba.md)
* IP addresses lease 🎯: [DHCP](../protocols/dhcp.md)
* Network Management 🧼: [SNMP](../protocols/snmp.md)

</div><div>

**Layer 6: Presentation Layer** <small>(data)</small> 🔒

* [SSL/TLS](../protocols/ssl-tls.md)

**Layer 5: Session Layer** <small>(data)</small> 📶

* [RPC](../protocols/rpc.md)

**Layer 4: Transport Layer** <small>(segment/datagram)</small> 📫

* [TCP](../protocols/tcp.md)
* [UDP](../protocols/udp.md)

**Layer 3: Network Layer** <small>(packets)</small> 🌍

* [ICMP](../protocols/icmp.md)
* [IP](../protocols/ip.md)

**Layer 2: Data Link Layer** <small>(frames)</small> 🔢

* [ARP](../protocols/arp.md)

**Layer 1: Physical Layer** <small>(stream)</small> 💺

* N/A

<br>

➡️ Note that some protocols may operate at multiple layers.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* see SRM notes
* IPV6 EUI64 (texas)

VPN

* Create a secure tunnel allowing devices on different networks to communicate.
* PPP (internal VPNs using public/private key)
* PPTP use PPP, Point-to-Point Tunneling Protocol, allow leave network
* Between two companies/an employee and the company
* remote-site VPN/site-to-site VPN
* Client and server (VPN subnet and ACLs?)

Certification

* 200-301 CCNA ([goffinet](https://cisco.goffinet.org/ccna/))

Network segmentation

* VRFs (Virtual Routing and Forwarding)
</div><div>

Protocols

* IPSec Internet Protocol Security (IPsec) encrypts data using the existing Internet Protocol (IP) framework.

Random

* Streaming network telemetry
* Network Access Control
* [faidherbe](https://www.faidherbe.org/tutoriel/)

Traffic mirroring: See also NetFlow to collect and analyze network traffic data.

Network or protocol analyzers: Wireshark, tcpdump...

**Triple-A model**: Authentication, Authorization, and Accounting. It's a framework to control who can access the network, and what can they do. These are usually implemented by AAA-servers. See the RADIUS or the TACACS+ protocol...
</div></div>