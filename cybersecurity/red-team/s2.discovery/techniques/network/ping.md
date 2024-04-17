# Ping sweep

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![activerecon](../../../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

<div class="row row-cols-lg-2"><div>

We often use the `ping` command to check if the host is up. If the host answers, we assume that the host is up and we can interact with it.

If the host doesn't answer, then either it's down, our packets are filtered by a firewall, or it doesn't reply to ICMP requests 💀.

If a host doesn't reply to a ping and we know it's up, we may change our strategy, e.g. adapting our commands. For instance, we may use `nmap -Pn [...]` to disable ICMP checks.
</div><div>

**Usages**

Refer to the [ping](/operating-systems/networking/commands/index.md#command-ping) documentation for usage.

Refer to the [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) for a Ping scan (`-sn`,`-iL`).

You can use the [fping](https://fping.org/) command:

```ps
$ fping -asgq 172.20.0.0/23
```
</div></div>