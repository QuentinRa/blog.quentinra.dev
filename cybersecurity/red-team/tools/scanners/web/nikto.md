# Nikto

[![webenumerationv2](../../../../_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)
[![adventofcyber4](../../../../_badges/thm/adventofcyber4/day4.svg)](https://tryhackme.com/room/adventofcyber4)
[![ccpentesting](../../../../_badges/thm-p/ccpentesting.svg)](https://tryhackme.com/room/ccpentesting)

<div class="row row-cols-lg-2"><div>

[Nikto](https://github.com/sullo/nikto) <small>(7.7k ⭐)</small> is a common website vulnerability scanning tool:

* 💥 to find known vulnerabilities
* 🔏 to find known misconfigurations
* 💀 to find outdated software
* 💵 to find sensitive files
* ...

See also [Plugins](https://github.com/sullo/nikto/wiki/Plugin-list) such as `robots`, or `cgi`...
</div><div>

Usage:

```ps
$ nikto -h URL
$ nikto [...] -p 80,8000,8080 # ports
$ nikto [...] -Display V      # ex: verbose
$ nikto [...] -Tuning 9       # ex: SQL injection
```
</div></div>