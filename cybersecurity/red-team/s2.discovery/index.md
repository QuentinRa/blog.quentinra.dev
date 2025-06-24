# Second step - Discovery

[![activerecon](../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

<div class="row row-cols-lg-2"><div>

Discovery 🏝️, a.k.a. active recon (reconnaissance) is the second step of the pentester activities.

It involves gathering information about the target by **probing their network or systems** 🛶️ to identify security issues.

* 🎯 Host discovery <small>(OS, version...)</small>
* 🕸️ Network discovery <small>(architecture...)</small>
* 🧭 Systems, services and application discovery <small>(FTP, APIs...)</small>
* ...

Unlike passive discovery, as you are directly interacting with the target, you are likely to be detected, and maybe caught 🚓.
</div><div>

Common activities are:

* 🚪 Find entry points
  * running services and open ports
  * web applications or APIs
  * wireless network
  * physical devices
  * backdoors
  * ...
* 🔥 Find versions as there may be known vulnerabilities
* 🔑 Find usernames, backups, exposed data
* 🥅 Find the network architecture <small>(firewall/IDS...)</small>
* 💃 Find any social engineering indicators <small>(contact employees...)</small>
* 🌿 Investigate if a third-party/supplier is vulnerable
</div></div>

<hr class="sep-both">

## Investigate Hosts

[![netsecchallenge](../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)
[![vulnversity](../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![blue](../../_badges/thm-p/blue.svg)](https://tryhackme.com/room/blue)
[![ice](../../_badges/thm-p/ice.svg)](https://tryhackme.com/room/ice)
[![blaster](../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)
[![kenobi](../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![rrootme](../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![basicpentestingjt](../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![startup](../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![cowboyhacker](../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)
[![steelmountain](../../_badges/thmp-p/steelmountain.svg)](https://tryhackme.com/room/steelmountain)
[![easyctf](../../_badges/thm-p/easyctf.svg)](https://tryhackme.com/room/easyctf)
[![colddboxeasy](../../_badges/thm-p/colddboxeasy.svg)](https://tryhackme.com/room/colddboxeasy)
[![allinonemj](../../_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)
[![source](../../_badges/thm-p/source.svg)](https://tryhackme.com/room/source)
[![ctf](../../_badges/thm-p/ctf.svg)](https://tryhackme.com/room/ctf)
[![mustacchio](../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)
[![chillhack](../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![githappens](../../_badges/thm-p/githappens.svg)](https://tryhackme.com/room/githappens)
[![lianyu](../../_badges/thm-p/lianyu.svg)](https://tryhackme.com/room/lianyu)
[![easypeasyctf](../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)
[![tomghost](../../_badges/thm-p/tomghost.svg)](https://tryhackme.com/room/tomghost)
[![gamingserver](../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![cyborgt8](../../_badges/thm-p/cyborgt8.svg)](https://tryhackme.com/room/cyborgt8)
[![md2pdf](../../_badges/thm-p/md2pdf.svg)](https://tryhackme.com/r/room/md2pdf)
[![surfer](../../_badges/thm-p/surfer.svg)](https://tryhackme.com/r/room/surfer)
[![bruteit](../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)
[![unbakedpie](../../_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)
[![archangel](../../_badges/thm-p/archangel.svg)](https://tryhackme.com/r/room/archangel)
[![teamcw](../../_badges/thm-p/teamcw.svg)](https://tryhackme.com/r/room/teamcw)
[![pythonplayground](../../_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)
[![techsupp0rt1](../../_badges/thm-p/techsupp0rt1.svg)](https://tryhackme.com/r/room/techsupp0rt1)
[![bypassdisablefunctions](../../_badges/thm-p/bypassdisablefunctions.svg)](https://tryhackme.com/r/room/bypassdisablefunctions)
[![catpictures](../../_badges/thm-p/catpictures.svg)](https://tryhackme.com/r/room/catpictures)
[![marketplace](../../_badges/thm-p/marketplace.svg)](https://tryhackme.com/r/room/marketplace)
[![couch](../../_badges/thm-p/couch.svg)](https://tryhackme.com/r/room/couch)
[![attacktivedirectory](../../_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)
[![glitch](../../_badges/thm-p/glitch.svg)](https://tryhackme.com/r/room/glitch)
[![jason](../../_badges/thm-p/jason.svg)](https://tryhackme.com/r/room/jason)
[![anthem](../../_badges/thm-p/anthem.svg)](https://tryhackme.com/r/room/anthem)
[![blueprint](../../_badges/thm-p/blueprint.svg)](https://tryhackme.com/r/room/blueprint)
[![nax](../../_badges/thm-p/nax.svg)](https://tryhackme.com/r/room/nax)
[![brooklynninenine](../../_badges/thm-p/brooklynninenine.svg)](https://tryhackme.com/r/room/brooklynninenine)
[![h4cked](../../_badges/thm-p/h4cked.svg)](https://tryhackme.com/r/room/h4cked)
[![vulnnet_node](../../_badges/thm-p/vulnnet_node.svg)](https://tryhackme.com/r/room/vulnnetnode)
[![blog](../../_badges/thm-p/blog.svg)](https://tryhackme.com/r/room/blog)
[![picklerick](../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![wgelctf](../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
![getsimplecms](../../_badges/htb-p/getsimplecms.svg)
![nibbles](../../_badges/htb-p/nibbles.svg)
[![devvortex](../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![jerry](../../_badges/htb-p/jerry.svg)](https://app.hackthebox.com/machines/Jerry)
[![lame](../../_badges/htb-p/lame.svg)](https://app.hackthebox.com/machines/Lame)
[![sau](../../_badges/htb-p/sau.svg)](https://app.hackthebox.com/machines/Sau)
[![cozyhosting](../../_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)
[![netmon](../../_badges/htb-p/netmon.svg)](https://app.hackthebox.com/machines/Netmon)
[![blue](../../_badges/htb-p/blue.svg)](https://app.hackthebox.com/machines/Blue)
[![legacy](../../_badges/htb-p/legacy.svg)](https://app.hackthebox.com/machines/Legacy)
[![cap](../../_badges/htb-p/cap.svg)](https://app.hackthebox.com/machines/Cap)
[![wifinetic](../../_badges/htb-p/wifinetic.svg)](https://app.hackthebox.com/machines/Wifinetic)
[![knife](../../_badges/htb-p/knife.svg)](https://app.hackthebox.com/machines/Knife)
[![return](../../_badges/htb-p/return.svg)](https://app.hackthebox.com/machines/Return)
[![broker](../../_badges/htb-p/broker.svg)](https://app.hackthebox.com/machines/Broker)
[![bashed](../../_badges/htb-p/bashed.svg)](https://app.hackthebox.com/machines/Bashed)
[![celestial](../../_badges/htb-p/celestial.svg)](https://app.hackthebox.com/machines/Celestial)
[![optimum](../../_badges/htb-p/optimum.svg)](https://app.hackthebox.com/machines/Optimum)
[![busqueda](../../_badges/htb-p/busqueda.svg)](https://app.hackthebox.com/machines/Busqueda)
[![granny](../../_badges/htb-p/granny.svg)](https://app.hackthebox.com/machines/Granny)
[![antique](../../_badges/htb-p/antique.svg)](https://app.hackthebox.com/machines/Antique)
![bizness](../../_badges/htb-p/bizness.svg)
[![shocker](../../_badges/htb-p/shocker.svg)](https://app.hackthebox.com/machines/Shocker)
[![blocky](../../_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)
[![mirai](../../_badges/htb-p/mirai.svg)](https://app.hackthebox.com/machines/Mirai)
[![validation](../../_badges/htb-p/validation.svg)](https://app.hackthebox.com/machines/Validation)
[![keeper](../../_badges/htb-p/keeper.svg)](https://app.hackthebox.com/machines/Keeper)

<div class="row row-cols-lg-2"><div>

At this point, you should have a list of IPs which you have to examine.

#### Investigate Hosts — Availability

[![active_directory_enumeration_attacks](../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![activerecon](../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

This is a quick check to customize the following commands. Multiple hosts are responding to an `ICMP` request, excluding Windows hosts by default. Most external targets are configured to respond.

* [ping](/operating-systems/networking/commands/index.md#command-ping) `[FREE]`: test is one host is up 
* [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) `[FREE]`: test is multiple hosts are up
* [fping](https://fping.org/) `[FREE]`: test is multiple hosts are up

```ps
$ fping -asgq 172.20.0.0/23
$ nmap -sn -iL input_list.txt -vv
```

📚 Scanning multiple hosts with ICMP requests is called a Ping sweep.

<br>

#### Investigate Hosts — Network Mapping

[![shells_and_payloads](../../_badges/htb/shells_and_payloads.svg)](https://academy.hackthebox.com/course/preview/shells--payloads)
[![activerecon](../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

To tune attacks, we can use packet tracing to identify intermediate hosts between us and the target.

Packet tracing uses an increasing TTL <small>(determines the number of hops before the packet is destroyed)</small>. Intermediate machines that destroy a packet **may** answer back saying that the packet was destroyed.

* [traceroute](/operating-systems/networking/commands/index.md#command-traceroute) `[FREE]`: packet tracing command
* [tracepath](/operating-systems/networking/commands/index.md#command-tracepath) `[FREE]`: packet tracing command
* [tracert](/operating-systems/networking/commands/index.md#command-tracert) `[FREE] [Windows]`: packet tracing command

💥 Routes taken by packets may change.

📚 Some operating systems have well-known TTL values. We can use it to identify the operating system that responded <small>(unreliable)</small>.
</div><div>

#### Investigate Hosts — Port Scanning

[![adventofcyber2](../../_badges/thm/adventofcyber2/day24.svg)](https://tryhackme.com/room/adventofcyber2)

We have to know which services are running on a host, to determine attack paths. This involves discovering **TCP** and **UDP** ports.

* [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) `[FREE]`: multipurpose scanning
* [Rustscan](/cybersecurity/red-team/tools/scanners/ports/rustscan.md) `[FREE]`: fast scanning
* [Masscan](/cybersecurity/red-team/tools/scanners/ports/masscan.md) `[FREE]`: mass scanning
* [Naabu](https://github.com/projectdiscovery/naabu) `[FREE]`: fast scanning
* [jfsscan](https://github.com/nullt3r/jfscan) `[FREE]`: fast scanning
* NetCat `[FREE]`: primitive port scanning (`nc -zv IP 1-65535`)

⚠️ Tool may miss ports according to their configuration. Ports may be behind a firewall which we be able to bypass.

#### Investigate Hosts — Banner grabbing

[![shells_and_payloads](../../_badges/htb/shells_and_payloads.svg)](https://academy.hackthebox.com/course/preview/shells--payloads)
[![activerecon](../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)
[![netsecchallenge](../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)

Services may return a banner when we connect to it allowing us to identify the software and the version behind it.

```shell!
$ telnet IP 21
$ nc IP 21
[...] FTP server (Version 6.4/OpenBSD/Linux-ftpd-0.17) ready.
```

#### Investigate Hosts — Port Knocking

[![catpictures](../../_badges/thm-p/catpictures.svg)](https://tryhackme.com/r/room/catpictures)

A niche practice mostly found during CTFs is called [port knocking](https://en.wikipedia.org/wiki/Port_knocking). Port knocking servers, such as [knockd](https://linux.die.net/man/1/knockd), while watch over every port and will run a command when ports are knocked in a given order.

```ps
$ sudo apt install -y knockd
$ knock IP -v 1111 5555 7777
$ nc IP 1111 && nc IP 5555 && nc IP 7777
$ # run port scanning again, to check if a new port is shown
```
</div></div>

<hr class="sep-both">

## Web Services

[![introwebapplicationsecurity](../../_badges/thm/introwebapplicationsecurity.svg)](https://tryhackme.com/room/introwebapplicationsecurity)

<div class="row row-cols-lg-2"><div>

Most companies have at least one website. They are often made using well-known frameworks that may be misconfigured or vulnerable.

📚 Common ports are: `80`, `443`, `3000`, `5000`, `8000`, `8080`, and `8443`.

#### Web Services — Subdomains

...

<br>

#### Web Services — Forced Browsing

[![contentdiscovery](../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day24.svg)](https://tryhackme.com/room/adventofcyber2)
[![webenumerationv2](../../_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)
[![sqlmap](../../_badges/thm/sqlmap.svg)](https://tryhackme.com/room/sqlmap)
[![picklerick](../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![vulnversity](../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![blaster](../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)
[![rrootme](../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![startup](../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![wgelctf](../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
[![allinonemj](../../_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)
[![mustacchio](../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)
[![chillhack](../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![githappens](../../_badges/thm-p/githappens.svg)](https://tryhackme.com/room/githappens)
[![lianyu](../../_badges/thm-p/lianyu.svg)](https://tryhackme.com/room/lianyu)
[![cyborgt8](../../_badges/thm-p/cyborgt8.svg)](https://tryhackme.com/room/cyborgt8)
[![basicpentestingjt](../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![easypeasyctf](../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)
[![gamingserver](../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![md2pdf](../../_badges/thm-p/md2pdf.svg)](https://tryhackme.com/r/room/md2pdf)
[![surfer](../../_badges/thm-p/surfer.svg)](https://tryhackme.com/r/room/surfer)
[![bruteit](../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)
[![archangel](../../_badges/thm-p/archangel.svg)](https://tryhackme.com/r/room/archangel)
[![teamcw](../../_badges/thm-p/teamcw.svg)](https://tryhackme.com/r/room/teamcw)
[![pythonplayground](../../_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)
[![techsupp0rt1](../../_badges/thm-p/techsupp0rt1.svg)](https://tryhackme.com/r/room/techsupp0rt1)
[![nax](../../_badges/thm-p/nax.svg)](https://tryhackme.com/r/room/nax)
![nibbles](../../_badges/htb-p/nibbles.svg)
[![devvortex](../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cozyhosting](../../_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)
[![bashed](../../_badges/htb-p/bashed.svg)](https://app.hackthebox.com/machines/Bashed)
[![blocky](../../_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)
[![backup_file](../../_badges/rootme/web_server/backup_file.svg)](https://www.root-me.org/en/Challenges/Web-Server/Backup-file)
[![php_register_globals](../../_badges/rootme/web_server/php_register_globals.svg)](https://www.root-me.org/en/Challenges/Web-Server/PHP-register-globals)
[![debug_page](../../_badges/ps-lab/disclosure/debug_page.svg)](https://portswigger.net/web-security/information-disclosure/exploiting/lab-infoleak-on-debug-page)

Forced Browsing is a technique to find hidden files and folders. We are testing [common paths](/cybersecurity/red-team/_knowledge/topics/wordlists.md#forced-browsing) to discover hidden pages that we would not have discovered while browsing the website as normal users do.

* 🧃 Configuration files <small>(ex: .env, composer.json, .git)</small>
* 👀 Folders <small>(ex: upload, assets, wp-content)</small>
* 💵 Backup files <small>(ex: xxx.bak, xxx.old, xxx.1, xxx~)</small>
* 🔑 Admin panels <small>(ex: /adMIN/, /phpmyadmin/, /..;/manager)</small>
* 💰 Private files <small>(ex: secret.pdf, assets/notes.txt)</small>

⚠️ Before running large [wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md#forced-browsing), especially during CTFs, run the small ones first, otherwise, you will most likely miss results.

We commonly use tools such as:

* [Gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md) `[FREE]` 📌: Fast Forced Browsing.
* [dirsearch](/cybersecurity/red-team/tools/enumeration/web/dirsearch.md) `[FREE]`: Slow Forced Browsing.
* [feroxbuster](/cybersecurity/red-team/tools/enumeration/web/feroxbuster.md) `[FREE]` 📌: Performs Forced Browsing. Can recurse, crawl the website, parse robots.txt, and adapt to the website.
* [DirBuster](https://github.com/KajanM/DirBuster) `[FREE]`: Basic Forced Browsing.
* [dirb](https://dirb.sourceforge.net/) `[FREE]`: Basic Forced Browsing.

A few more tools can be used, while they were not created for this:

* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md#ffuf) `[FREE]`: Fast Forced Browsing.
* [wfuzz](/cybersecurity/red-team/tools/enumeration/web/wfuzz.md) `[FREE]`: Slow Forced Browsing.

<br>

#### Web Services — Mapping

[![contentdiscovery](../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day16.svg)](https://tryhackme.com/room/adventofcyber2)
[![picklerick](../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![gamingserver](../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![surfer](../../_badges/thm-p/surfer.svg)](https://tryhackme.com/r/room/surfer)
[![archangel](../../_badges/thm-p/archangel.svg)](https://tryhackme.com/r/room/archangel)
[![teamcw](../../_badges/thm-p/teamcw.svg)](https://tryhackme.com/r/room/teamcw)
[![anthem](../../_badges/thm-p/anthem.svg)](https://tryhackme.com/r/room/anthem)
[![devvortex](../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cap](../../_badges/htb-p/cap.svg)](https://app.hackthebox.com/machines/Cap)
[![http_directory_indexing](../../_badges/rootme/web_server/http_directory_indexing.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Directory-indexing)
[![backup_files](../../_badges/ps-lab/disclosure/backup_files.svg)](https://portswigger.net/web-security/information-disclosure/exploiting/lab-infoleak-via-backup-files)
[![unprotected_admin_functionality](../../_badges/ps-lab/access/unprotected_admin_functionality.svg)](https://portswigger.net/web-security/access-control/lab-unprotected-admin-functionality)
[![unprotected_admin_functionality_2](../../_badges/ps-lab/access/unprotected_admin_functionality_2.svg)](https://portswigger.net/web-security/access-control/lab-unprotected-admin-functionality-with-unpredictable-url)

Explore the website, note down each route and each feature. Test each form using valid expected data. Test as authenticated and not.

* [Burp Suite](/cybersecurity/red-team/tools/utilities/proxies/burp/index.md) `[FREEMIUM]` 📌: Map the website as you navigate.
* [Burp Suite](/cybersecurity/red-team/tools/utilities/proxies/burp/index.md) `[PAID]`: Crawl links and `robots.txt` <small>("Discover content")</small>.
* [ZAProxy](/cybersecurity/red-team/tools/utilities/proxies/zap/index.md) `[FREE]`: Crawl links.
* [onectf](/cybersecurity/red-team/tools/frameworks/onectf/index.md#onectf-crawl-module) `[FREE]`: Crawl links, simple JS events, and `robots.txt`. Include path discovery <small>(check each folder in a path for directory listing)</small>.
* [getallurls](https://github.com/lc/gau) `[FREE]`: Crawl links and use passive recon.
* [Katana](/cybersecurity/red-team/tools/enumeration/web/katana.md) `[FREE]` 📌: Crawl links <small>(can submit basic forms, include JSLuice and basic regexes for JS files)</small>, forms, `robots.txt` and `sitemap.xml`.

```ps
$ onectf crawl -u "https://example.com/"
$ katana -silent -u "https://example.com:443" -o crawl.json -depth 5 -js-crawl -known-files all -rate-limit 150 -automatic-form-fill -form-extraction -tech-detect -jsonl
```

📚 Check links <small>(href, src, location.href)</small>, `/robots.txt` and `/sitemap.xml`.

🛡️ Do not expose sensitive endpoints in the code base. Correctly implement security mechanisms <small>(e.g. IP checks)</small> to secure hidden pages.
</div><div>

#### Web Services — Fingerprint

[![attacking_with_ffuf](../../_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)
[![broken_authentication](../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)
[![walkinganapplication](../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![httpindetail](../../_badges/thm/httpindetail.svg)](https://tryhackme.com/room/httpindetail)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day1.svg)](https://tryhackme.com/room/adventofcyber2)
[![contentdiscovery](../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![howwebsiteswork](../../_badges/thmp/howwebsiteswork.svg)](https://tryhackme.com/room/howwebsiteswork)
[![agentsudoctf](../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)
[![agentt](../../_badges/thm-p/agentt.svg)](https://tryhackme.com/room/agentt)
[![ctfcollectionvol1](../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)
[![glitch](../../_badges/thm-p/glitch.svg)](https://tryhackme.com/r/room/glitch)
[![jason](../../_badges/thm-p/jason.svg)](https://tryhackme.com/r/room/jason)
[![vulnnet_node](../../_badges/thm-p/vulnnet_node.svg)](https://tryhackme.com/r/room/vulnnetnode)
[![picklerick](../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![wgelctf](../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
[![gamingserver](../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![cyborgt8](../../_badges/thm-p/cyborgt8.svg)](https://tryhackme.com/room/cyborgt8)
[![teamcw](../../_badges/thm-p/teamcw.svg)](https://tryhackme.com/r/room/teamcw)
[![archangel](../../_badges/thm-p/archangel.svg)](https://tryhackme.com/r/room/archangel)
[![easypeasyctf](../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)
[![lianyu](../../_badges/thm-p/lianyu.svg)](https://tryhackme.com/room/lianyu)
[![anthem](../../_badges/thm-p/anthem.svg)](https://tryhackme.com/r/room/anthem)
[![unbakedpie](../../_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)
![nibbles](../../_badges/htb-p/nibbles.svg)
![getsimplecms](../../_badges/htb-p/getsimplecms.svg)
[![knife](../../_badges/htb-p/knife.svg)](https://app.hackthebox.com/machines/Knife)
[![celestial](../../_badges/htb-p/celestial.svg)](https://app.hackthebox.com/machines/Celestial)
[![devvortex](../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![http_user-agent](../../_badges/rootme/web_server/http_user-agent.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-User-agent)
[![http_headers-agent](../../_badges/rootme/web_server/http_headers.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Headers)
[![http_cookies](../../_badges/rootme/web_server/http_cookies.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Cookies)
[![html_source_code](../../_badges/rootme/web_server/html_source_code.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTML-Source-code)
[![http_directory_indexing](../../_badges/rootme/web_server/http_directory_indexing.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Directory-indexing)
[![phpbb_install_files](../../_badges/rootme/web_server/phpbb_install_files.svg)](https://www.root-me.org/en/Challenges/Web-Server/Install-files)
[![http_ip_restriction_bypass](../../_badges/rootme/web_server/http_ip_restriction_bypass.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-IP-restriction-bypass)
[![html_disabled_buttons](../../_badges/rootme/web_client/html_disabled_buttons.svg)](https://www.root-me.org/en/Challenges/Web-Client/HTML-disabled-buttons)
[![error_message](../../_badges/ps-lab/disclosure/error_message.svg)](https://portswigger.net/web-security/information-disclosure/exploiting/lab-infoleak-in-error-messages)
[![debug_page](../../_badges/ps-lab/disclosure/debug_page.svg)](https://portswigger.net/web-security/information-disclosure/exploiting/lab-infoleak-on-debug-page)
[![authentication_bypass](../../_badges/ps-lab/disclosure/authentication_bypass.svg)](https://portswigger.net/web-security/information-disclosure/exploiting/lab-infoleak-authentication-bypass)

Before even exploring the website, we may want to discover the technology stack. While rare, there may be vulnerabilities on the infrastructure. We will use this knowledge to prioritize checks.

* 🤖 Are they using any frameworks? <small>(WordPress, Laravel, etc.)</small>
* 📚 Which engine are they using? <small>(PHP, Node.js, ASP, Java, etc.)</small>
* 📁 Which webserver are they using? <small>(Apache, Nginx, IIS)</small>
* ✍️ Which devkit are they using? <small>(Composer/vendor, package.json, etc.)</small>

We commonly use tools such as:

* [Burp Suite](/cybersecurity/red-team/tools/utilities/proxies/burp/index.md) `[FREEMIUM]`: browse source code, headers, cookies.
* [Burp Suite](/cybersecurity/red-team/tools/utilities/proxies/burp/index.md) `[PAID]`: active scan can detect versions
* [wappalyzer](/cybersecurity/red-team/tools/scanners/web/wappalyzer.md) `[FREEMIUM]` 📌: detect technologies and their versions
* [whatweb](/cybersecurity/red-team/tools/scanners/web/whatweb.md) `[FREE]`: detect technologies and their versions
* [nikto](/cybersecurity/red-team/tools/scanners/web/nikto.md) `[FREE]`: vulnerability scanner with fingerprint modules
* [CMSeek](https://github.com/Tuhinshubhra/CMSeeK) `[FREE]`: CMS scanner with fingerprint modules
* [builtwith](https://builtwith.com/) `[FREEMIUM]`: detect technologies and their versions
* [whatruns](https://www.whatruns.com/) `[FREE]`: detect technologies and their versions

📚 Check source code <small>(css/js, links, comments, copyrights)</small>, `/robots.txt`, files extensions or fuzz extensions for `/indexFUZZ`, `<meta>`/`<title>` tags, the favicon, login/admin/error pages, headers, and cookies.

🛡️ Remove versions in headers. Do not enable DEBUG modes. Keep error messages generic. Remove the [default favicon](https://wiki.owasp.org/index.php/OWASP_favicon_database) and comments.

<br>

#### Web Services — Javascript Secrets

[![server_side_attacks](../../_badges/htb/server_side_attacks.svg)](https://academy.hackthebox.com/course/preview/server-side-attacks)
[![walkinganapplication](../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![pythonplayground](../../_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)
[![glitch](../../_badges/thm-p/glitch.svg)](https://tryhackme.com/r/room/glitch)
[![javascript_authentication](../../_badges/rootme/web_client/javascript_authentication.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Authentication)
[![javascript_authentication_2](../../_badges/rootme/web_client/javascript_authentication_2.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Authentication-2)
[![javascript_source](../../_badges/rootme/web_client/javascript_source.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Source)

JavaScript files often contain secrets <small>(JWT, credentials)</small> along with URLs in modern applications such as React or Angular apps.

* [subjs](https://github.com/lc/subjs) `[FREE]`: Find routes within JavaScript files
* [jsluice](https://github.com/BishopFox/jsluice) `[FREE]`: Find routes+secrets within JavaScript files
* Devtools `[FREE]`: Use breakpoints and analyse the JavaScript

📚 Ensure that common files such as `jquery` were not tampered with.

<br>

#### Web Services — Known Frameworks

Common frameworks:

* [WordPress](/programming-languages/web/others/cms/wordpress/index.md): the most popular website builder
* [Django](/programming-languages/web/others/frameworks/django/index.md): common python framework

Common solutions:

* [GLPI](/operating-systems/networking/others/random/glpi.md)

Common technologies:

* [Web Sockets](/programming-languages/web/topics/web_sockets/index.md)

Uncommon frameworks:

* [Umbraco CMS](/cybersecurity/red-team/s2.discovery/techniques/websites/fingerprint.md#umbraco-cms)
* [Subrion CMS](/cybersecurity/red-team/s2.discovery/techniques/websites/fingerprint.md#subrion-cms)
* [osCommerce](/cybersecurity/red-team/s2.discovery/techniques/websites/fingerprint.md#oscommerce--ecommerce-framework)
* [phpBB](/cybersecurity/red-team/s2.discovery/techniques/websites/fingerprint.md#php-bulletin-board-phpbb)

TODO:

* [Joomla](/programming-languages/web/others/cms/joomla/index.md): popular content-management system (CMS)
* [Drupal](/programming-languages/web/others/cms/drupal/index.md): content-management system (CMS)
* [GetSimple CMS](/cybersecurity/red-team/s2.discovery/techniques/websites/fingerprint.md#getsimple-cms)

</div></div>

<hr class="sep-both">

## Web Services — Checklist

<div class="row row-cols-lg-2"><div>

#### Web Services — Subdomains — Checklist

...

#### Web Services — Mapping — Checklist

Detect common files and endpoints:

- [x] Crawl the website unauthenticated
- [ ] Crawl the website authenticated <small>(🧪)</small>
- [x] Crawl robots.txt and sitemap.xml 
- [x] Detect robots.txt and sitemap.xml
- [x] Detect and scrap humans.txt
- [x] Detect and scrap security.txt
- [x] Detect and crawl directories with directory listing

Detect interesting elements:

- [x] Detect HTML forms
- [ ] Detect hidden HTML tags
- [x] Identify allowed methods using `OPTIONS`
- [ ] Identify pages supporting `TRACE`
- [x] Detect endpoints in the JavaScript

📚 Find routes, files, forms, and emails.

#### Web Services — Forced Browsing — Checklist

Detect common files and folders:

- [x] .env, .idea, .vscode
- [x] .git, .git/HEAD, .git/config, .gitignore
- [x] .svn, .svn/entries, .svn/wc.db
- [x] .DS_Store
- [x] ~, .bak, and .old trailing extensions
- [x] composer.json, composer.lock, composer.phar
- [x] package.json, package-json.lock, yarn.lock
- [x] vendor, vendor/composer/installed.json, node_modules
- [x] .map javascript files
- [x] readme, changelog, and license files
- [x] cgi-bin scripts
</div><div>

#### Web Services — Fingerprint — Checklist

Detect common mistakes/misconfigurations:

- [x] Detect HTML Comments
- [x] Inspect Headers <small>(suspicious, missing)</small>
- [x] Inspect cookies <small>(detect, security flags, investigate, [editor](https://cookie-editor.com/), [ref](/programming-languages/web/_general/random/cookies.md))</small>
- [x] Known favicons
- [x] Meta tags <small>(generator)</small>
- [ ] Upload folder <small>(temp, tmp, upload, etc.)</small>

Known pages

* [ ] Register, login and reset password pages
* [x] Known 403 pages <small>(/: or /.htaccess)</small>
* [x] Known 404 pages <small>(/PAGENOTFOUND or /PAGENOTFOUND/)</small>
* [x] Known 500 pages <small>(POST with no body, etc.)</small>
* [x] Install and Default Pages <small>(Apache, nginx)</small>
* [x] Server Errors <small>(ASP, PHP)</small>
* [x] Stack Traces <small>(ASP, PHP)</small>

Resources

- [ ] Detect secrets in the JavaScript <small>(✍️🧪)</small>
- [ ] Detect JavaScript Comments
- [x] Detect CDNs <small>(cdnjs, etc.)</small>
- [x] Detect JavaScript libraries versions

Other elements:

- [x] Detected Emails
- [ ] Detected Domains/Subdomains <small>(✍️🧪)</small>
- [ ] Title
- [ ] indexFUZZ

📚 Find routes, secrets, emails, etc.
</div></div>