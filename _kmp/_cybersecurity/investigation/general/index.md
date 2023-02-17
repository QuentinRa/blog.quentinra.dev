# Investigation

[![passiverecon](../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

<div class="row row-cols-md-2"><div class="align-self-center">

The first step, investigation, or passive reconnaissance (recon) involves gathering information about the target from afar, meaning with **no direct interaction with the target**, using public information (OSINT)

* DNS records to look for registrar/contact info/...
* Job offers
* News related to the company
* ...

The goal is to find as much information as possible. This step is followed by active reconnaissance where you directly interact with the target.
</div><div>

* Learn more about the company, the programming languages, and the software that they use... 🧑‍💻

* Find your candidate targets, for instance, a subdomain owned by the company for another purpose, that is hosted on the network that their main website, and may be vulnerable 🐟

* Find employees, their emails, their social accounts... Try to find out if some of their passwords leaked, and as passwords tend to be reused, you may access other accounts.

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

## Maltego

<div class="row row-cols-md-2"><div>

This is a software/tool allowing someone to gather a lot of past, and present information about a target. It includes information about websites, DNS, Domains, emails/telephones, and companies... Note that the information generated may not be accurate.

![Maltego](_images/maltego.png)

> Official links: [Maltego documentation](https://docs.maltego.com/support/home), [Maltego blog](https://www.maltego.com/blog/), [Maltego tutorials](https://www.maltego.com/categories/tutorial/), and [Maltego webinars](https://www.maltego.com/webinars/),

</div><div>

```bash
$ sudo apt install maltego # tested on Kali Linux
$ maltego
```

Select "Maltego CE (free)", then once you [created a MaltegoCE account](https://www.maltego.com/ce-registration/), you can get started in your first investigation. Click on "new". You will see a whiteboard. In the left column, you can drag, and drop a starting point. For instance,

1. Search "domain"
2. Drag and drop it on the whiteboard
3. Double-click on it to edit it, enter a domain name, then press "ok"
4. Right-click on it, and now, you can search for something related to this domain name <small>(ex: email addresses...)</small>. If you want to try to look for "everything", then run all transforms

![maltego_run_all_transforms](_images/maltego_run_all_transforms.png)

Wait, and investigate what maltego found for you!
</div></div>

<hr class="sep-both">

## Google Hacking/Dorking

[![googledorking](../../_badges/thm/googledorking.svg)](https://tryhackme.com/room/googledorking)

<div class="row row-cols-md-2"><div>

Search engines are using bots, called **crawlers** to index websites. They go from one page to another, or from one website to another, by following links. The file **robots.txt** is listing the pages that "good" crawlers shouldn't index, along with the path to a file called **sitemap** which is literally a map of every page/resource of the websites, allowing crawlers to easily crawl the website.

Most search engines, Google being the most famous one, allow us to make **advanced queries**. This was known as advanced search, but after some guys wrote some books naming that as "Google Dorking", then it became widely known as **Google Dorking**.

On Google, you can use the [advanced search](https://www.google.com/advanced_search) page to make advanced queries, while you may also directly use special tokens in your search bar. There you can find a [long list of Google Search Operators](https://ahrefs.com/blog/google-advanced-search-operators/).

[See Google Hacking Database](https://www.exploit-db.com/google-hacking-database) for juicy queries to exploit this.
</div><div>

* `site:example.com`: search only results on "example.com"
* `site:.com`: search only results on ".com" domains
* `cache:example.com`: cached versions of "example.com"
* `-word`: search results that do not have this word
* `"some word"`: search results that must have "some word"
* `filetype:pdf`: search PDF files
* `intitle:"Hello World"`: search for websites having "Hello World" in their title
* `inurl:admin`: search for URLs containing the word "admin"

You may also use

* `imagesize:1920x1080`: search only images on "1920 by 1080"
* `@twitter`: search results on Twitter
* `$400` or `$50..$100`: search for a price
* `#hashtag`: search for a hashtag
* `xxx OR yyy`: search both xxx and yyy
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

➡️ You can use the commands [nslookup/dig](/operating-systems/linux/networking/linux.md#interact-with-the-outside) to query DNS servers.

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

<hr class="sep-both">

## Shodan.io

<div class="row row-cols-md-2"><div>

[Shodan.io](https://www.shodan.io/) is a search engine indexing devices and their information such as the app running on it, the webserver (apache/...), the location, the ports open... And you can even see statistics, such as the top ports used with apache!

> [Search Query Fundamentals](https://help.shodan.io/the-basics/search-query-fundamentals)
</div><div>

**To-do**

* [THM Shodan](https://tryhackme.com/room/shodan)
* During Black Friday/Cyber Monday, Shodan may be at 5$ for life
</div></div>