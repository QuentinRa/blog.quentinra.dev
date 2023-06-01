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

The **first** step is to find the profile of the capture, to load the correct plugins, such as Windows-specific ones...

```bash
$ python3 vol.py [...] imageinfo
# Suggested Profile(s): ...
```

Later, either use: `--profile=xxx plugin_name` or `xxx.plugin_name`.
</div></div>

<hr class="sep-both">

## Volatility

<div class="row row-cols-md-2"><div>

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