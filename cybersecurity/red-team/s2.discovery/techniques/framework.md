# Framework Detection

[Go back](../index.md)

<div class="row row-cols-lg-2"><div>

Developers often use framework to write websites faster and more easily, as they provide pre-written common features.

<br>

#### Manually find a framework

[![contentdiscovery](../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)

* Look if the framework is credited at the bottom of the page
* Look if there is an HTML comment with the framework name/...
* Look for the default favicon of the framework. Usually, it's stored at `/favicon.ico`, although it's usually removed. If you do find one, download it, hash it (MD5), and [find it in OWASP favicon database](https://wiki.owasp.org/index.php/OWASP_favicon_database)

```ps
# Linux
curl url/favicon.ico | md5sum
# Windows (on a download favicon)
Get-FileHash .\favicon.ico -Algorithm MD5
```
</div><div>

#### Tools to find frameworks

You can use automated tools to try to detect frameworks:

* [wappalyzer](../tools/wappalyzer.md): plugin/website
* [whatweb](../tools/scanners/whatweb.md): command

<br>

#### Once a framework is detected

![getsimplecms](../../../_badges/htb-p/getsimplecms.svg)

* Try to find the version <small>(comments, check the dependencies, features...)</small>
* Look for the login page / CMS panel (if any)
* Look for common misconfiguration mistakes

You may move to the [Exploit a framework section](/cybersecurity/red-team/s3.exploitation/techniques/framework.md) as both enumeration and exploitation are closely linked.
</div></div>