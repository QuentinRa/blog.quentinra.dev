# DNS protocol

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

The Domain Name System (DNS) protocol is used to convert a **domain name** such as `example.com` to an IP address `93.184.216.34`. A domain name is for humans, while IP address are for machines 🏭.

🐊️ **Port**: 53 (TCP/UDP)

🔒 The DNS protocol is not secure. See DNS Secure (DNSSEC).

DNS server servers are storing data called **DNS records**. When updated by the domain owner, it's propagated to DNS servers after some time <small>(12 hours, 24 hours, 48 hours, sometimes more)</small>.
</div><div>

There are [multiple type](https://www.ietf.org/rfc/rfc1035.txt) of records for a domain, not just IP addresses:

* **A** 🏠: the IPV4 address of the domain
* **AAAA** 🏡: the IPV6 address of the domain
* **CNAME** ➡️: a domain may point to another
* **MX** ✉️: a domain may have a mail server
* **TXT** ✍️: used to store information, mostly used to verify ownership by third-party websites...
</div></div>

<hr class="sep-both">

## DNS resolution process 📞

<div class="row row-cols-md-2"><div>

DNS nameservers have a tree-like hierarchy starting from the root.

**DNS root** 🌱: the domain "`.`" (dot). Keep track of TLDs.

**Top level domains (TLDs)** 🪵: historically, they where associated with a purpose or a geographical location, but now, there is no restriction.

* Generic TLD <small>(gTLD)</small>: `.com`, `.net`...
* Country Code TLD <small>(ccTLD)</small>: `.fr`, `.ca`...
* Restricted TLD <small>(rTLD)</small>: `.gov`...
* Experimental TLD <small>(eTLD/xTLD)</small>: `.test`...

Each TLD nameserver keep track of its authoritative nameservers.

**Authoritative nameservers** 🌿: they keep track of second-level domains, such as `example.com`, and may keep track of third-level domains <small>(such as www)</small>, or more generically, every subdomain.
</div><div>

#### RFC 1034 approach

The iterative approach mandated by the RFC 1034 is

* A `client` asks for the IP of a domain to the `root nameserver`
* The `root nameserver` replies with the `TLD nameserver`'s IP
* The `client` asks again, but the `TLD nameserver` this time
* The `TLD nameserver` replies with the `authoritative nameserver`'s IP
* The `client` asks again, but the `authoritative nameserver` this time
* The `authoritative nameserver` answer with the IP ✅

In practice, to reduce traffic, and to reduce the load on root servers, DNS records are cached at multiple levels.

#### Caching

Each DNS query has a **Time-to-live (TTL)** <small>(in seconds)</small>. Both the client, and DNS servers will store records until the TTL expires.

A client will usually ask **recursive servers** 🦀 such as the one maintained by their ISP provider. They will look for the IP of the domain requested, using both caching and the RFC 1034 approach.
</div></div>

<hr class="sep-both">

## Fully Qualified Domain Name 🎯

<div class="row row-cols-md-2"><div>

A Fully Qualified Domain Name (FQDN) is a name with both a hostname <small>(subdomain, server...)</small> and a domain name to unambiguous identify a specific domain 🎯.

Given the FQDN `www.example.com`, `www` is the hostname, while `example.com` is the domain name.
</div><div>

👉 All subdomains are written as FQDN.

👉 Any domain ending with `.` (DNS root) is written as a FQDN. For instance, `example.com` is NOT a FQDN, while `example.com.` is.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Multiple domains can point to the same IP address
* DNS zones
* [An Introduction to DNS Terminology, Components, and Concepts
  (digitalocean)](https://www.digitalocean.com/community/tutorials/an-introduction-to-dns-terminology-components-and-concepts)
</div><div>
</div></div>