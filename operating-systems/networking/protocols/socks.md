# SOCKS

[![usingwebproxies](../../../cybersecurity/_badges/htb/usingwebproxies.svg)](https://academy.hackthebox.com/course/preview/using-web-proxies)
[![pivoting_tunneling_port_forwarding](../../../cybersecurity/_badges/htb/pivoting_tunneling_port_forwarding.svg)](https://academy.hackthebox.com/course/preview/pivoting-tunneling-and-port-forwarding)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day9.svg)](https://tryhackme.com/room/adventofcyber4)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)

<div class="row row-cols-lg-2"><div>

Secure Socket (SOCKS) is a protocol to exchange data through a [proxy](../topology/devices/proxy.md) server called SOCKS proxy. It operates at the session layer <small>(layer 5)</small>.

🐊️ **Port**: 1080 (TCP) or 9050/9150 (TCP) with Tor.


It has multiple limitations. SOCKS4 doesn't understand partial packets which we often generate using `nmap`. SOCKS4 doesn't support UDP.
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

## Start a SOCKS Proxy

<div class="row row-cols-lg-2"><div>

#### SOCKS Proxy With Metasploit

[![pivoting_tunneling_port_forwarding](../../../cybersecurity/_badges/htb/pivoting_tunneling_port_forwarding.svg)](https://academy.hackthebox.com/course/preview/pivoting-tunneling-and-port-forwarding)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)

You can run a SOCKS proxy using [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md):

```shell!
msf6> use auxiliary/server/socks_proxy # configure it
```

If you have a meterpreter, you can use:

```shell!
meterpreter> run auxiliary/server/socks_proxy VERSION=4a SRVPORT=9050
meterpreter> run autoroute -p
meterpreter> run autoroute -s 172.16.5.0/23 # can now be used with proxychains
msf6> route print # list current routes
msf6> route add IP/32 -1 # add one IP, can be a range, routed through the last (-1) session 
```

#### 3proxy on Windows

[3proxy](https://github.com/3proxy/3proxy) <small>(3.5k ⭐)</small> is similar to Proxifier, but it's free and it works on Linux too. It doesn't redirect PowerShell traffic.

```shell!
PS> cd "3proxy-0.9.4-x64\bin64"
PS> set /p "=socks -p9050" > .\3proxy.cfg
PS> .\3proxy.exe
```
</div><div>

#### Proxifier on Windows

There is no such thing as `proxychains` on Windows, but [Proxifier](https://www.proxifier.com/) <small>(paid 💵)</small> may be used. Once started, it can redirect all requests such as RDP requests to a host (`172.16.5.5`) to our proxy at `localhost:9050`.

⚠️ It doesn't seem to redirect traffic from PowerShell.

#### Additional Socks Servers

* [proxychains-ng](https://github.com/rofl0r/proxychains-ng) <small>(9.4k ⭐)</small>
* [shinysocks](https://github.com/jgaa/shinysocks) <small>(0.1k ⭐)</small>
* [revsocks](https://github.com/kost/revsocks) <small>(0.3k ⭐)</small>
* [wiresocks](https://github.com/sensepost/wiresocks) <small>(0.3k ⭐)</small>
* [tun2socks](https://github.com/xjasonlyu/tun2socks) <small>(2.7k ⭐)</small>
* [redsocks](https://github.com/darkk/redsocks) <small>(3.2k ⭐, 2019 🪦)</small>
* [pivotnacci](https://github.com/blackarrowsec/pivotnacci) <small>(0.6k ⭐, 2021 🪦)</small>
* [graftcp](https://github.com/hmgle/graftcp) <small>(1.8k ⭐)</small>
* [gost](https://github.com/ginuerzh/gost/blob/master/README_en.md) <small>(15.1k ⭐)</small>
* [sshimpanzee](https://github.com/lexfo/sshimpanzee) <small>(0.0.2k ⭐)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `socks4://IP:port`
* Config: `http 127.0.0.1 8080`, `socks4 127.0.0.1 9050`
* [check.torproject.org](https://check.torproject.org/)

```ps
$ cat config
[ProxyList]
socks5 127.0.0.1 1080
$ proxychains -f config [...]
```
</div><div>
</div></div>