# SQLMap

![Usage: Map DataBase](https://img.shields.io/badge/usage-Map%20DataBase-ffd700)

From the [SQLMap GitHub Repository](https://github.com/sqlmapproject/sqlmap): "sqlmap is an open source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws and taking over of database servers.".

```py
# try login.php
sqlmap -u "https://xxx.tld/login.php"
# try to dump the table USERS in the database xxx
sqlmap -u "https://xxx.tld/login.php" -D xxx -T USERS –dump
```

<details class="details-e">
<summary>Parameters</summary>

* `--url URL_TO_TEST`: test a URL in which we may find a SQL injection
* `-r request_file`: if you saved a request (ex: BurpSuite > Save item), you can use that instead of `--url`, **that your antivirus may block**.
* `--dbs`: display all databases
* `--tables`: display tables
* `--column`: display columns
* `-C xx, yy`: display only columns xx, and yy
* `--dbms=some_dmbs`: to increase the chances of success, specify the dbms
* `-D db_name`: the name of the database
* `--time-sec timeout`: specify a timeout
* `--dump`: save current data
* `--dump-all`: save all data
* `--batch`: do all requests at once (do not way for input)
</details>

When starting the command, you will have to do some choices.

* You should try doing both with, and without union tests, to see which one is better in your current case
* "GET xxx is vulnerable" (resp. POST): you should answer yes if you want to exploit the vulnerable parameter
* [SQLMap CheatSheet](https://www.security-sleuth.com/sleuth-blog/2017/1/3/sqlmap-cheat-sheet) (external)

<hr class="sl">

## enum4linux

![Usage: Enumerating Information](https://img.shields.io/badge/usage-Enumerating%20Information-ffd700)

I don't know if there is still an `enum.exe`, because I can't find it, but you can use the tool [enum4linux](https://github.com/CiscoCXSecurity/enum4linux) for enumerating information from Windows, and Samba hosts.

```bash
$ ./enum4linux.pl <options> <ip>
# -U : list of users
# -M : list of devices
# -S : list of shares
# -o : os data
# -i : printer data
# -v : verbose
```

<hr class="sl">

## Volatility

![Usage: Forensics tool](https://img.shields.io/badge/usage-Forensics%20tool-ffd700)

<div class="row row-cols-md-2"><div>

Volatility is a free memory forensics tool.

<details class="details-e">
<summary>Install on Linux</summary>

It wouldn't work with `apt-get install volatility` on Kali-2022, so I had to do things manually, and it was tiring because it uses python2. There is a version for [python3](https://github.com/volatilityfoundation/volatility3/tree/stable) in development.

* `git clone https://github.com/volatilityfoundation/volatility.git`
* First patch ([source](https://alvinisonline.medium.com/volatility-importerror-no-module-named-crypto-hash-e515092fd8e3))
  * `curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py`
  * `sudo python2 get-pip.py`
  * `sudo apt-get install build-essential libssl-dev libffi-dev python2-dev`
* Second patch
  * `pip2 install pycryptodome`
  * `pip2 install --upgrade setuptools`
  * `pip2 install distorm3`
  * `python2 vol.py -h`
* You should add an alias: `alias vol='python2 /path/to/vol.py'`
* `vol -h`
</details>

In order to use Volatility, you need a memory capture (usually, a .raw file). Try checking out [FTK Imager](https://accessdata.com/product-download/ftk-imager-version-4-2-0), [Redline](https://www.fireeye.com/services/freeware/redline.html), [DumpIt.exe](https://www.aldeid.com/wiki/Dumpit), [winDD](https://sourceforge.net/projects/windd/)...

Volatility need to know on which version of Windows it should base its analysis. It's called profiles, and you can run `imageinfo` to find which profiles you can use.

```bash
$ vol -f memory_capture_file imageinfo
# Suggested Profile(s): ...
```

If the following commands are working, then the profile you took is the right one. You can view active processes/connections

```bash
# processes
$ vol -f memory_capture_file --profile=a_profile pslist
# connections
$ vol -f memory_capture_file --profile=a_profile netscan
# hidden processes
$ vol -f memory_capture_file --profile=a_profile psxview
# both actives, and actives+hidden
vol -f memory_capture_file --profile=a_profile ldrmodules > output
```

</div><div>

Malicious processes will most likely try to hide themselves. If you process is neither InLoad, InInit, InMem, then it's suspicious. You can use grep on the output to check if there is a process like this.

```bash
$ grep -o '^.*False.*False.*False.*' output
```

Processes aren't the only place to inspect. We can also check for unexpected patches in the standard system DLLs.

```bash
$ vol -f memory_capture_file --profile=a_profile apihooks
```

Look for injected code, and dump it

```bash
$ vol -f memory_capture_file --profile=a_profile malfind -D dest
```

View all the DLLs loaded into memory

```bash
$ vol -f memory_capture_file --profile=a_profile dlllist
# dump them
$ vol -f memory_capture_file --profile=a_profile --pid=infected_process_pid dlldump -D dest
```
</div></div>

Volatility
https://subscription.packtpub.com/book/security/9781838640804/10/ch10lvl1sec55/using-volatility-in-kali-linux

https://youtu.be/dB5852eAgpc

https://tryhackme.com/room/bpvolatility

* Inpect files - dump all processes, and ddl
  * https://www.virustotal.com/gui/home/upload
  * https://www.hybrid-analysis.com/
* AlienVault Open Threat Exchange (OTX) - An open-source threat tracking system
* SANS 408 - Windows Forensic Analysis
* https://github.com/stuxnet999/MemLabs

<hr class="sep-both">

## Base64

<div class="row row-cols-md-2"><div>

Base64 is only an encoding function. This isn't doing an encryption, or something cool like that, so it's not used for confidentiality. It could be used to write (encode) an image/... as a string.

> Most base64 strings are ending with "=", or "==".
</div><div>

```bash
$ echo "toto" | base64
dG90bwo=
$ echo "dG90bw=" | base64 -d
toto
```
</div></div>