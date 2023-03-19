# DNS protocol

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

The Domain Name System (DNS) protocol is used to convert a **domain name** such as `example.com` to an IP address `93.184.216.34`. A domain name is for humans, while IP address are for machines 🏭.

🔒 The DNS protocol is not secure. See DNS Secure (DNSSEC).

DNS server servers are storing data called **DNS records**. When updated by the domain owner, it's propagated to DNS servers after some time <small>(12 hours, 24 hours, 48 hours, sometimes more)</small>.
</div><div>

There are multiple type of records for a domain, not just IP addresses:

* **A** 🏠: the IPV4 address of the domain
* **AAAA** 🏡: the IPV6 address of the domain
* **CNAME** ➡️: a domain may point to another
* **MX** ✉️: a domain may have a mail server
* **TXT** ✍️: used to store information, mostly used to verify ownership by third-party websites...
</div></div>

<hr class="sr">

## Fully Qualified Domain Name (FQDN)

<div class="row row-cols-md-2"><div>

A **Fully Qualified Domain Name (FQDN)** is a both a hostname <small>(subdomain, server...)</small> and a domain name to unambiguous identify a specific domain 🎯.

Given the FQDN `www.example.com`, `www` is the hostname, while `example.com` is the domain name.
</div><div>

👉 All subdomains are written as FQDN.

👉 Any domain ending with `.` (DNS root) is written as a FQDN. For instance, `example.com` is NOT a FQDN, while `example.com.` is.

➡️ It's more of a technical term, rather than a "practical" term.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Multiple domains can point to the same IP address.
</div><div>

When a computer requests the IP associated with a domain name

<details class="details-n">
<summary>1. It will check if there is the answer in the cache</summary>

DNS records are stored in the cache for a duration determined by their **Time-to-live (TTL)** <small>(in seconds)</small> which is sent along the IP when requesting a DNS record.
</details>

<details class="details-n">
<summary>2. If not cached, it will ask a <b>recursive DNS server</b></summary>

Your internet provider (ISP) maintains its own recursive servers.

The **root domain** is "`.`", and its servers are keeping track of the IP addresses of the **Top level domain (TLD)** servers.

* Generic Top Level (gTLD): `.com`, `.net`...
* Country Code Top Level Domain (ccTLD): `.fr`, `.ca`...

Historically, gTLD were used to indicate a purpose <small>(ex: com for commercial)</small>, and ccTLD were used for geographical purposes. There is also Restricted TLD, and Experimental TLD.

TLD are keeping track of servers one-level down: **Authoritative name servers**, also called **nameserver**, in which DNS records are stored, mostly for **Second-Level Domain**, such as `example.com`. They may keep track of Third-Level Domains <small>(such as www)</small>, or even every Subdomain <small>(any third-level domain, and below)</small>.

DNS records include IPV4 (A), and IPV6 addresses (AAAA), along mail servers (MX), CNAME records <small>(ask another domain)</small>, TXT RECORDS <small>(mainly used to ensure ownership of a domain by third-parties websites)</small>... See [rfc1035 specification](https://www.ietf.org/rfc/rfc1035.txt).
</details>

<details class="details-n">
<summary>RFC 1034 approach</summary>

The iterative approach mandated by the RFC 1034 is

* A client is asking for the IP of `www.example.com` to the root server `.`
* The root server tells him to ask `.com`, and give the IP of `.com`
* The client asks `.com`, which answers with the IP of `example.com`
* The client asks `example.com`, which answers with the IP we were looking for

In practice, to reduce traffic, and not put pressure on the root servers, DNS records are cached.
</details>

See also: [An Introduction to DNS Terminology, Components, and Concepts
(digitalocean)](https://www.digitalocean.com/community/tutorials/an-introduction-to-dns-terminology-components-and-concepts)
</div></div>