# Host discovery

...

<hr class="sl">

## Nessus vulnerability scanner

<div class="row row-cols-md-2"><div>

**Nessus vulnerability scanner** is a tool to find, and report vulnerabilities.

* [Download Nessus](https://www.tenable.com/downloads/nessus)

```bash
$ sudo dpkg -i  Nessus-10.3.0-ubuntu1404_amd64.deb
$ sudo systemctl start nessusd.service
```

* Open `https://localhost:8834/`
* [You will need an activation code](https://www.tenable.com/products/nessus/nessus-essentials)
</div><div>

Once you are logged on the website, you can create new scans.

* **Host Discovery**: find alive hosts
* **Basic network scan**: sort of nmap
    * Set a target
    * In Discovery, you can select a range of ports
    * In Assessment, you can select the kind of scan
    * In Advanced, you may go for a "low bandwidth scan"
    * **Launch**: explore vulnerabilities to see results
* **Web application test**: see vulnerabilities in your web app
</div></div>

<hr class="sr">

## nmap

<div class="row row-cols-md-2"><div>

**nmap** ([nmap book](https://nmap.org/book/)) is a tool to detect hosts, their open ports, and eventually run script trying to go more information, or even exploiting a vulnerability to gain access.

> There is an interface to `nmap` called [ZenMap](https://nmap.org/zenmap/).
</div><div>

A port is used by a protocol such as FTP (File Transfer Protocol) to transfer data. There are $2^{16}$ ports, while the first 1024 are restricted, and can only be used by standard protocols. A port can be changed. Look for **vulnerable ports** on Google. A port can be

* `open`: can be reached
* `filtered`: no response, usually meaning that it's filtered by a firewall
* `closed`: cannot be reached
</div></div>

Nmap can do multiple **scans** with `-s<type>`, and it's up to you to pick the "right" one according to your case, and what you are looking for, along with the constraints that you may have.

<div class="row row-cols-md-2"><div>

**TCP scans** are scans used to **detect TCP ports**, meaning port used by a protocol using the connection-based protocol TCP. TCP is a protocol in which every message send, is followed by a reply, and an acknowledgement of receiving the reply. This is slower than UDP, but, it allows us to ensure that a message is received.

*  **TCP Scan** | `-sT`. Default scan if not root. Usually blocked by firewalls. Send a SYN packet, receive RST (closed), or SYN/ACK (open). If the later, answer back with ACK (3-ways handshake).

* **Syn (Half-open/Stealth) Scan** | `-sS` | `Need root privileges`. Default scan in root. Same as TCP scan, but don't answer "ACK", but "RST" instead. Sightly faster than `-sT`.

</div><div>

**UDP Scans** are scans used to **detect UDP ports**, meaning ports using the UDP connection-less protocol, in which a message is sent, with no reply, and without care if the message was received or not, corrupted or not.... This is quite faster than TCP.

* **UDP Scan** | `-sU` | `Need root privileges`. The scan is slow as UDP ports may only respond if they are closed (with a PING/ICMP), so the scan must send multiple requests, to ensure that the port isn't closed, as there is no way to ensure that the port is open, so they are usually marked as "open|filtered".
</div></div>