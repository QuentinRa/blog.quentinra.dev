# Ping

[![activerecon](../../../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

<div class="row row-cols-lg-2"><div>

We often use the `ping` command to check if the host is up. If the host answers, we assume that the host is up and we can interact with it.

If the host doesn't answer, then either it's down, our packets are filtered by a firewall, or it doesn't reply to ICMP requests 💀.

Refer to the [ping](/operating-systems/networking/commands/index.md#command-ping) documentation for usage.
</div><div>

**Rationale**

If a host doesn't reply to a ping and we know it's up, we may change our strategy, e.g. adapting our commands. For instance, we may use `nmap -Pn [...]` to disable ICMP checks.
</div></div>