# Volatility

[![bpvolatility](../../../_badges/thm/bpvolatility.svg)](https://tryhackme.com/room/bpvolatility)
[![adventofcyber4](../../../_badges/thm/adventofcyber4/day11.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-md-2"><div>

Volatility is a popular free memory forensics tool. There is a deprecated [python2](https://github.com/volatilityfoundation/volatility) version <small>(which is hard to install, 6.3k ⭐)</small>, and there is a [python3](https://github.com/volatilityfoundation/volatility3) version <small>(1.6k ⭐, in-development)</small>.

```ps
$ git clone https://github.com/volatilityfoundation/volatility3
$ cd volatility3
$ python3 vol.py -h
```

To use Volatility, you need a memory capture. You can use [DumpIt.exe](https://www.aldeid.com/wiki/Dumpit), [WinPmem](https://github.com/Velocidex/WinPmem) (0.4k ⭐), [Redline](https://fireeye.market/apps/211364), [FTK Imager](https://www.exterro.com/ftk-imager)... 

</div><div>

Use `-f` to load a memory dump. Assuming the memory dump is `mdump.sav` in the current folder:

```ps
$ python3 vol.py -f mdump.sav [...]
```

Profiles from volatility 2 are now expressed as [plugins](https://volatility3.readthedocs.io/en/latest/volatility3.plugins.html). You will use `xxx.info` instead of `imageinfo` to learn about the operating system run in a capture; with `xxx` one among `windows`, `linux`, `mac`.
</div></div>

<hr class="sep-both">

## Windows notes

<div class="row row-cols-md-2"><div>

Assuming that the host is running Windows, we can use:

* ➡️ Find information about the operating system

```ps
$ python3 vol.py [...] windows.info
```

* ➡️ List running processes

```ps
$ python3 vol.py [...] windows.pslist
```

👉 Malicious processes tend to hide themselves.

* ➡️ Scan a specific process

```ps
$ python3 vol.py [...] windows.psscan
```
</div><div>

* ➡️ Show processes in which some code may have been injected

```ps
$ python3 vol.py [...] windows.malfind
```

* ➡️ Dump a specific process files (DLL/...)

```ps
$ python3 vol.py [...] windows.dumpfiles --pid xxx -o path/to/extract/dll
```

* ➡️ Show network activity

```ps
$ python3 vol.py [...] windows.netstat
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [THM/volatility](https://tryhackme.com/room/volatility)
* [volatility-cheatsheet](https://blog.onfvp.com/post/volatility-cheatsheet/)
</div><div>
</div></div>