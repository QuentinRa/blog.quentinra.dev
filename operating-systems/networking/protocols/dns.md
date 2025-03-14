# DNS protocol

[![dnsindetail](../../../cybersecurity/_badges/thm/dnsindetail.svg)](https://tryhackme.com/room/dnsindetail)
[![wireshark](../../../cybersecurity/_badges/thmp/wireshark.svg)](https://tryhackme.com/room/wireshark)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

The Domain Name System (DNS) protocol is used to convert a **domain name** such as `example.com` to an IP address `93.184.216.34`. A domain name is for humans, while IP address are for machines 🏭.

🐊️ **Port**: 53 (TCP/UDP)

🔒 The DNS protocol is not secure. See DNS Secure (DNSSEC). See also: DNS over TLS <small>(DoT)</small> or DNS over HTTPS <small>(DoH)</small> or DNSCrypt.

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

## DNS Zones & Zone Transfer

[![dnsenumerationusingpython](../../../cybersecurity/_badges/htb/dnsenumerationusingpython.svg)](https://academy.hackthebox.com/course/preview/dns-enumeration-using-python)
[![web_information_gathering](../../../cybersecurity/_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

<div class="row row-cols-lg-2"><div>

DNS mainly use [UDP](/operating-systems/networking/protocols/udp.md) for DNS queries, while it mainly use [TCP](/operating-systems/networking/protocols/tcp.md) for zone transfers or large responses. With IPV6/DNSSEC, TCP seems to be more and more used for queries too.

A DNS zone represents a portion of the domain records that the DNS server manages. DNS records are stored in zone files <small>(BIND format)</small>.

* **Primary zones** 🌹: authoritative source for the DNS information
* **Secondary zones** 🌿: read-only copies of the DNS records

The primary DNS servers are transferring changes to secondary DNS servers using what we call "Zone Transferts." There are two types of zone transfers: `AXFR` and `IXFR`.

⚠️ On Misconfigured DNS servers <small>(no authentication/no list of trusted hosts/no RNDC Key)</small>, we may be able to query the whole zone file.
</div><div>

You can try it [online](https://hackertarget.com/zone-transfer/) or with [zonetransfer.me](https://digi.ninja/projects/zonetransferme.php). We usually find a lot of domains during [enumeration](#enumeration). We may then try AXFR on each. 

```ps
# select the domain that you want to "fetch"
# from the primary dns server
$ dig axfr some_domain.com @primary_dns_server
# return a list, we may then try axfr in each return item
# it it doesn't work, we can try brute forcing
```

I encountered one scenario in which the subdomain wasn't returning any records, which fooled every tool, while it was vulnerable to AXFR.

You can use [onectf](/cybersecurity/red-team/tools/frameworks/onectf/index.md#onectf-axfr-module) for AXFR brute forcing given a list of subdomains.

```ps
$ onectf axfr -D example.com -r IP -w wordlist.txt -t 64
```
</div></div>

<hr class="sep-both">

## DNS commands

<div class="row row-cols-lg-2"><div>

#### `dig`: ip/domain lookup

[![introtonetworking](../../../cybersecurity/_badges/thm/introtonetworking.svg)](https://tryhackme.com/room/introtonetworking)
[![web_information_gathering](../../../cybersecurity/_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![dns_zone_transfert](../../../cybersecurity/_badges/rootme/network/dns_zone_transfert.svg)](https://www.root-me.org/en/Challenges/Network/DNS-zone-transfert)

You can give a domain name, or an IP (`-x`). The request type `ANY` is deprecated since RFC8482 ⚠️.

```ps
$ dig example.com
$ dig A example.com       # IPV4 records
$ dig example.com -t A    # same
$ dig example.com -t ANY  # every record
$ dig -x 8.8.8.8
$ dig [...] -p port
```

You can pick which DNS server should be used with `@` 

* Cloudflare DNS servers: `1.1.1.1`
* Google DNS servers: `8.8.8.8` OR `8.8.4.4`
* ...

```ps
$ dig example.com @8.8.8.8
```

Some examples of `dig` command output:

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

#### `host`: domain lookup

The `host` command is very similar to `dig`.

```ps
$ host -t ANY example.com
example.com has address <IPV4>
example.com has XXX record [...]
example.com has IPv6 address <IPV6>
example.com name server a.iana-servers.net.
$ host -v -t ANY example.com
# similar output as dig
```

#### `nslookup`: ip/domain lookup

This tool is quite similar to dig.

```ps
# A = IPV4, AAAA=IPV6, MX, TXT, CNAME...
$ nslookup -type=A example.com
# ask 1.1.1.1 DNS server
$ nslookup -type=A example.com 1.1.1.1
```

#### `whois`: domain registrar data

[![introtonetworking](../../../cybersecurity/_badges/thm/introtonetworking.svg)](https://tryhackme.com/room/introtonetworking)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day3.svg)](https://tryhackme.com/room/adventofcyber4)

You can also use [their website](https://www.whois.com/whois/) or [domaintools](https://whois.domaintools.com/). Whois is a protocol using port 43. Use [sysinternals whois](https://docs.microsoft.com/en-gb/sysinternals/downloads/whois) on Windows.

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

The file `/etc/resolv.conf` is used to determine which nameserver is used to resolve domains, along other settings.
</div><div>

You can also use [onectf](/cybersecurity/red-team/tools/frameworks/onectf/index.md#onectf-hosts-module) to easily manage entries:

```shell!
$ sudo onectf hosts IPA example.com aaa.example.com
IPA example.com aaa.example.com
$ sudo onectf hosts IPB example.com
IPA aaa.example.com
IPB example.com
```
</div></div>

<hr class="sep-both">

## DNS Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Enumeration

Refer to [DNS investigation](/cybersecurity/red-team/s1.investigation/index.md#discovering-information--dns-records--registrar) to find targets.

Refer to [Subdomains](/cybersecurity/red-team/s2.discovery/techniques/websites/subdomains.md)/[vhosts](/cybersecurity/red-team/s2.discovery/techniques/websites/vhosts.md) to look for hidden subdomains.

You can use [onectf axfr](#dns-zones--zone-transfer) as introduced in the AXFR section to find hidden subdomains accepting zone transfer.

* [fierce](https://github.com/mschwager/fierce) <small>(1.7k ⭐)</small> can be used for AXFR and other attacks.

```ps
$ fierce --domain zonetransfer.me
$ fierce --domain xxx.yyy --dns-servers IP
# error for internal domain using AXFR
```

#### Exploitation

* **Domain Takeover**: an existing record points to a deleted domain. If the hackers can purchase it, then may perform social engineering attacks <small>(or more advanced attacks)</small>. [can-i-take-over-xyz](https://github.com/EdOverflow/can-i-take-over-xyz) <small>(5.1k ⭐)</small>

* **DNS Rebinding**: refer to SSRF Mitigations for notes.
</div><div>

#### Well-Known Attacks

* **Open DNS resolvers** <small>(DNS allowing everyone to poll data)</small>

👉 An attacker can use them to amplify DDoS attacks. 💥 DDoS ➡️ Configure DNS to not respond to everyone, use rate-limiting.

* **Stealthy DNS attacks**

👉 An attacker attempt to secretly alter a DNS records <small>(ex: redirect to a malicious site)</small> ➡️ See DNSSEC.

* **DNS cloaking attacks**

👉 An attacker create malicious subdomains to a compromised domain ➡️ Monitor unauthorized DNS changes, DNS pinning...

* **DNS Cache poisoning**/**DNS Spoofing**

👉 An attacker tries to send a reply to a DNS query before the DNS nameservers. The hacker much match the correct timing <small>(caching...)</small> and the correct query ID, which is relatively complicated. 💥 See the Kaminsky Cache poisoning attack (2008).

* **DNS tunneling attacks**

👉 Use the DNS protocol to send malicious payload in DNS query to bypass firewalls/... ➡️ DNS firewalls...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* DNSSEC (HTB/27180)
* Multiple domains can point to the same IP address
* Caching DNS Server
* Forwarding/Relay Server
* 3 configs (local DNS, reverse DNS, zone file)
* `c:\windows\system32\drivers\etc\hosts`
* [dnsspoof](https://github.com/DanMcInerney/dnsspoof)
</div><div>

* Record Classes (Internet, Hesiod, Chaos)
* `dig CH TXT version.bind IP`: CHAOS query
* Bind9

```shell!
$ dig axfr domain @IP > /tmp/list.dig
$ cat /tmp/list.dig | column -t | cut -d ' ' -f1 | grep '\.' | sed 's/\.$//' > /tmp/list.dig.clean
$ cat /tmp/list.dig.clean | while read x ; do dig ANY $x ; done > /tmp/domains.dig
$ grep -v '^;' /tmp/domains.dig | grep -v '^$' > /tmp/domains.dig.clean
```
</div></div>