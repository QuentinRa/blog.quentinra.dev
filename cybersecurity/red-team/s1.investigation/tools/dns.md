# DNS analysis

<div class="row row-cols-md-2"><div>

#### DNS records lookup

You can use the commands `nslookup`/`dig` to query DNS servers.

```bash
# A = IPV4, AAAA=IPV6, MX, TXT, CNAME...
$ nslookup -type=A example.com
$ dig example.com -t A
# ask 1.1.1.1 DNS server
$ nslookup -type=A example.com 1.1.1.1
$ dig example.com -t A @1.1.1.1
```
</div><div>

#### WHOIS

You can use [whois](https://www.whois.com/whois/) website, or their command, to dig for information about the owner of a domain name, their registrar information...

```bash
$ whois google.fr
$ whois 8.8.8.8
```
</div></div>