# DNS analysis

<div class="row row-cols-lg-2"><div>

By examining [DNS](/operating-systems/networking/protocols/dns.md) records and certificates issued for a domain, we can passively learn about:

* 🗺️ Public domains and subdomains used by the company
* 📮 Mail Server configuration through MX records
* ✍️ Externally connected apps through TXT records
* 🧑 Targets for social engineering attacks
* 🛣️ Servers and IP ranges
* ...

#### Inspect DNS Records

[![footprinting](../../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![passiverecon](../../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

You can examine DNS records using:

* [nslookup](/operating-systems/networking/protocols/dns.md#nslookup-ipdomain-lookup)
* [dig](/operating-systems/networking/protocols/dns.md#dig-ipdomain-lookup)
* [subfinder](/cybersecurity/red-team/tools/enumeration/dns/subfinder.md)
* [Sublist3r](/cybersecurity/red-team/tools/enumeration/dns/sublist3r.md)
* [DNSRecon](/cybersecurity/red-team/tools/enumeration/dns/dnsrecon.md) <small>(⚠️, not all usages are passive)</small>
* [TheHarvester](/cybersecurity/red-team/s1.investigation/tools/theHarvester.md)
* [dnsdumpster](https://dnsdumpster.com/) <small>(+subdomains)</small>
* netcraft [searchdns](https://searchdns.netcraft.com/)/[sitereport](https://sitereport.netcraft.com/)
* [viewdns](https://viewdns.info/) <small>(dig)</small>
* VirusTotal [details](https://www.virustotal.com/gui/domain/example.com/details) <small>(dig)</small> + [relations](https://www.virustotal.com/gui/domain/example.com/relations) <small>(+subdomains)</small>
* [domain.glass](https://domain.glass/) <small>(outdated version of VirusTotal)</small>
</div><div>

#### Inspect Registrar Information

[![footprinting](../../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![passiverecon](../../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

You can find social engineering information using:

* [whois](/operating-systems/networking/protocols/dns.md#whois-domain-registrar-data)
* [netcraft](https://sitereport.netcraft.com/)
* [domain.glass](https://domain.glass/)
* [viewdns](https://viewdns.info/)

<br>

#### Inspect IP Ranges

[![active_directory_enumeration_attacks](../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

Find which IP ranges are owned by a company:

* [arin](https://www.arin.net/resources/) (US) and [ripe](https://www.ripe.net/) (EU)
* [BGP Toolkit](https://bgp.he.net/)
* [netcraft](https://sitereport.netcraft.com/)

<br>

#### Certificate Transparency (CT)

[![footprinting](../../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![passiverecon](../../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)
[![subdomainenumeration](../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

Another popular way to find subdomains is to study the generated certificate. A SSL certificate is generate for usually multiple domains, so we may find subdomains or other domains like this.

* [SSL Tools](/operating-systems/networking/protocols/ssl-tls.md#find-certificates-given-a-domain) such as `crt.sh`
* [TheHarvester](/cybersecurity/red-team/s1.investigation/tools/theHarvester.md)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [knock](https://github.com/guelfoweb/knock/) <small>(passive or brute force python tool)</small>
</div><div>
</div></div>