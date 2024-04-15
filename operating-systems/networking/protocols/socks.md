# SOCKS

[![usingwebproxies](../../../cybersecurity/_badges/htb/usingwebproxies.svg)](https://academy.hackthebox.com/course/preview/using-web-proxies)
[![pivoting_tunneling_port_forwarding](../../../cybersecurity/_badges/htb/pivoting_tunneling_port_forwarding.svg)](https://academy.hackthebox.com/course/preview/pivoting-tunneling-and-port-forwarding)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day9.svg)](https://tryhackme.com/room/adventofcyber4)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)

<div class="row row-cols-lg-2"><div>

Secure Socket (SOCKS) is a protocol to exchange data through a [proxy](../topology/devices/proxy.md) server called SOCKS proxy. It operates at the session layer <small>(layer 5)</small>.

🐊️ **Port**: 1080 (TCP) or 9050/9150 (TCP) with Tor

You can run a SOCKS proxy using [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md):

```shell!
msf6> # first, open a meterpreter to the target
```
```shell!
meterpreter> run auxiliary/server/socks_proxy VERSION=4a SRVPORT=9050
meterpreter> run autoroute -p
meterpreter> run autoroute -s 172.16.5.0/23 # can now be used with proxychains
msf6> route print # list current routes
msf6> route add IP/32 -1 # add one IP, can be a range, routed through the last (-1) session 
```
</div><div>

Once a SOCKS proxy is started, you can use it with either

* The `--proxy` flag, if it's supported:

```ps
$ curl --proxy socks4a://localhost:9050 [...]
```

* The `proxychains` wrapper:

```ps
$ cat /etc/proxychains.conf # /etc/proxychains4.conf
$ proxychains [Some command]
$ proxychains -q [Some command]
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `socks4://IP:port`
* Config: `http 127.0.0.1 8080`, `socks4 127.0.0.1 9050`
* [check.torproject.org](https://check.torproject.org/)
</div><div>
</div></div>