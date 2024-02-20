# Remote Desktop Protocol (RDP)

[![windowsfundamentals](../../../cybersecurity/_badges/htb/windowsfundamentals.svg)](https://academy.hackthebox.com/course/preview/windows-fundamentals)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

Remote Desktop Protocol (RDP) is a protocol used to access a  desktop with a graphical interface from another computer over a network connection.

🐊️ **Port**: 3389 <small>(TCP or rarely UDP)</small>

On Windows, there is the built-in Windows RDP Client: `mstsc.exe`.

There is [rdesktop](https://github.com/rdesktop/rdesktop) (1.1k ⭐).

There is [FreeRDP](https://github.com/FreeRDP/FreeRDP) (7.5k ⭐), and there is a graphical version too [xfreerdp-gui](https://github.com/wyllianbs/xfreerdp-gui) (29 ⭐).

```shell!
$ xfreerdp /u:username /p:password /v:IP
$ xfreerdp /u:username /pth:hash /v:IP
$ xfreerdp /dynamic-resolution +clipboard /timeout:50000 /cert:ignore /v:IP /u:x /p:y
```
</div><div>

There is [Remmina](https://github.com/FreeRDP/Remmina) (1.9k ⭐, `apt install remmina`) which has an easy-to-use graphical interface.

* `remmina`: start the graphical interface
  * Enter the IP of the target
  * Enter the credentials
  * Connect
* Then, I would advise toggling "dynamic resolution update" in the left menu, so that you have a bigger screen.
* In preferences, we should be able to select a keyboard mapping <nobr class="small text-muted">(⚠️ need check)</nobr>
* [You can scale the screen too](https://askubuntu.com/questions/1075098/remmina-scaling-options)
</div></div>

<hr class="sep-both">

## RDP Pentester Notes ☠️

[![passwordattacks](../../../cybersecurity/_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

<div class="row row-cols-lg-2"><div>

#### Enumeration

* Using [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) to run scripts

```ps
$ # nmap RDP cookies are leaving traces (--packet-trace)
$ sudo nmap -sV -sC -p 3389 --script rdp* 10.129.201.248
```

#### Foothold

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md).

```shell!
$ hydra -L user.list -P password.list rdp://IP -V
$ crowbar -b rdp -s IP/32 -u username -C password.list -v -n 64
```

There is also [RDPassSpray](https://github.com/xFreed0m/RDPassSpray) <small>(0.6k ⭐)</small>.

```ps
$ python3 RDPassSpray.py -u username -p password -t IP:port
$ python3 RDPassSpray.py -U usernames.lst -p password -t IP:port
$ python3 RDPassSpray.py [...] -d domain
$ python3 RDPassSpray.py [...] -T rdp_servers.lst
```
</div><div>

#### Well-known CVEs

* [BlueKeep Vulnerability](https://en.wikipedia.org/wiki/BlueKeep) (2019)

#### Additional Tools

* [rdp-sec-check.pl](https://github.com/CiscoCXSecurity/rdp-sec-check) <small>(0.2k ⭐, 2021 🪦)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* ms-wbt-server (Windows RDP implementation)
* [Network Level Authentication (NLA)](https://en.wikipedia.org/wiki/Remote_Desktop_Services#Network_Level_Authentication)
</div><div>
</div></div>