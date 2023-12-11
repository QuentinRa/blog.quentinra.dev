# Subdomains

[Go back](../index.md)

[![subdomainenumeration](../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

<div class="row row-cols-md-2"><div>

As per the [DNS](/operating-systems/networking/protocols/dns.md) protocol, recursive servers are first queried, then the authoritative servers.

Authoritative name servers may be owned by a company. Some companies may have domains for internal use. In such scenario, they will add a record to their nameserver, but not in public DNS records.

These subdomains may be hosted as a [Virtual host](vhosts.md) or not.

Common tools to find <small>(brute force)</small> hidden/non-public subdomains are:

* [gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md#subdomains-brute-force)
* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md#subdomains-brute-force)
* [DNSRecon](../tools/dnsrecon.md)
</div><div>

Common [wordlists](/cybersecurity/red-team/_knowledge/index.md#wordlists-) that can be used are:

* package wordlist: `/usr/share/wordlists/amass/`
* package seclists 📌: `/usr/share/seclists/Discovery/DNS/`

```            
bitquark-subdomains-top100000.txt    italian-subdomains.txt                            subdomains-top1million-110000.txt
combined_subdomains.txt              namelist.txt                                      subdomains-top1million-20000.txt
deepmagic.com-prefixes-top50000.txt  README.md                                         subdomains-top1million-5000.txt
deepmagic.com-prefixes-top500.txt    shubs-stackoverflow.txt                           tlds.txt
dns-Jhaddix.txt                      shubs-subdomains.txt
fierce-hostlist.txt                  sortedcombined-knock-dnsrecon-fierce-reconng.txt
```
</div></div>