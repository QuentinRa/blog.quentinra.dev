# Ping

[![activerecon](../../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

Ping is usually to check if the host is up. If the host answers, it means that we can assume that the host is up, and we can interact with it.

If the host doesn't answer, then either it's down, our packets are filtered by a firewall, or it doesn't reply to ICMP requests 💀.
</div><div>

See the [ping](/operating-systems/networking/commands/index.md#command-ping).

➡️ For instance, if a host doesn't reply to a ping, we may change our strategy and use `nmap -Pn [...]` to disable ICMP checks.
</div></div>