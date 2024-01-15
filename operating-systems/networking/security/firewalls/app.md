# Applicative firewall

[Go back](../_knowledge/index.md#firewalls)

<div class="row row-cols-lg-2"><div>

Applicative firewall operate at the layer 7 of the OSI model. It's designed to protect application or services from attacks. For instance, they could be set up to protect

* a database from [SQL Injection](/cybersecurity/red-team/s3.exploitation/vulns/injection/sqli.md) (SQLi)
* a website from [XSS](/cybersecurity/red-team/s3.exploitation/vulns/web/xss.md)
* ...
</div><div>

Web Application Firewalls (**WAF**) are a category of application firewall focused on attacks against web applications such as XSS or SQLi.

➡️ [ModSecurity](https://github.com/SpiderLabs/ModSecurity) (6.3k ⭐) is an open-source WAF.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [identYwaf](https://github.com/stamparm/identYwaf)
* `Cloudflare`, `Fortinet`, `Imperva`...
* [wafw00f](https://github.com/EnableSecurity/wafw00f) (WAF fingerprinting tool)

```ps
$ sudo apt install wafw00f -y
$ wafw00f -v example.com
```
</div><div>
</div></div>