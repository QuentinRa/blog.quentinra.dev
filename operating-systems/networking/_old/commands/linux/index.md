# Linux networking commands

<div class="row row-cols-md-2 mt-4"><div>
</div><div>
<details class="details-e">
<summary><code>dig</code>: IP to name, name to IP</summary>

You can give a domain name, or an IP (`-x`).

```bash
# Name
$ dig example.com
# IP
$ dig -x 8.8.8.8
```

Domain name resolution is done by asking a **DNS server**. You can pick which DNS server should be used with `@` (1.1.1.1, 8.8.8.8/8.8.4.4=google...).

```bash
$ dig google.fr @8.8.8.8
```

We can explicitly ask for some data by using the option `-t` with one of the following

* `NS`: nameserver
* `A`: IPV4
* `AAAA`: IPV6
* `MX`: mail server

```bash
$ dig example.com -t A
;; ANSWER SECTION:
google.fr.              300     IN      A  172.217.13.131
$ dig example.com -t AAAA
;; ANSWER SECTION:
google.fr.              300     IN      AAAA 2607:f8b0:4020:805::2003
```

You can also add options: `+stats +trace +nodnssec`.
</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>whois</code>: show data about IP</summary>

You can also use [whois via their website](https://www.whois.com/whois/).

```bash
$ whois google.fr
$ whois 8.8.8.8
```
</details>
</div><div>
</div></div>