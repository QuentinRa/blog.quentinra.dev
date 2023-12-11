# Virtual hosts

[Go back](../index.md)

[![subdomainenumeration](../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

<div class="row row-cols-md-2"><div>

A same webserver can be used to host multiple sites. Each site is identified by a domain, such as `test.example.com`. When we request a website, we need the **IP** of the webserver, and a **domain name**.

As we don't usually know the IP, there are [DNS](/operating-systems/networking/protocols/dns.md) servers mapping a domain to an IP. Once we found the IP, the HTTP request is similar to:

```bash!
$ telnet SOME_IP_YOU_FOUND 80 # tell the webserver at IP
[...]
Host: test.example.com # we want to see test.example.com
[...]
```

Mapping from a domain to a website are done locally using what we call **virtual hosts**. Based on `Host:` the correct website is shown.

🤔 What if a domain does not exist on a DNS server <small>(i.g. no one know such a domain exist)</small>, but there is a mapping from a domain to a website locally <small>(i.g. using the domain in Host: returns a website)</small>? No one can access it, unless they have the IP, and they provide the Host manually.
</div><div>

🎁 This is a common technique to hide websites, for instance, admin or private websites for employees, test websites...

🪤 In CTFs, they could be used to hide a whole different website.

To avoid manually edit the Host, users will usually add a "DNS record" on their machine in their host file, mapping the domain to the IP.

* `/etc/hosts`
* `c:\windows\system32\drivers\etc\hosts`

Common tools to find <small>(brute force)</small> virtual hosts are:

* [gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md#vhost-brute-force)
* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md#vhost-brute-force)

Common [wordlists](/cybersecurity/red-team/_knowledge/index.md#wordlists-) that can be used are the same as for [Subdomains](subdomains.md).
</div></div>