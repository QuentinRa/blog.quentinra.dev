# Virtual hosts

[![subdomainenumeration](../../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)
[![archangel](../../../../_badges/thm-p/archangel.svg)](https://tryhackme.com/r/room/archangel)
[![teamcw](../../../../_badges/thm-p/teamcw.svg)](https://tryhackme.com/r/room/teamcw)
[![devvortex](../../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![keeper](../../../../_badges/htb-p/keeper.svg)](https://app.hackthebox.com/machines/Keeper)

<div class="row row-cols-lg-2"><div>

In a basic setting, one domain is typically associated with one host. To associate multiple domains with the same host, we use [virtual hosts](https://en.wikipedia.org/wiki/Virtual_hosting).

Webserver such as Apache are using the [HTTP Header](/operating-systems/networking/protocols/http.md#http-headers) **Host** to determine which website the users want to see.

```shell!
$ curl -H 'Host: example.com' example.com       # subdomain
$ curl -H 'Host: vh.example.com' example.com    # vhost
```

When these Virtual Host records <small>(Host to website)</small> are public, they are handled like [subdomains](subdomains.md), but this is not always the case. This is a common technique to hide websites, such as admin or private websites for employees or test websites.

🪤 In CTFs, they could be used to hide a whole different website.
</div><div>

Common tools to find virtual hosts are:

* [gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md#vhost-brute-force)
* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md#vhost-brute-force)

Common wordlists are listed in [wordlists#subdomains](/cybersecurity/red-team/_knowledge/topics/wordlists.md#subdomains)

<br>

**Access from your browser** 📚

Since VHosts are mapped locally on the target webserver, we cannot access it without prior configuration locally.

Edit your local [DNS](/operating-systems/networking/protocols/dns.md#linux-dns-configuration) file, such as `WEBSERVER_IP vh.example.com`.

* `/etc/hosts`
* `c:\windows\system32\drivers\etc\hosts`
</div></div>