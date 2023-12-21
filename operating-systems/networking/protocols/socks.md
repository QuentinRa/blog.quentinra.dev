# SOCKS

[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day9.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Secure Socket (SOCKS) is a protocol to exchange data through a [proxy](../topology/devices/proxy.md) server called SOCKS proxy. It operates at the session layer <small>(layer 5)</small>.

🐊️ **Port**: 1080 (TCP) or 9050/9150 (TCP) with Tor

You can run a SOCKS proxy using [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md):

```shell!
msf6> route print # list current routes
msf6> route add IP/32 -1 # add one IP, can be a range, routed through the last (-1) session 
msf6> use auxiliary/server/socks_proxy
exploit> run srvhost=127.0.0.1 srvport=9050 version=4a 
```
</div><div>

Once a SOCKS proxy is started, you can use it with either

* The `--proxy` flag, if it's supported

```ps
$ curl --proxy socks4a://localhost:9050 [...]
```

* The `proxychains` wrapper

```ps
$ proxychains [Some command]
$ proxychains -q [Some command]
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `socks4://IP:port`
* [check.torproject.org](https://check.torproject.org/)
</div><div>
</div></div>