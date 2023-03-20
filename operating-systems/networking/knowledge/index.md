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

...
</div><div>

...
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
</div><div>

#### Ports

A port is a virtual messaging channel which is only associated with **one protocol**, such as `22` associated with `SSH`. This association allows a machine to correctly handle a message using the correct protocol.

* 🗃️ There are 65535 <small>(or in short $2^{16}$)</small> available ports

* 🔒 The first 1024 ports are called "standard ports"

* 🗺️ List of [TCP/UDP ports](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers) and their protocols

* 🤔 Protocols can be assigned to another port <small>(security)</small>

* ✅ Ports can be "open", "filtered" <small>(firewall)</small>, and "closed"
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
</div><div>

Each time a message go down, a header is added. This is called **encapsulation** 📥. When it goes up, it's called **de-encapsulation** 📤.

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

* [File transfer](../protocols/file-transfer.md): FTP, SFTP, SCP
* [Mail transfer](../protocols/mail-transfer.md): SMTP, POP3, IMAP
* [Web requests](../protocols/web-requests.md): HTTP, HTTPS
* [Remote shell access](../protocols/remote-shell.md): SSH, telnet
* [Remote desktop access](../protocols/remote-desktop.md): RDP
* [Domain resolution](../protocols/dns.md): DNS
* [Network file system](../protocols/file-system.md): NFS, Samba
* [IP addresses lease](../protocols/dhcp.md): DHCP
* [Network Management](../protocols/snmp.md): SNMP

</div><div>

**Layer 6: Presentation Layer** <small>(data)</small> 🔒

* SSL/TLS

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

* [Old](_old.md)
* [Old - Commands](../commands/linux/index.md)
* [Old - Security](../security/index.md)
* see SRM notes
</div><div>

Network

* E/W = between two apps
* N/S = with the internet
* Firewall => NGFW AMP Duo Email ISE Umbrella Enpoint Web Workload Services
* Cloud FW/SASE
* segmentation
</div></div>