# Subdomains

[![subdomainenumeration](../../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

<div class="row row-cols-lg-2"><div>

As explained in the [DNS](/operating-systems/networking/protocols/dns.md) protocol, we use the term 'subdomain' to refer to the third-level domains and onward.

* `www.example.com`
* `ftp.internal.example.com`
* `test.webapp.dev.example.com`
* ...

Unlike [vhosts](vhosts.md), they are stored on a DNS server, which are often public, or accessible from the internal network to everyone.
</div><div>

Common tools to find subdomains are:

* [gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md#subdomains-brute-force)
* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md#subdomains-brute-force)
* [DNSRecon](../tools/dnsrecon.md)
* [dnsenum](../tools/dnsenum.md)

Common wordlists are listed in [wordlists#subdomains](/cybersecurity/red-team/_knowledge/topics/wordlists.md#subdomains)
</div></div>