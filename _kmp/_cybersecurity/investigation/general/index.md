# Investigation

<div class="row row-cols-md-2"><div class="align-self-center">

sing public information (OSINT)

* DNS records to look for registrar/contact info/...
* Job offers
* News related to the company
* ...

The goal is to find as much information as possible. This step is followed by active reconnaissance where you directly interact with the target.
</div><div>

password reuse

For instance, if they have many customers, it is highly likely that they have a way to provide support for them, which may be an attack vector...

If they are looking for developers that are proficient in Node.js, it's likely that they are either using, were using, or are planning to use Node.js.
</div></div>

<hr class="sep-both">

## Open-source intelligence (OSINT)

<div class="row row-cols-md-2"><div>

Open-source intelligence (**OSINT**) is any information that you gather from public sources. The OSINT framework, available on [osintframework.com](https://osintframework.com/), is a well-known collection of websites that you can use. Simply expand a node, and you will see websites that can provide you with information about what you are looking for.

Find other accounts given a username

* [sherlock](https://github.com/sherlock-project/sherlock) (36.6k ⭐)
* [maigret](https://github.com/soxoj/maigret) (7.1k ⭐)

Find information about a number

* [phoneinfoga](https://github.com/sundowndev/phoneinfoga) (7.7k ⭐)

Find information about an email

* [epieos](https://epieos.com/)
* [ProtOSINT](https://github.com/pixelbubble/ProtOSINT) (proton)
* [spokeo](https://www.spokeo.com/) (👻, paid)
</div><div>

Social Networks
* Instagram: [Osintgram](https://github.com/Datalux/Osintgram) (5.3k⭐) [instaloader](https://github.com/instaloader/instaloader) (5k ⭐)
* Twitter: [twint](https://github.com/twintproject/twint) (archived, 13.9k ⭐)
* Google: [GHunt](https://github.com/mxrch/GHunt) (12.1k ⭐)
* [social-analyzer](https://github.com/qeeqbox/social-analyzer) (Profile in many SN, 9.4k ⭐)
* GitHub: [Gitrob](https://github.com/michenriksen/gitrob) (archived, 5.5k ⭐)
* ...

Others

* [awesome-osint](https://github.com/jivoi/awesome-osint) (list, 10.7k ⭐)
* [spiderfoot](https://github.com/smicallef/spiderfoot) (automated, 8.7k ⭐)
* [OSINT-Tools](https://github.com/mgp25/OSINT-Tools) (list, 45 ⭐)
* [getemail.io](https://getemail.io/) (get someone email, free plan = 10/month)
</div></div>

<hr class="sep-both">

## Recon using certificates/DNS records

<div class="row row-cols-md-2"><div>

[DNS](/_it/networking/general/index.md#domain-name-system-dns-protocol) are storing records about a domain, and its subdomains, used to translate a domain name to an IP address.

➡️ You can dig into DNS records

* [dnsdumpster](https://dnsdumpster.com/) to fetch DNS records

➡️ You can dig into certificates issued for a domain

* [crt.sh](https://crt.sh/) to search for certificates
* [ct search](https://ui.ctsearch.entrust.com/ui/ctsearchui) same, can fetch old certificates

➡️ You can use scripts

[Sublist3r](https://github.com/aboul3la/Sublist3r) (7.7k ⭐) is a Python script to enumerate subdomains of websites using OSINT.

There is also [theHarvester](https://github.com/laramies/theHarvester) (7.6k ⭐) which is a Python script too.
</div><div>

➡️ You can use [whois](https://www.whois.com/whois/) website, or their command, to dig for information about the owner of a domain name, their registrar...

➡️ You can use the commands [nslookup/dig](/operating-systems/networking/commands/linux/linux.md#interact-with-the-outside) to query DNS servers.

```bash
# A = IPV4, AAAA=IPV6, MX, TXT, CNAME...
$ nslookup -type=A example.com
$ dig example.com -t A
# ask 1.1.1.1 DNS server
$ nslookup -type=A example.com 1.1.1.1
$ dig example.com -t A @1.1.1.1
```

➡️ You can also use your Google Dorking skills to find subdomains

```text
-site:example.com site:*.example.com
```
</div></div>