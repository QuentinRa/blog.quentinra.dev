# Digital Forensics

Notes about forensics, i.e. investigating cyber crimes.

<hr class="sep-both">

## Volatility

[![bpvolatility](../../_badges/thm/bpvolatility.svg)](https://tryhackme.com/room/bpvolatility)

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

Volatility needs to know on which version of Windows it should base its analysis. It's called profiles, and you can run `imageinfo` to find which profiles you can use.

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

Malicious processes will most likely try to hide themselves. If a process is neither InLoad, InInit, nor InMem, then it's suspicious. You can use grep on the output to check if there is a process like this.

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

> **More**
>
> * [Using Volatility in Kali Linux](https://subscription.packtpub.com/book/security/9781838640804/10/ch10lvl1sec55/using-volatility-in-kali-linux)
> * [Memory Forensics with Vol(a|u)tility](https://www.youtube.com/watch?v=dB5852eAgpc)
> * [SANS Windows Forensic Analysis](https://www.sans.org/cyber-security-courses/windows-forensic-analysis/)
> * [MemLabs](https://github.com/stuxnet999/MemLabs)

<hr class="sep-both">

## Assembly

<div class="row row-cols-md-2"><div>

One level above binary (010010...), we have a language called assembly which is basically written in instructions specific to a set of machines (Intel, ARM...). You need to use the appropriate tool according to the kind of application.

* [radare2](https://github.com/radareorg/radare2) (17.1k ⭐): Convert binary to assembly
* `strace`: trace of a program (system calls)
* `strings`: extract readable strings in a binary
</div><div>

**.NET decompiler**

* [ILSpy](https://github.com/icsharpcode/ILSpy) (16.2k ⭐)
* [dotPeek](https://www.jetbrains.com/decompiler/) (JetBrains, paid, 🚀)

**Java decompilers**

* [Recaf](https://github.com/Col-E/Recaf) (4.3k ⭐)
* [IntelliJ](https://github.com/JetBrains/intellij-community) (JetBrains, 14.5k ⭐, 🚀)
</div></div>