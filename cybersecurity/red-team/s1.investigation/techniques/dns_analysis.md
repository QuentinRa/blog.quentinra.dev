# DNS analysis

<div class="row row-cols-lg-2"><div>

#### Inspect DNS Records

[![footprinting](../../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![passiverecon](../../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

You can examine DNS records using:

* [Sublist3r](/cybersecurity/red-team/tools/enumeration/dns/sublist3r.md)
* [DNSRecon](/cybersecurity/red-team/tools/enumeration/dns/dnsrecon.md) <small>(⚠️, not all usages are passive)</small>
* [TheHarvester](/cybersecurity/red-team/s1.investigation/tools/theHarvester.md)
* [dnsdumpster](https://dnsdumpster.com/) <small>(+subdomains)</small>
* netcraft [searchdns](https://searchdns.netcraft.com/)/[sitereport](https://sitereport.netcraft.com/)
* [viewdns](https://viewdns.info/) <small>(dig)</small>
* VirusTotal [details](https://www.virustotal.com/gui/domain/example.com/details) <small>(dig)</small> + [relations](https://www.virustotal.com/gui/domain/example.com/relations) <small>(+subdomains)</small>
* [domain.glass](https://domain.glass/) <small>(outdated version of VirusTotal)</small>
</div><div>

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