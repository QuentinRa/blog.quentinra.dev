# Masscan

[![nmap01](../../../../_badges/thm/nmap01.svg)](https://tryhackme.com/room/nmap01)

<div class="row row-cols-lg-2"><div class="align-self-center">

* `masscan` is a fast, quite aggressive, port scanner.
* [Masscan GitHub](https://github.com/robertdavidgraham/masscan) (22.1k ⭐)
* Most options are the same as in nmap (see `masscan --nmap`)
* It uses a TCP SYN Scan.
</div><div>

```shell!
$ masscan scanme.nmap.org -p21
$ masscan scanme.nmap.org -p21,22
$ masscan scanme.nmap.org -p21-25
$ masscan scanme.nmap.org ‐‐top-ports 100
$ masscan scanme.nmap.org ‐‐top-ports 100 --rate 1000
```
</div></div>