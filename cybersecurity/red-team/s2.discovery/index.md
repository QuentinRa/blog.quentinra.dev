# Second step - Discovery

[![activerecon](../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

<div class="row row-cols-lg-2"><div>

Discovery 🏝️, a.k.a. active recon (reconnaissance) is the second step of the pentester activities.

It involves gathering information about the target by **probing their network or systems** 🛶️, to find exploitable vulnerabilities.

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

Explore the website, note down each route and each feature. Test each form using valid expected data. Test as authenticated and not.

* [Burp Suite](/cybersecurity/red-team/tools/utilities/proxies/burp/index.md) `[FREEMIUM]` 📌: Map the website as you navigate.
* [Burp Suite](/cybersecurity/red-team/tools/utilities/proxies/burp/index.md) `[PAID]`: Crawl links and `robots.txt`. 
* [ZAProxy](/cybersecurity/red-team/tools/utilities/proxies/zap/index.md) `[FREE]`: Crawl links.
* [onectf](/cybersecurity/red-team/tools/frameworks/onectf/index.md#onectf-crawl-module) `[FREE]`: Crawl links, simple JS events, and `robots.txt`. Include path discovery <small>(check each folder in a path for directory listing)</small>.
* [getallurls](https://github.com/lc/gau) `[FREE]`: Crawl links and use passive recon.
* [subjs](https://github.com/lc/subjs) `[FREE]`: Find routes within JavaScript files
* [Katana](https://github.com/projectdiscovery/katana) `[FREE]` 📌: Crawl links <small>(including routes within the JavaScript)</small>, forms, `robots.txt` and `sitemap.xml`.

```ps
$ onectf crawl -u "https://example.com/"
$ katana -silent -u "https://example.com:443" -o crawl.json -depth 5 -js-crawl -known-files all -rate-limit 150 -automatic-form-fill -form-extraction -tech-detect -jsonl
```

📚 Check links <small>(href, src, location.href)</small>, `/robots.txt` and `/sitemap.xml`.

🛡️ Do not expose sensitive endpoints in the code base. Correctly implement security mechanisms <small>(e.g. IP checks)</small> to secure hidden pages.

<br>

#### Web Services — Fingerprint

[![attacking_with_ffuf](../../_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)

Before even exploring the website, we may want to discover the stack. While rare, there may be vulnerabilities on the infrastructure. Regardless, we will use this knowledge to prioritize some checks.

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

🛡️ Remove versions in headers. Do not enable DEBUG modes. Keep error messages generic. Remove the default favicon and comments.
</div><div>

#### Web Services — Forced Browsing

...

</div></div>

<hr class="sep-both">

## Web Services — Checklist

<div class="row row-cols-lg-2"><div>

#### Web Services — Subdomains — Checklist

...

#### Web Services — Mapping — Checklist

Detect common files:

- [x] Crawl the website unauthenticated
- [ ] Crawl the website authenticated <small>(✍️🧪)</small>
- [x] Detect non-generic robots.txt
- [x] Crawl robots.txt
- [ ] Detect and crawl sitemap.xml <small>(🧪)</small>
- [ ] Detect and scrap humans.txt <small>(✍️🧪)</small>
- [ ] Detect and scrap security.txt <small>(✍️🧪)</small>
- [x] Detect and crawl directories with directory listing

📚 Find routes, files, and emails.

#### Web Services — Fingerprint — Checklist

Detect common mistakes/misconfigurations:

- [x] HTML Comments
- [ ] Headers
- [ ] Cookies
- [ ] Default favicon

Other elements:

- [x] Emails
- [ ] indexFUZZ
- [ ] Meta tags
- [ ] Title
- [ ] 404 page, login/admin page, etc.

📚 Find routes, secrets, emails, etc.
</div><div>

#### Web Services — Forced Browsing — Checklist

Detect common files and folders:

- [ ] .git, .git/HEAD, .git/config
- [ ] .svn
- [ ] .DS_Store
- [ ] trailing tilde
- [ ] .bak extension
- [ ] .env
- [x] composer.json, composer.lock, vendor/composer/installed.json
- [x] package.json, package-json.lock, yarn.lock
- [ ] .map css/javascript files <small>(🧪)</small>
</div></div>

<hr class="sep-both">
<hr class="sep-both">
<hr class="sep-both">
<hr class="sep-both">

## Arsenal 🌱

<div class="row row-cols-lg-2"><div>

* Spoof User-Agent

You can install an extension to make the target website believe that you are using another browser. Look for **User-Agent Switcher** extensions on Google. You can try them on [whatismybrowser](https://www.whatismybrowser.com/).

* Use a proxy

You may use a proxy as an intermediary for your requests. If you do, then you can use the **FoxyProxy extension** of your browser to easily swap between no proxy, and your proxies configurations.

* [Devtools](/programming-languages/web/_general/index.md#-developer-tools-devtools-): bypass HTML/JS verifications, hide/remove tags...
</div><div>

* Disable scripts

You may do that to bypass JavaScript verifications. You can use plugins such as [noscript](https://noscript.net/), or ublock by clicking on the following icon

![ublock_disable_scripts](_images/ublock_disable_scripts.png)

* HTTP clients

We usually don't only rely on our web browser to recon/exploit websites, as they are unreliable. You can use [Postman, curl](/programming-languages/others/apis/_general/index.md#query-an-api) or tools such as the [Burp Suite](/cybersecurity/red-team/tools/utilities/proxies/burp/index.md)...

</div></div>

<hr class="sep-both">

## Tools and methods 🗺️

<div class="row row-cols-lg-2"><div>

Scanning and enumeration

* [brute force service credentials](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md) 🚪: try to force your way in
* The banner format may be used to primitively guess the OS

Vulnerabilities scanners

* [Nessus](/cybersecurity/red-team/tools/scanners/vulns/nessus.md): port scanning, find vulnerabilities, quite noisy/slow
* [OpenVAS](/cybersecurity/red-team/tools/scanners/vulns/openvas.md): port scanning, find vulnerabilities, quite noisy/slow
* [Nikto](/cybersecurity/red-team/tools/scanners/web/nikto.md): website vulnerability scanner

Internal Assessments

* [LLMNR/NBT-NS Poisoning](/cybersecurity/red-team/s2.discovery/techniques/network/poisoning.md): usernames, hashes, host fingerprint
* [LDAP And Kerberos Enumeration](/operating-systems/cloud/active-directory/security/index.md#ad-pentester-notes-): usernames, hashes, etc.
* [Password Policy](/cybersecurity/red-team/s2.discovery/techniques/passwords/policy.md): password length, account lockout
* [Password Spraying](/cybersecurity/red-team/s2.discovery/techniques/passwords/spraying.md): gain access to an account
</div><div>

Websites

[![introwebapplicationsecurity](../../_badges/thm/introwebapplicationsecurity.svg)](https://tryhackme.com/room/introwebapplicationsecurity)

* [Website fingerprinting](/cybersecurity/red-team/s2.discovery/techniques/websites/fingerprint.md) 🧭: understand your target
* [Source code analysis](/cybersecurity/red-team/s2.discovery/techniques/websites/sanalysis.md) 🚪🔥🔑: comments, hidden code...
* [Account discovery](/cybersecurity/red-team/s2.discovery/techniques/websites/account.md) 🔑: find accounts
* [Forced Browsing](/cybersecurity/red-team/s2.discovery/techniques/websites/forced_browsing.md) 🚪🔑: find hidden pages/folders
* [IDOR](/cybersecurity/red-team/s2.discovery/techniques/websites/idor.md) 🚪🔑: find if you can access someone else content
* [Logic flaws](/cybersecurity/red-team/s2.discovery/techniques/websites/logic_flaws.md) 🚪: find logic flaws, mass assignment
* [Virtual hosts](/cybersecurity/red-team/s2.discovery/techniques/websites/vhosts.md) 🚪: find virtual hosts
* [Subdomains](/cybersecurity/red-team/s2.discovery/techniques/websites/subdomains.md) 🚪: find subdomains
* [Parameters](/cybersecurity/red-team/s2.discovery/techniques/websites/hidden_parameters.md) 🚪: find hidden parameters
* [Json Web Tokens](/cybersecurity/red-team/s2.discovery/techniques/passwords/jwt.md) 🚪🔑: find and exploit these

➡️ You should check for signs of [well-known vulnerabilities](/cybersecurity/red-team/s3.exploitation/index.md#common-vulnerabilities-).

➡️ What you can [do if you get access to a PHP Info script](/cybersecurity/red-team/s2.discovery/techniques/websites/php_info.md).

➡️ Why not try inserting newlines/`%0A` in parameters. Why not try to transform PHP/JS parameters as [explained here](/cybersecurity/red-team/s2.discovery/techniques/websites/logic_flaws.md#http-parameter-pollution).

🪦 If there is a load balancer such as haproxy blocking some URLs, can you try to see if `//blocked_endpoint` is blocked?
</div></div>

<hr class="sep-both">

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### Remediation 🛡️

<p></p>

* 🔒 Display generic error messages, disable errors messages, and do not give much information <small>(ex: on invalid login, display the message 'credentials invalid', instead of 'username invalid' or 'password invalid')</small>

* 🚧 Test your endpoints with invalid values: 0, -1, characters, symbols... Test your pages with/without expected parameters, especially if a hacker tries to access pages in an unexpected order.

* 🔫 Do not trust anything coming from the user, its browser, or even your database. In a nutshell, do not trust anyone.

<br>

#### OWASP Foundation

[![owasptop10](../../_badges/thm/owasptop10.svg)](https://tryhackme.com/room/owasptop10)

[OWASP](https://owasp.org/) (The Open Source Foundation for Application Security Project) is a foundation that is very well-known for its resources to improve website security. The release every few years the [Top 10 vulnerabilities](https://owasp.org/Top10/).

* See [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/) <small>(23.4k ⭐)</small>
* See [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/) <small>(5.4k ⭐, [PDF](https://github.com/OWASP/wstg/releases/download/v4.2/wstg-v4.2.pdf))</small>

</div><div>

#### Pentest Considerations ⚠️

Automated scans can impact the network.

During an assignment, ensure you know which hosts can be automatically scanned (e.g., using Nessus) and which hosts should be excluded and manually tested.

When discovering something, it's important to question why we discovered something, e.g. why is this service present/enabled.

According to the kind of business, we may be able to guess their needs, and also guess some services that should be present.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `sudo arp-scan -l -I eth0`
* [clFrex](https://cifrex.org/)

S3 Buckets

* find S3 Buckets `awscli` (https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html, [![contentdiscovery](../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery))
* are not hidden, may be misconfigured to allow edit JS files
* S3 buckets (AWS), blobs (Azure), cloud storage (GCP): may be accessible without auth [grayhatwarfare](https://buckets.grayhatwarfare.com/)
</div><div>
</div></div>