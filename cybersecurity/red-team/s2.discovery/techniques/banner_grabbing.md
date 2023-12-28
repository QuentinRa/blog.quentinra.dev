# Banner grabbing

[Go back](../index.md)

[![activerecon](../../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)
[![netsecchallenge](../../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)

<div class="row row-cols-lg-2"><div>

Banner grabbing refer to manually probing a service to find information about it in the banner they send. There may not be anything useful. This done automatically by tools such as `nmap` along other checks, so we usually **don't do it** ☠️.

You can use `telnet` for TCP, and `netcat` for both TCP/UDP.
</div><div>

```shell!
$ telnet IP 21
[...] FTP server (Version 6.4/OpenBSD/Linux-ftpd-0.17) ready.
```

```shell!
$ nc IP 21
[...] FTP server (Version 6.4/OpenBSD/Linux-ftpd-0.17) ready.
```
</div></div>