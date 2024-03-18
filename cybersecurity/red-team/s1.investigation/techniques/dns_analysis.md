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
* [subfinder](/cybersecurity/red-team/tools/enumeration/dns/subfinder.md)
* [Sublist3r](/cybersecurity/red-team/tools/enumeration/dns/sublist3r.md)
* [DNSRecon](/cybersecurity/red-team/tools/enumeration/dns/dnsrecon.md) <small>(⚠️, not all usages are passive)</small>
* [TheHarvester](tools/theHarvester.md)
* [dnsdumpster](https://dnsdumpster.com/) <small>(+subdomains)</small>
* netcraft [searchdns](https://searchdns.netcraft.com/)/[sitereport](https://sitereport.netcraft.com/)
* [viewdns](https://viewdns.info/) <small>(dig)</small>
* VirusTotal [details](https://www.virustotal.com/gui/domain/example.com/details) <small>(dig)</small> + [relations](https://www.virustotal.com/gui/domain/example.com/relations) <small>(+subdomains)</small>
* [domain.glass](https://domain.glass/) <small>(outdated version of VirusTotal)</small>
</div><div>

#### Inspect Registrar Information

You can find social engineering information using:

* [whois](/operating-systems/networking/protocols/dns.md#whois-domain-registrar-data)
* [netcraft](https://sitereport.netcraft.com/)
* [domain.glass](https://domain.glass/)
* [viewdns](https://viewdns.info/)

<br>

#### Inspect IP Ranges

Find which IP ranges are owned by a company:

* [netcraft](https://sitereport.netcraft.com/)

<br>

#### Certificate Transparency (CT)

[![subdomainenumeration](../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

Another popular way to find subdomains is to study the generated certificate. A SSL certificate is generate for usually multiple domains, so we may find subdomains or other domains like this.

*  [SSL Tools](/operating-systems/networking/protocols/ssl-tls.md#find-certificates-given-a-domain) such as `crt.sh`
* [TheHarvester](tools/theHarvester.md)
</div></div>