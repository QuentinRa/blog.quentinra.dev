# Discovery

<div class="row row-cols-md-2"><div>

If there is a website, check the [webserver methodology](/_cybersecurity/exploitation/web/methodology.md) to learn more about how you could find vulnerabilities and exploit them 🗺️.

</div><div>

There are a lot of ways to perform its discovery 

* `ping`: test if the host is up, and accepting ICMP packets. Useful to find if the flag `-Pn` must be used in `nmap`.

* **Nmap** ([course](nmap/index.md)): to find open ports, their services+version with `-sV`, the OS with `-O` or `-sV`, and try to exploit vulnerabilities

* **Nessus** ([course](nessus/index.md)): find open ports and their vulnerabilities. This is a local website that can be used when needing an automated scan, albeit noisy, and somewhat slow.

* `traceroute/tracepath` which are using the TTL to know how many steps/hops it took for a packet to reach the target <small>(they increase the TTL by one, and try to get the intermediaries IPs as they respond that the packet was destroyed, but most aren't responding, so we got no information. Also, the route may change, as routers are always calculating the most optimal route)</small>.
</div></div>

> CTF 🌟: Lunch at least a scan on all ports in the background while exploring the first interesting ports. See [Rustscan below](#rustscan).

<hr class="sep-both">

## MASSCAN: Mass IP port scanner

[![nmap01](../_badges/thm/nmap01.svg)](https://tryhackme.com/room/nmap01)

<div class="row row-cols-md-2"><div class="align-self-center">

* `masscan` is a fast, quite aggressive, port scanner.
* [Masscan GitHub](https://github.com/robertdavidgraham/masscan)
* Most options are the same as in nmap (see `masscan --nmap`)
* It uses a TCP SYN Scan.
</div><div>

```bash
$ masscan scanme.nmap.org -p21
$ masscan scanme.nmap.org -p21,22
$ masscan scanme.nmap.org -p21-25
$ masscan scanme.nmap.org ‐‐top-ports 100
$ masscan scanme.nmap.org ‐‐top-ports 100 --rate 1000
```
</div></div>

<hr class="sep-both">

## aquatone: visual inspection of websites

<div class="row row-cols-md-2"><div>

[aquatone](https://github.com/michenriksen/aquatone) (4.9k ⭐) is from what I understood, a tool that can automate the process of inspecting the website on a port, given a (supposedly long) list of IP addresses.
</div><div>

It can take reports generated with nmap/masscan, and do its job.
</div></div>

<hr class="sep-both">

## Rustscan

<div class="row row-cols-md-2"><div class="align-self-center">

[RustScan](https://github.com/RustScan/RustScan) (8.4k ⭐) is a very fast and noisy port scanner designed for CTFs. You can scan all 65k ports in a few seconds.

It's not installed by default on Kali. First, search for the latest `.deb` that you can find on their [release page](https://github.com/RustScan/RustScan/releases).

```bash
# there wasn't the .deb for the latest
$ wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
$ sudo dpkg -i rustscan_2.0.1_amd64.deb
```
</div><div class="align-self-center">

Basic usage

```bash
$ rustscan -a IP --ulimit 10000
```

```bash
$ rustscan -a IP -p 21
$ rustscan -a IP -p 21,22,80
$ rustscan -a IP --range 1-1023
# add "--" before nmap options
$ rustscan -a IP -- -sC -A
$ rustscan -a IP -- -sV
```
</div></div>