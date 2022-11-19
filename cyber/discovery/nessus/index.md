# Nessus vulnerability scanner

[![rpnessusredux](../../_badges/thm/rpnessusredux.svg)](https://tryhackme.com/room/rpnessusredux)

<div class="row row-cols-md-2"><div>

**Nessus vulnerability scanner** is a tool to find, and report vulnerabilities.

* [Download Nessus](https://www.tenable.com/downloads/nessus)

```bash
$ sudo dpkg -i  Nessus-10.3.0-ubuntu1404_amd64.deb
$ sudo systemctl start nessusd.service
```

* Open `https://localhost:8834/`
* [You will need an activation code](https://www.tenable.com/products/nessus/nessus-essentials)
</div><div>

Once you are logged on the website, you can create new scans.

* **Host Discovery**: find alive hosts
* **Basic network scan**: sort of nmap
* **Web application test**: see vulnerabilities in your web app

Most scans have the following options

* Set a target
* In Discovery, you can select a range of ports
* In Assessment, you can select the kind of scan
* In Advanced, you may go for a "low bandwidth scan"
* In the credential tabs, you can log in to an account.
* **Launch**: explore vulnerabilities to see results

It's important to note that Nessus is generating a lot of traffic, and may not find every vulnerability, so you shouldn't grow dependant of it, and do things "manually" when you can.

</div></div>

> **Note**: if you have a scope/knowledge of specific ports/... to scan, you can define a policy in the Policy tab.<br>

<hr class="sep-both">

## 🥳 metasploit and nessus ⚡

[See metasploit framework](/cyber/exploitation/general/metasploit/index.md)

<div class="row row-cols-md-2"><div>

To be honest, it was way more useful to explore results in nessus web interface, but if you don't have one, then this is surely something useful.

![nessus_exploit_with](_images/nessus_exploit_with.png)

First, start a msf database

```bash
$ sudo systemctl start postgresql
$ sudo msfdb init
# I got some errors, but it still works
```

Then in your msfconsole

```bash
$ msfconsole -q
msf6 > db_status # check if connected
[*] Connected to msf. Connection type: postgresql.
```
</div><div>

Everything below is coming from [this tutorial](https://scubarda.com/2015/11/16/launching-nessus-scans-inside-metasploit/), but metasploit unleashed has also [some tips](https://www.offensive-security.com/metasploit-unleashed/working-with-nessus/).

```bash
msf6 > load nessus
# Connect
msf6 > nessus_connect user:pass@localhost:8834
# List the scans that you did
msf6 > nessus_scan_list
# Import the result of a scan
msf6 > nessus_db_import id_you_found_in_the_list
```

Once you did, there a few commands you can use

* `services`: see what services the target run
* `vulns`: see vulnerabilities
* `vulns -s ftp`: see ftp vulnerabilities
* `vulns -S keyword`: see vulnerabilities including keyword
* ...

Once you found a vulnerability, process as usual.
</div></div>