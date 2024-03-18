# DNS analysis

[![passiverecon](../../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)
[![footprinting](../../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)

<div class="row row-cols-lg-2"><div>

#### DNS records lookup

You can use the commands [nslookup](/operating-systems/networking/protocols/dns.md#nslookup-ipdomain-lookup)/[dig](/operating-systems/networking/protocols/dns.md#dig-ipdomain-lookup) to query DNS servers. You can also use the website [DNS dumpster](/operating-systems/networking/protocols/dns.md#dnsdumpster-domains-lookup), to find both domains and subdomains.

You can also check [DNSRecon](/cybersecurity/red-team/tools/enumeration/dns/dnsrecon.md), but it's mainly used during discovery.

➡️ Find attack vectors: domains, subdomains, mail servers... They may also expose, with the TXT records, third-party apps and services.

<br>

#### WHOIS

You can use [whois](/operating-systems/networking/protocols/dns.md#whois-domain-registrar-data) to dig for registrar information.

➡️ Find a (human) target to attack.
</div><div>

#### Certificate Transparency (CT)

[![subdomainenumeration](../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

Another popular way to find subdomains is to study the generated certificate. A SSL certificate is generate for usually multiple domains, so we may find subdomains or other domains like this.

See [SSL Tools](/operating-systems/networking/protocols/ssl-tls.md#find-certificates-given-a-domain) such as `crt.sh`.

➡️ Find attack vectors: subdomains or other domains. 
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* netcraft [search DNS](https://searchdns.netcraft.com/) or [sitereport](https://sitereport.netcraft.com)
* [virus total domain details](https://www.virustotal.com/gui/domain/example.com/details) (+Relations tab)
* [domain.glass](https://domain.glass/)
* [viewdns](https://viewdns.info/)
</div><div>

* [Sublist3r](https://github.com/aboul3la/Sublist3r)
* [subfinder](https://github.com/projectdiscovery/subfinder)

```ps
$ sudo apt install subfinder
$ subfinder -d example.com
```
</div></div>