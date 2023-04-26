# Nikto

[Go back](../index.md)

[![webenumerationv2](../../../_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)

<div class="row row-cols-md-2"><div>

[Nikto](https://github.com/sullo/nikto) (6.6k ⭐) is a common website vulnerability scanning tool:

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
$ nikto [...] -Display V # ex: verbose
$ nikto [...] -Tuning 9 # ex: SQL injection
```
</div></div>