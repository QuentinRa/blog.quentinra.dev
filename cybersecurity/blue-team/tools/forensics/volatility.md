# Volatility

[![introduction_to_digital_forensics](../../../_badges/htb/introduction_to_digital_forensics.svg)](https://academy.hackthebox.com/course/preview/introduction-to-digital-forensics)
[![bpvolatility](../../../_badges/thm/bpvolatility.svg)](https://tryhackme.com/room/bpvolatility)
[![adventofcyber4](../../../_badges/thm/adventofcyber4/day11.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Volatility is a popular free [memory forensics tool](/cybersecurity/blue-team/topics/forensics.md). There is a deprecated [python2](https://github.com/volatilityfoundation/volatility) version <small>(6.8k ⭐, 2020 🪦)</small>, and there is a [python3](https://github.com/volatilityfoundation/volatility3) version <small>(2.1k ⭐, in-development)</small>.

<span class="small">*This method contains a few extra lines due to 'incorrect' `volatility3/setup.py`:*</span>

```ps
$ pipx install git+https://github.com/volatilityfoundation/volatility3
$ # patch - setup.py using minimal requirements - start
$ wget https://raw.githubusercontent.com/volatilityfoundation/volatility3/develop/requirements.txt -O /tmp/volatility3_requirements.txt
$ pipx runpip volatility3 install -r /tmp/volatility3_requirements.txt
$ # patch - end
$ vol -h
```
</div><div>

Use `-f` to load a memory dump. Use `-r pretty` for a prettier display.

```ps
$ vol mdump.sav [...]
$ vol -f mdump.sav [...]
$ vol -r pretty -f mdump.sav [...]
```

**Changes with V2**:

 🗃️ Profiles from volatility 2 are now within the [plugins](https://volatility3.readthedocs.io/en/latest/volatility3.plugins.html) path. You will use `xxx.info` instead of `imageinfo` <small>(to learn about the operating system in use in the capture)</small> with `xxx` a value among `windows`, `linux`, or `mac`.

```ps
$ vol -f mdump.sav banners.Banners
```
</div></div>

<hr class="sep-both">

## Windows notes

[![introduction_to_digital_forensics](../../../_badges/htb/introduction_to_digital_forensics.svg)](https://academy.hackthebox.com/course/preview/introduction-to-digital-forensics)
[![bpvolatility](../../../_badges/thm/bpvolatility.svg)](https://tryhackme.com/room/bpvolatility)
[![adventofcyber4](../../../_badges/thm/adventofcyber4/day11.svg)](https://tryhackme.com/room/adventofcyber4)
[![command_control_level_2](../../../_badges/rootme/forensic/command_control_level_2.svg)](https://www.root-me.org/en/Challenges/Forensic/Command-Control-level-2)
[![command_control_level_5](../../../_badges/rootme/forensic/command_control_level_5.svg)](https://www.root-me.org/en/Challenges/Forensic/Command-Control-level-5)

<div class="row row-cols-lg-2"><div>

Assuming that the host is running Windows, we can use:

* ➡️ Find information about the operating system

```ps
$ vol [...] windows.info
$ vol [...] windows.envars
```

* ➡️ List running processes

```ps
$ vol [...] windows.pslist
$ vol [...] windows.pstree
$ vol [...] windows.cmdline
```

👉 Malicious processes tend to hide themselves.

* ➡️ List and dump registry entries

```ps
$ vol [...] windows.registry.hivelist.HiveList
$ # either look in all registries, or in registry at --offset
$ vol [...] windows.registry.printkey.PrintKey --key 'ControlSet001\Control\ComputerName\ComputerName'
$ vol [...] windows.registry.printkey.PrintKey --offset 0xAAAAAAAA--key 'ControlSet001\Control\ComputerName\ComputerName'
```

* ➡️ List and dump passwords, hashes, keys, etc.

```ps
$ vol [...] windows.hashdump.Hashdump
$ vol [...] windows.lsadump.Lsadump
```
</div><div>

* ➡️ Scan a specific process

```ps
$ vol [...] windows.psscan
$ vol [...] windows.handles --pid XXX
$ vol [...] windows.memmap --pid XXX --dump
$ vol [...] windows.dlllist --pid XXX
```

* ➡️ Show processes in which some code may have been injected

```ps
$ vol [...] windows.malfind
$ vol [...] windows.malfind --pid=XXX
```

* ➡️ Dump a specific process files

```ps
$ vol [...] windows.dumpfiles --pid xxx -o path/to/extract/dll
```

* ➡️ Show network activity

```ps
$ vol [...] windows.netstat
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [THM/volatility](https://tryhackme.com/room/volatility)
* [volatility-cheatsheet](https://blog.onfvp.com/post/volatility-cheatsheet/)
* [aldeid wiki](https://www.aldeid.com/wiki/Volatility)
* [volatility symbol table](https://volatility3.readthedocs.io/en/latest/symbol-tables.html) and [dwarf2json docker by 4nuit](https://4nuit.github.io/posts/cheatsheet/#profils-linux-vol3) and [JPCERTCC tables](https://github.com/JPCERTCC/Windows-Symbol-Tables)

```ps
$ vol -f mdump.sav linux.bash # Linux Bash History
```
</div><div>
</div></div>