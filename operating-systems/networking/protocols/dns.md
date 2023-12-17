# DNS protocol

[![dnsindetail](../../../cybersecurity/_badges/thm/dnsindetail.svg)](https://tryhackme.com/room/dnsindetail)
[![wireshark](../../../cybersecurity/_badges/thmp/wireshark.svg)](https://tryhackme.com/room/wireshark)

<div class="row row-cols-lg-2"><div>

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
* See also [Wikipedia Reference](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
</div></div>

<hr class="sep-both">

## DNS resolution process 📞

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

A Fully Qualified Domain Name (FQDN) is a name with both a hostname <small>(subdomain, server...)</small> and a domain name to unambiguous identify a specific domain 🎯.

Given the FQDN `www.example.com`, `www` is the hostname, while `example.com` is the domain name.
</div><div>

👉 All subdomains are written as FQDN.

👉 Any domain ending with `.` (DNS root) is written as a FQDN. For instance, `example.com` is NOT a FQDN, while `example.com.` is.
</div></div>


<hr class="sep-both">

## DNS Internals

[![dnsenumerationusingpython](../../../cybersecurity/_badges/htb/dnsenumerationusingpython.svg)](https://academy.hackthebox.com/course/preview/dns-enumeration-using-python)

<div class="row row-cols-lg-2"><div>

DNS mainly use [UDP](/operating-systems/networking/protocols/udp.md) for DNS queries, while it mainly use [TCP](/operating-systems/networking/protocols/tcp.md) for zone transfers or large responses. With IPV6/DNSSEC, TCP seems to be more and more used for queries too.

A DNS zone represents a portion of the domain records that the DNS server manages. DNS records are stored in zone files.

* **Primary zones** 🌹: authoritative source for the DNS information
* **Secondary zones** 🌿: read-only copies of the DNS records

The primary DNS servers are transferring changes to secondary DNS servers using what we call "Zone Transferts." There are two types of zone transfers: `AXFR` and `IXFR`.
</div><div>

...
</div></div>

<hr class="sep-both">

## DNS vulnerabilities ☠️

<div class="row row-cols-lg-2"><div>

* **Open DNS resolvers** <small>(DNS allowing everyone to poll data)</small>

👉 An attacker can use them to amplify DDoS attacks. 💥 DDoS ➡️ Configure DNS to not respond to everyone, use rate-limiting.

* **Stealthy DNS attacks**

👉 An attacker attempt to secretly alter a DNS records <small>(ex: redirect to a malicious site)</small> ➡️ See DNSSEC.

* **DNS cloaking attacks**

👉 An attacker create malicious subdomains to a compromised domain ➡️ Monitor unauthorized DNS changes, DNS pinning...
</div><div>

* **DNS Cache poisoning**

👉 An attacker tries to send a reply to a DNS query before the DNS nameservers. The hacker much match the correct timing <small>(caching...)</small> and the correct query ID, which is relatively complicated. 💥 See the Kaminsky Cache poisoning attack (2008).

* **DNS tunneling attacks**

👉 Use the DNS protocol to send malicious payload in DNS query to bypass firewalls/... ➡️ DNS firewalls...
</div></div>

<hr class="sep-both">

## DNS commands

<div class="row row-cols-lg-2"><div>

#### `dig`: ip/domain lookup

[![introtonetworking](../../../cybersecurity/_badges/thm/introtonetworking.svg)](https://tryhackme.com/room/introtonetworking)

You can give a domain name, or an IP (`-x`).

```ps
$ dig example.com
$ dig -x 8.8.8.8
```

You can pick which DNS server should be used with `@` 

* Cloudflare DNS servers: `1.1.1.1`
* Google DNS servers: `8.8.8.8` OR `8.8.4.4`
* ...

```ps
$ dig example.com @8.8.8.8
```

We can explicitly ask for some data by using the option `-t`

```shell!
$ dig example.com -t A
;; ANSWER SECTION:
example.com.    0  IN     A  93.184.216.34
$ dig example.com -t AAAA
;; ANSWER SECTION:
example.com.    0  IN  AAAA 2606:2800:220:1:248:1893:25c8:1946
```

You can also add options: `+stats +trace +nodnssec`.
</div><div>

#### `nslookup`: ip/domain lookup

This tool is quite similar to dig.

```ps
# A = IPV4, AAAA=IPV6, MX, TXT, CNAME...
$ nslookup -type=A example.com
# ask 1.1.1.1 DNS server
$ nslookup -type=A example.com 1.1.1.1
```

#### `dnsdumpster`: domains lookup

[dnsdumpster](https://dnsdumpster.com/) is a website to fetch DNS records, for both a domain, and its subdomains.

#### `whois`: domain registrar data

[![introtonetworking](../../../cybersecurity/_badges/thm/introtonetworking.svg)](https://tryhackme.com/room/introtonetworking)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day3.svg)](https://tryhackme.com/room/adventofcyber4)

You can also use [their website](https://www.whois.com/whois/) or [domaintools](https://whois.domaintools.com/).

```ps
$ whois example.com
$ whois 8.8.8.8
```

➡️ You can also query the [ICANN](https://lookup.icann.org/en) or [who.is](https://who.is/).
</div></div>

<hr class="sep-both">

## Linux DNS Configuration

<div class="row row-cols-lg-2"><div>

On Linux, the operating system will first try to resolve a domain using `/etc/hosts` before testing an external DNS server.

```text!
SOME_IP example.com
SOME_IP admin.example.com test.example.com
```

You can add an entry using:

```shell!
$ sudo sh -c 'echo "SOME_IP my.example.com" >> /etc/hosts'
```
</div><div>

The file `/etc/resolv.conf` is used to determine which nameserver is used to resolve domains, along other settings.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Multiple domains can point to the same IP address
* DNS zones
* [An Introduction to DNS Terminology, Components, and Concepts
  (digitalocean)](https://www.digitalocean.com/community/tutorials/an-introduction-to-dns-terminology-components-and-concepts)
* DNS poisoning
* DNS relay
* DOT (DNS Over TLS)
* DNSSEC (HTB/27180)
</div><div>

Purchase domain names

* [namecheap](https://nc.me/)
* [name.com](https://www.name.com/)
* [instantdomainsearch](https://instantdomainsearch.com/)
* [gositestat](https://www.gositestat.com/) / [statshow](https://www.statshow.com/)
* [dnsimple](https://dnsimple.com/) <small>(dns)</small>
* [WWW2](https://en.wikipedia.org/wiki/Subdomain#Server_cluster)
</div></div>