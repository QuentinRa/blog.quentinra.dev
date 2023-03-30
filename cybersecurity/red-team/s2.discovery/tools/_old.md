# 🔎 Nmap in practice 🔎

<div class="row row-cols-md-2"><div>

<p class="mt-3"><b>Stealth level</b></p>

You can set the intensity of the scan to decrease the risks of between detected by adding timing between requests from 0 to 5, while 0 means one request per 5 minutes <small>(paranoid (0), sneaky (1), polite (2), normal (3), aggressive (4), and insane (5))</small>. Note that T3 is the default, T0/T1 are usually used for stealth, T4 is the most used in CTFs, and T5 can be inaccurate as many packets may be lost.

```bash
$ nmap -vv scanme.nmap.org -T5 -p22
```

Other alternatives are `--min-rate/--max-rate` to set the rate per second, or `--min-parallelism/--max-parallelism` for the number of probes made in parallel.
</div><div>

<p class="mt-3"><b>Dig information</b></p>

* `-sV`: what are the services used by the open ports? What are their versions? <small>(ex: 80 $\to$ Apache x.xx.xx)</small>. May also guess the OS. You may set the intensity with `--version-intensity level` (from 0 to 9). There are shortcuts `--version-light` (2), and `--version-all` (9).
* `-sC`: execute default scripts <small>(find hostname, OS, computer name...)</small>
* `-O`: what's the operating system of the host, a bit unreliable
* `-A`: all the above, and some more
* The line `Service Info: Host: Os:` usually has some information.

```bash
$ nmap -sV scanme.nmap.org -vv
```
</div></div>

<hr class="sep-both">

## 👑 Other notes 👑

<div class="row row-cols-md-2 mt-4"><div>

**IP Spoofing**

Change the IP making the request. Beware that it's useless if you can't grab the response, either because you have control over the machine, or something like that.

```bash
$ nmap -S SOME_OTHER_IP
```
<span></span>

️🧟️ **Zombies/Idle** 🧟 | `-sI`.

A host idle is a host that is not making any requests, such as a printer. We can use it to make requests instead of us. Every packet has an ID that is usually incrementing by one at every request. We will query the zombie once to know the starting number, spoof a request using the zombie IP, then be querying again the packet ID, we will know if the host replied, or not.

**MAC spoofing**

You can also use someone else MAC, but it's only useful if you are on the same network, I admit I don't know why.

```bash
$ nmap --spoof-mac SPOOFED_MAC
```
</div><div>
<span></span>

**Decoys**

You can create decoys, i.e. make nmap create multiple packets with the same request but different IPs, with the hacker IP being one of them.

```bash
$ nmap -D A,B,YOUR_IP target
```

**Fragmentation**

You can fragment packets which may be used to bypass firewalls

```bash
$ nmap -f # create packets of 8 bytes or less
$ nmap -ff # create packets of 16 bytes or less
$ nmap --mtu xxx # maximum transfer unit (multiple of 8)
$ nmap --data-length length # split by length
```
</div></div>