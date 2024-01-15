# Website Fingerprint

<div class="row row-cols-lg-2"><div>

The most important part of the website discovery step is to identify the architecture of the website.

* 🤖 Are they using any frameworks? <small>(WordPress, Laravel, etc.)</small>
* 📚 Which engine are they using? <small>(PHP, Node.js, ASP, Java, etc.)</small>
* 📁 Which webserver are they using? <small>(Apache, Nginx, IIS)</small>
* ...

Having this information may allow us to exploit known vulnerabilities (CVEs), but it's mostly handy to fine tune the rest of the steps.
</div><div>

**Pentester Notes** 🔥

If the webserver is Apache, the OS is most likely a Linux. We may choose to use Linux-only [wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md) or configure differently our tools.

If we detect the use of a framework, we can use common techniques and automated tools to find internal informations <small>(users, plugins, etc.)</small> to hopefully find an attack vector. See also: [Framework Exploitation](/cybersecurity/red-team/s3.exploitation/techniques/framework.md).

⚠️ Don't forget [robots.txt/sitemap.xml](sanalysis.md#links).
</div></div>

<hr class="sep-both">

## Analyze Web Requests

[![walkinganapplication](../../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![httpindetail](../../../../_badges/thm/httpindetail.svg)](https://tryhackme.com/room/httpindetail)
[![contentdiscovery](../../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![agentsudoctf](../../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)
[![agentt](../../../../_badges/thm-p/agentt.svg)](https://tryhackme.com/room/agentt)
[![knife](../../../../_badges/htb-p/knife.svg)](https://app.hackthebox.com/machines/Knife)
[![http_ip_restriction_bypass](../../../../_badges/rootme/web_server/http_ip_restriction_bypass.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-IP-restriction-bypass)
[![http_user-agent](../../../../_badges/rootme/web_server/http_user-agent.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-User-agent)
[![http_headers-agent](../../../../_badges/rootme/web_server/http_headers.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Headers)

<div class="row row-cols-lg-2"><div>

You can do it from the command line, from your web proxy if you use one, or from the network tab of the devtools console. 

The network tab is unreliable as requests are deleted when the page is reloaded, or some requests might not be exploitable.

A common source of information are the request [headers](/operating-systems/networking/protocols/http.md#http-headers-in-web-applications).

```ps
$ curl -I https://example.com/  # query headers using cURL
```
</div><div>

🔑 The server <small>(Nginx, Apache, IIS, Node.js)</small> and the version may be exposed in the headers.

✨ You may find suspect headers <small>(ex: backdoors such as [PHP8.1-dev](https://github.com/flast101/php-8.1.0-dev-backdoor-rce)...)</small>

👉 You can use the network tab to tune requests and re-send them.

🗺️ There are many web scanner detecting suspicious headers.
</div></div>

<hr class="sep-both">

## Analyze cookies

[![httpindetail](../../../../_badges/thm/httpindetail.svg)](https://tryhackme.com/room/httpindetail)
[![celestial](../../../../_badges/htb-p/celestial.svg)](https://app.hackthebox.com/machines/Celestial)
[![http_cookies](../../../../_badges/rootme/http_cookies.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Cookies)

<div class="row row-cols-lg-2"><div>

Cookies can be used to determine the framework/technology/webserver. Some well-known cookies are:

* JSESSIONID — commonly associated with Java Servlets
* PHPSESSID — commonly associated with PHP

Some cookies might contain easily modifiable values or [encoded](/tools-and-frameworks/knowledge/encoding/index.md) values. It's interesting to see how much we can fuzz its values.
</div><div>

Refer to the [Cookie](/programming-languages/web/_general/random/cookies.md) for information on cookies. 

➡️ You can use the [cookie-editor extension](https://cookie-editor.com/) if you don't find it comfortable to use the developer tools.
</div></div>

<hr class="sep-both">

## Architecture Analysis

[![devvortex](../../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)

<div class="row row-cols-lg-2"><div>

You can use automated tools to see if they can detect the underlying technologies and the presence of a framework.

* [wappalyzer](/cybersecurity/red-team/tools/scanners/web/wappalyzer.md): list front-end components
* [whatweb](/cybersecurity/red-team/tools/scanners/web/whatweb.md): list front-end and back-end information
* [nikto](/cybersecurity/red-team/tools/scanners/web/nikto.md): look for common vulnerabilities, which may expose the architecture and the framework indirectly.

<br>

#### Extension Fuzzing

[![attacking_with_ffuf](../../../../_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)

We may want to find which extension the server uses, to fine tune our attacks. We may guess it based on the webserver but this is unreliable.

Most websites have a file called `index` which can be used for [fuzzing](fuzzing.md). For example, with the URL `example.com/indexFUZZ`.


Refer to [wordlists#extensions](/cybersecurity/red-team/_knowledge/topics/wordlists.md#extensions) for wordlists.
</div><div>

#### Manual Framework Identification

[![contentdiscovery](../../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
![getsimplecms](../../../../_badges/htb-p/getsimplecms.svg)

* Look if the framework is credited at the bottom of the page
* Look if there is an HTML comment with the framework name/...
* Try to find the version (comments, dependencies, features...)
* Look for the login page / CMS panel (if any)

<br>

#### Favicon Fingerprint

[![contentdiscovery](../../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)

Look for the default favicon of the framework. Usually, it's stored at `/favicon.ico`, although it's usually removed. If you do find one, download it, hash it (MD5), and [find it in OWASP favicon database](https://wiki.owasp.org/index.php/OWASP_favicon_database)

```ps
# Linux
$ curl URL/favicon.ico | md5sum
# Windows (on a downloaded favicon)
$ Get-FileHash .\favicon.ico -Algorithm MD5
```
</div></div>

<hr class="sep-both">

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### PHP Bulletin Board (phpBB)

[![phpbb_install_files](../../../../_badges/rootme/web_server/phpbb_install_files.svg)](https://www.root-me.org/en/Challenges/Web-Server/Install-files)

When installing a framework, such as [phpBB](https://github.com/phpbb/phpbb), it's important to properly configure it and remove install files.
</div><div>
</div></div>