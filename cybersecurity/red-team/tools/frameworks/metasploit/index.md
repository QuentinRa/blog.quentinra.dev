# Metasploit framework

[![metasploitintro](../../../../_badges/thm/metasploitintro.svg)](https://tryhackme.com/room/metasploitintro)
[![rpmetasploit](../../../../_badges/thm/rpmetasploit.svg)](https://tryhackme.com/room/rpmetasploit)
[![rpmetasploit](../../../../_badges/thmp/rpmetasploit.svg)](https://tryhackme.com/room/rpmetasploit)
[![metasploitexploitation](../../../../_badges/thmp/metasploitexploitation.svg)](https://tryhackme.com/room/metasploitexploitation)
[![meterpreter](../../../../_badges/thmp/meterpreter.svg)](https://tryhackme.com/room/meterpreter)
[![adventofcyber4](../../../../_badges/thm/adventofcyber4/day9.svg)](https://tryhackme.com/room/adventofcyber4)
[![metasploitframework](../../../../_badges/htb/metasploitframework.svg)](https://academy.hackthebox.com/module/details/39)

<div class="row row-cols-md-2"><div>

The [Metasploit Framework](https://github.com/rapid7/metasploit-framework) is a penetration testing framework that you can use to test a system.

Scripts to exploit vulnerabilities are written in Ruby 💎. There are many scripts already available.

**Learn** 🎓

* [Metasploit Documentation](https://docs.metasploit.com/)
* [Metasploit Unleashed](https://www.offensive-security.com/metasploit-unleashed/) 📌
</div><div>

Scripts are divided into **modules** 📌

* **Auxiliary**: test the availability of an exploit
* **Payloads**: the data sent to perform the attack
    * Single/inline/stageless payloads <small>(1 exchange)</small>
    * Staged payloads <small>(2 exchanges)</small>
    * See [msfvenom](/cybersecurity/red-team/s3.exploitation/shell/msfvenom.md) for details and payload creation.
* **Exploits**: code exploiting a vulnerability
* Encoders/Evasion/NOPs
* **Post**: scripts that you can use once on the target
</div></div>

<hr class="sep-both">

## msfconsole

<div class="row row-cols-md-2"><div>

The `msfconsole` is a component of the metasploit framework used to search and  configure modules to exploit a vulnerability, and eventually, spawn a remote shell, which may be a meterpreter shell.

```shell!
$ msfconsole -q
msf6> help
msf6> help <command>
msf6> help help # example
```

You can see every command you used with `history`.
</div><div>

* [Searching exploits](_files/msf_search.md) (`search`)
* [Learn about an exploit](_files/msf_info.md) (`info`)
* [Select an exploit](_files/msf_use.md) (`use`, `back`)
* [Configure an exploit](_files/msf_configuration.md) (`options`, `show`, `set`, `setg`, `unset`)
* [Execute an exploit](_files/msf_exploit.md) (`run`/`exploit`, `check`)

Each remote access is wrapped in a [session](_files/msf_session.md). 

You can also configure and execute an exploit in one go:

```shell!
exploit> run opt=value opt2=value [...]
exploit> check opt=value opt2=value [...] 
```
</div></div>

<hr class="sep-both">

## meterpreter

<div class="row row-cols-md-2"><div>

The meterpreter is one of the components of the metasploit framework. It's a reverse shell with common scripts loaded to make [Privilege escalation](/cybersecurity/red-team/s4.privesc/index.md) and [Post-exploitation](/cybersecurity/red-team/s5.post-exploitation/index.md) easier.

It's an  **in-memory** reverse shell using encrypted communications. To upgrade a normal shell <small>(note down the sid when using `background`)</small>, use:

```ps
# upgrade
msf6 exploit('module_used')> sessions -u -1
# kill the non-meterpreter session
msf6 exploit('module_used')> sessions -k old_session_id
# move to the meterpreter session
msf6 exploit('module_used')> sessions -i new_session_id
# done
meterpreter>
```
</div><div>

**Commands that you can use in the meterpreter are different based on the payload that you used.**

Call `help` to see what you can use given the current payload.

```bash
meterpreter > help # list commands that you can use
```

<br>

**Common commands** 🪴

* [Basic commands](_files/msf_common.md)
* [Exploitation commands](_files/msf_exploitation.md)
* [Post-exploitation commands](_files/msf_post.md)

</div></div>

<hr class="sep-both">

## Uncommon usages

<div class="row row-cols-md-2"><div>

#### Metasploit database

```shell!
$ sudo systemctl start postgresql
$ sudo msfdb init
$ msfconsole -q
msf6> db_status
[*] Connected to msf. Connection type: postgresql.
```

You can export results using: `db_export -f xml db.xml`.

<br>

#### workspaces

To keep things clean and tidy, it's better to create a workspace, so that results from other scans don't get mixed up.

```shell!
msf6> workspace # list workspaces
msf6> workspace -a xxx # create xxx
msf6> workspace xxx # move to xxx
msf6> workspace -d xxx # delete xxx
```

<br>

#### port scanner

The command `db_nmap` is the same as `nmap`. You will have to first set up [metasploit database](#metasploit-database).

```shell!
msf6> db_nmap -sV -p- -A IP
msf6> db_import nmap_result.xml # or, load scan result
```

<br>

#### banner grabbing

```shell!
msf6> use auxiliary/scanner/http/http_version # HTTP
```
</div><div>

#### SQL utility

```shell!
msf6> use auxiliary/scanner/mysql/mysql_schemadump # dump cols+tables
msf6> use auxiliary/scanner/mysql/mysql_hashdump # dump dump users+hash
msf6> use mysql_sql # send SQL queries
msf6> use auxiliary/scanner/postgres/postgres_schemadump # ...
msf6> use auxiliary/admin/postgres/postgres_sql # ...
```

<br>

#### nessus

The msfconsole can be used along [Nessus](/cybersecurity/red-team/tools/scanners/vulns/nessus.md). See [this tutorial](https://scubarda.com/2015/11/16/launching-nessus-scans-inside-metasploit/) and [these tips](https://www.offensive-security.com/metasploit-unleashed/working-with-nessus/). Note that you need to start [metasploit database](#metasploit-database) first.

```shell!
msf6> load nessus
msf6> nessus_help # list commands
msf6> # Connect
msf6> nessus_connect user:pass@localhost:8834
msf6> # List the scans that you did
msf6> nessus_scan_list
msf6> # Import the result of a scan
msf6> nessus_db_import id_you_found_in_the_list
```

#### Useful commands

Once you stored something in the database (nmap/nessus/...), you can use these commands to operate on the saved data.

```shell!
msf6> help hosts
msf6> help services
msf6> help vulns
msf6> help creds
msf6> help loot
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Commands:
  * Jobs are cancellable processes (`kill`): `run -j`, `jobs`, `jobs -i 0`
  * `exploit -k -z`
* `get xxx`
* `spool`
* `run autoroute -h` (autoroute module)
  * socks
  * proxychains
</div><div>

* [Web delivery](https://www.offsec.com/metasploit-unleashed/web-delivery/)
* [MSF Guide](https://gitlab.com/goron/security_whitepapers/-/blob/f2e1a7a522240ad3cd9e238237342b328b1fd162/the-easiest-metasploit-guide-youll-ever-read.pdf)
* [Multiple Ways to Bypass UAC using Metasploit](https://www.hackingarticles.in/multiple-ways-to-bypass-uac-using-metasploit/)

You can prepend any command using `grep` to filter lines. You can chain them too. `grep x grep y <command>`.

* Meterpreter: `steal_token <pid>`
* Hashdump not working on some Windows: `load kiwi` then `lsa_dump_sam` do the job. See also: `lsa_dump_secrets`.
* Plugins: `/usr/share/metasploit-framework/plugins`
</div></div>