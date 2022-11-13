# Host discovery

[![activerecon](../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

Host discovery is the core of the active reconnaissance (recon) activities. A hacker could other things such as getting in touch with employees, and trying to use social engineering to learn more about their company.

<div class="row row-cols-md-2"><div>

**Nmap** [See nmap](nmap/index.md)

Use **nmap** to find open ports, their services+version with `-sV`, the os with `-O` <small>(`-sV` too, if a service is talkative)</small>, the hostname / computer name, or some info that may be relevant with `-sC`.

You should also save the scans: it may take a long time, so you want to do it only once, and they can be imported in other tools too 🚀!

You can use it to find, and exploit vulnerabilities, or to bruteforce services such as SSH (see [bruteforce services](/cyber/exploitation/services/bruteforce.md#nmap)).

> CTF: Lunch at least a scan on all ports in the background while exploring the firsts interesting ports.
</div><div>

**Nessus** [See nessus](nessus/index.md)

Nessus is much like nmap, while providing a web interface, but a few differences are that you got way more information about the vulnerabilities, and how you can exploit them <small>(list of tools)</small>. On top of that, if you got credentials, you can also easily login, and scan the system from the inside.

Scans may be exported too, and imported in others tools, such as in `metasploit`.
</div></div>

> You may also use commands such as `ping` <small>(test if the host is up, and accepting ICMP packets)</small>, `traceroute/tracepath` which are using the TTL to know how much steps/hops it took for a packet to reach the target <small>(they increase the TTL by one, and try to get the intermediaries IPs as they respond that the packet was destroyed, but most aren't responding, so we got no information. Also, the route may change, as routers are always calculating the most optimal route)</small>.

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

## aquatone : visual inspection of websites

<div class="row row-cols-md-2"><div>

[aquatone](https://github.com/michenriksen/aquatone) (4.9k ⭐) is from what I understood, a tool that can automate the process of inspection the website on a port, given a (supposedly long) list of IP addresses.
</div><div>

It can take reports generated with nmap/masscan, and do its job.
</div></div>