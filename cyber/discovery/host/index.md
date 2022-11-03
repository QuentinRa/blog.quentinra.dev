# Host discovery

[![activerecon](../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

Host discovery is the core of the active reconnaissance (recon) activities. A hacker could other things such as getting in touch with employees, and trying to use social engineering to learn more about their company.

<div class="row row-cols-md-2"><div>

**Nmap** [See nmap](nmap/index.md)

Use **nmap** to find open ports, their services+version with `-sV`, the os with `-O` <small>(`-sV` too, if a service is talkative)</small>, the hostname / computer name, or some info that may be relevant with `-sC`.

You should also save the scans: it may take a long time, so you want to do it only once, and they can be imported in other tools too 🚀!

You can use it to find, and exploit vulnerabilities, or to bruteforce services such as SSH (see [bruteforce services](../../random/crack_password/services.md#nmap)).

> CTF: Lunch at least a scan on all ports in the background while exploring the first interesting ports.
</div><div>

**Nessus** [See nessus](nessus/index.md)

Nessus is much like nmap, while providing a web interface, but a few differences are that you got way more information about the vulnerabilities, and how you can exploit them <small>(list of tools)</small>. On top of that, if you got credentials, you can also easily login, and scan the system from the inside.

Scans may be exported too, and imported in others tools, such as in `metasploit`.
</div></div>

> You may also use commands such as `ping` <small>(test if the host is up, and accepting ICMP packets)</small>, `traceroute/tracepath` which are using the TTL to know how much steps/hops it took for a packet to reach the target <small>(they increase the TTL by one, and try to get the intermediaries IPs as they respond that the packet was destroyed, but most aren't responding, so we got no information. Also, the route may change, as routers are always calculating the most optimal route)</small>.

<hr class="sl">

## Manual mapping

<div class="row row-cols-md-2"><div>

`nmap` bellow is doing a lot of stuff for us, and it may be worthwhile to know a bit more about how you could fetch such information manually.

**telnet** (TCP): telnet can be used to send cleartext to an HOST. You will have to "talk" in the protocol running on this port language defined in the RFC through, but when you manage too, you may find some stuff like the OS/the service running.

```bash
$ telnet ip port
# Example in HTTP
GET / HTTP/1.1
HOST: random_value

# after two <CR>, you will receive a response (hopefully)
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
# ...
```
</div><div>

Of course, as it's HTTP, you can use `curl`!

```bash
$ curl -I ip:port
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
# ...
```

You can also do the same with **netcat**, the difference with telnet being that you can connect to TCP, and UDP ports, and `ncat` support encryption (SSL).

```bash
$ nc ip 21
[...] FTP server (Version 6.4/OpenBSD/Linux-ftpd-0.17) ready.
```

Of course, in practice, it's no as easy on top of taking a long time, so you should definitely use `nmap` and/or `nessus`.

</div></div>

<hr class="sr">

## MASSCAN: Mass IP port scanner

[![nmap01](../../_badges/thm/nmap01.svg)](https://tryhackme.com/room/nmap01)

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