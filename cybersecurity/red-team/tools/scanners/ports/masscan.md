# Masscan

[![nmap01](../../../../_badges/thm/nmap01.svg)](https://tryhackme.com/room/nmap01)

<div class="row row-cols-lg-2"><div class="align-self-center">

* `masscan` is a relatively fast, quite aggressive, [port scanner](/cybersecurity/red-team/s2.discovery/techniques/network/port_scanning.md).
* [Masscan GitHub](https://github.com/robertdavidgraham/masscan) <small>(22.4k ⭐)</small>
* Most options are the same as in nmap (see `masscan --nmap`)
* It uses a TCP SYN Scan.
</div><div>

```shell!
$ host scanme.nmap.org  
scanme.nmap.org has address 45.33.32.156
$ sudo masscan -p- 45.33.32.156
$ sudo masscan -p21 45.33.32.156
$ sudo masscan -p21,22 45.33.32.156
$ sudo masscan -p21-25 45.33.32.156
$ sudo masscan --top-ports 10 45.33.32.156
$ sudo masscan --top-ports 10 --rate 1000 45.33.32.156
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```ps
$ masscan -p- IP --rate=1000 -e tun0 > ports
```
</div><div>
</div></div>