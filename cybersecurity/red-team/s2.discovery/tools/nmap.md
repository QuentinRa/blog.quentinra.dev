# Nmap

[![nmap01](../../../_badges/thm/nmap01.svg)](https://tryhackme.com/room/nmap01)
[![nmap02](../../../_badges/thmp/nmap02.svg)](https://tryhackme.com/room/nmap02)
[![nmap03](../../../_badges/thmp/nmap03.svg)](https://tryhackme.com/room/nmap03)
[![nmap04](../../../_badges/thmp/nmap04.svg)](https://tryhackme.com/room/nmap04)
[![furthernmap](../../../_badges/thm/furthernmap.svg)](https://tryhackme.com/room/furthernmap)
[![vulnversity](../../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![blue](../../../_badges/thm-p/blue.svg)](https://tryhackme.com/room/blue)
[![ice](../../../_badges/thm-p/ice.svg)](https://tryhackme.com/room/ice)
[![blaster](../../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)
[![kenobi](../../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![rrootme](../../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![basicpentestingjt](../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![netsecchallenge](../../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)
[![startup](../../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![cowboyhacker](../../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)
[![steelmountain](../../../_badges/thmp-p/steelmountain.svg)](https://tryhackme.com/room/steelmountain)

<div class="row row-cols-md-2"><div>

nmap <small>([nmap book](https://nmap.org/book/), [GitHub](https://github.com/nmap/nmap) 7.1k ⭐)</small> is the most popular tool to scan hosts and map a network. This includes

* 🔎 Detecting open ports <small>(+may find the running protocol and version)</small>
* 📻 Guessing the host operating system
* 💥 Exploiting vulnerabilities in some protocols
* ...

➡️ There is a graphical version called [ZenMap](https://nmap.org/zenmap/).
</div><div>

According to nmap, a [port](/operating-systems/networking/knowledge/index.md#ports) can be 

* `open`: can be reached
* `filtered`: no response, usually meaning there is a firewall
* `unfiltered`: nmap can't determine if the port is open, or filtered
* `closed`: cannot be reached

Once you found a port, refer to the [protocols](/operating-systems/networking/knowledge/index.md#protocols) section to find more about each protocols and its vulnerabilities.
</div></div>

<hr class="sep-both">

## Basic usage 🐈

<div class="row row-cols-md-2"><div>

nmap is quite complex. First, provide some **hosts**. We can use `scanme.nmap.org` for testing purposes. 

```ps
$ nmap scanme.nmap.org
```

##### Scan type

nmap has many types of scans. Each type is a flag starting with `s` such as `-sT` or `-sS`.

```ps
$ nmap -sT [...] # no root required for sT
$ sudo nmap -sS [...] # root required for sS
```

##### Verbosity

As scans are usually slow, we usually increase the verbosity to know what's happening. You can use `-v`, `-vv`, `-d`, and `-dd`.

```ps
$ nmap -vv [...]
```

📌 You can press <kbd>Enter</kbd> during a scan in progress to prompt the progression of the scan.
</div><div>

##### Store results

To avoid losing the result, especially as it takes time, and we may work a lot on it, you should **store** it.

```ps
$ nmap [...] > output_file_name # 🤔
$ nmap [...] -oA output_file_name # all formats
$ nmap [...] -oN output_file_name # .nmap
$ nmap [...] -oG output_file_name # grep-able
$ nmap [...] -oX output_file_name # xml
```

##### Port range

We often only limit the scan to some **ports**. By default, the top 1000 most common ports are randomly tested.

```ps
$ nmap [...] -F # Fast, only top 100
$ nmap [...] -p 22 # only port 22
$ nmap [...] -p 22,23 # both 22, and 23
$ nmap [...] -p 0-65535 # from x to y
$ nmap [...] -p- # same as 0-65535
$ nmap [...] -p22-25,80,443 # mix
$ nmap [...] -top-ports 20 # top 20
```

➡️ Use `-r` to sequentially test ports.
</div></div>

<hr class="sep-both">

## Additional notes on the host 🎯

<div class="row row-cols-md-2 mt-4"><div>

Nmap can scan one or more hosts

```bash
$ nmap 127.0.0.1
$ nmap 192.168.0.1-254 # from 1 to 254
$ nmap 192.168.0.0/24 # same
$ nmap scanme.nmap.org scanme.nmap.org # list
$ nmap -iL hosts.txt
```

If you don't want `nmap` to fetch DNS records, use `-n`. You can use `-R` to force `nmap` to query DNS servers.

```bash
$ nmap -n 10.10.12.13
# won't look for the domain associated with this IP
```
</div><div>

You can use `-sL` to list every host that will be scanned.

```bash
$ nmap -sL -n 92.168.0.1/29
# Nmap scan report for 92.168.0.0
# [...]
# Nmap scan report for 92.168.0.7
# Nmap done: 8 IP addresses (0 hosts up) scanned in 0.01 seconds
```

👉 This may be useful to know how many hosts will be scanned.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>