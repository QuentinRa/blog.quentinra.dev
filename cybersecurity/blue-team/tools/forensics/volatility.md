# Volatility

[![introduction_to_digital_forensics](../../../_badges/htb/introduction_to_digital_forensics.svg)](https://academy.hackthebox.com/course/preview/introduction-to-digital-forensics)
[![bpvolatility](../../../_badges/thm/bpvolatility.svg)](https://tryhackme.com/room/bpvolatility)
[![adventofcyber4](../../../_badges/thm/adventofcyber4/day11.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Volatility is a popular free memory forensics tool. There is a deprecated [python2](https://github.com/volatilityfoundation/volatility) version <small>(which is hard to install, 6.8k ⭐)</small>, and there is a [python3](https://github.com/volatilityfoundation/volatility3) version <small>(2.1k ⭐, in-development)</small>.

```ps
$ pipx install git+https://github.com/volatilityfoundation/volatility3
$ vol -h
```

To use Volatility, you need a memory capture. You can use [DumpIt.exe](https://www.aldeid.com/wiki/Dumpit), [WinPmem](https://github.com/Velocidex/WinPmem) (0.4k ⭐), [Redline](https://fireeye.market/apps/211364), [FTK Imager](https://www.exterro.com/ftk-imager)... 

</div><div>

Use `-f` to load a memory dump. Assuming the memory dump is `mdump.sav` in the current folder, you would use:

```ps
$ vol -f mdump.sav [...]
```

Profiles from volatility 2 are now expressed as [plugins](https://volatility3.readthedocs.io/en/latest/volatility3.plugins.html). You will use `xxx.info` instead of `imageinfo` <small>(to learn about the operating system in use in the capture)</small> with `xxx` a value among `windows`, `linux`, or `mac`.
</div></div>

<hr class="sep-both">

## Windows notes

[![introduction_to_digital_forensics](../../../_badges/htb/introduction_to_digital_forensics.svg)](https://academy.hackthebox.com/course/preview/introduction-to-digital-forensics)
[![bpvolatility](../../../_badges/thm/bpvolatility.svg)](https://tryhackme.com/room/bpvolatility)
[![adventofcyber4](../../../_badges/thm/adventofcyber4/day11.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Assuming that the host is running Windows, we can use:

* ➡️ Find information about the operating system

```ps
$ vol [...] windows.info
```

* ➡️ List running processes

```ps
$ vol [...] windows.pslist
$ vol [...] windows.pstree
$ vol [...] windows.cmdline
```

👉 Malicious processes tend to hide themselves.

* ➡️ Scan a specific process

```ps
$ vol [...] windows.psscan
$ vol [...] windows.handles --pid XXX
$ vol [...] windows.memmap --pid XXX --dump
$ vol [...] windows.dlllist --pid XXX
```
</div><div>

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
</div><div>
</div></div>