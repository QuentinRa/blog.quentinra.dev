# DNS analysis

[![passiverecon](../../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)
[![footprinting](../../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)

<div class="row row-cols-lg-2"><div>

By examining [DNS](/operating-systems/networking/protocols/dns.md) records and certificates issued for a domain, we can passively learn about:

* 🗺️ Public domains and subdomains used by the company
* 📮 Mail Server configuration through MX records
* ✍️ Externally connected apps through TXT records
* 🧑 Targets for social engineering attacks
* 🛣️ Servers and IP ranges
* ...

#### Inspect DNS Records

You can examine DNS records using:

* [nslookup](/operating-systems/networking/protocols/dns.md#nslookup-ipdomain-lookup)
* [dig](/operating-systems/networking/protocols/dns.md#dig-ipdomain-lookup)
* [DNS dumpster](/operating-systems/networking/protocols/dns.md#dnsdumpster-domains-lookup)
* [DNSRecon](/cybersecurity/red-team/tools/enumeration/dns/dnsrecon.md) <small>(⚠️, not all usages are passive)</small>
* netcraft [searchdns](https://searchdns.netcraft.com/)/[sitereport](https://sitereport.netcraft.com/)
* [domain.glass](https://domain.glass/)
</div><div>

#### Inspect Registrar Information

You can find social engineering information using:

* [whois](/operating-systems/networking/protocols/dns.md#whois-domain-registrar-data)
* [netcraft](https://sitereport.netcraft.com/)
* [domain.glass](https://domain.glass/)

<br>

#### Inspect IP Ranges

Find which IP ranges are owned by a company:

* [netcraft](https://sitereport.netcraft.com/)

<br>

#### Certificate Transparency (CT)

[![subdomainenumeration](../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

Another popular way to find subdomains is to study the generated certificate. A SSL certificate is generate for usually multiple domains, so we may find subdomains or other domains like this.

See [SSL Tools](/operating-systems/networking/protocols/ssl-tls.md#find-certificates-given-a-domain) such as `crt.sh`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [virus total domain details](https://www.virustotal.com/gui/domain/example.com/details) (+Relations tab)
* [Sublist3r](https://github.com/aboul3la/Sublist3r)
* [subfinder](https://github.com/projectdiscovery/subfinder)

```ps
$ sudo apt install subfinder
$ subfinder -d example.com
```
</div><div>
</div></div>