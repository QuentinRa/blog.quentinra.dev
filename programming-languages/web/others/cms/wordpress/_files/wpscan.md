# WPScan

[![hackingwordpress](../../../../../../cybersecurity/_badges/htb/hackingwordpress.svg)](https://academy.hackthebox.com/course/preview/hacking-wordpress)
[![attacking_common_applications](../../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![webenumerationv2](../../../../../../cybersecurity/_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)

<div class="row row-cols-lg-2"><div>

[WPScan](https://wpscan.com/) is the most used tool to enumerate and attack WordPress. You can also use their [API](https://wpscan.com/api/) to automatically detect vulnerabilities.

* [GitHub](https://github.com/wpscanteam/wpscan) <small>(8.2k ⭐)</small>
* [User Documentation](https://github.com/wpscanteam/wpscan/wiki/WPScan-User-Documentation) <small>(⛪)</small>

Before every scan, update the local metadata database:

```ps
$ wpscan --update # may be automatically performed
$ wpscan --url URL
```

By default, it uses `-e`/`--enumerate` with `vp,vt,tt,cb,dbe,u,m`.

```ps
$ wpscan --url URL -e t,vt # themes | vulnerable themes
$ wpscan --url URL -e ap   # all plugins
$ wpscan --url URL -e p,vp # popular plugins | vulnerable plugins
$ wpscan --url URL -e u    # users
```
</div><div>

You can increase the number of threads:

```ps
$ wpscan [...] -t 5 # default
```

You may have to add `--random-user-agent` to bypass a simple WAF:

```ps
$ wpscan [...] --random-user-agent
```
</div></div>