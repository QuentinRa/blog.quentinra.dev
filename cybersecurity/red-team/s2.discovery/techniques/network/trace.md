# Packet tracing

[![shells_and_payloads](../../../../_badges/htb/shells_and_payloads.svg)](https://academy.hackthebox.com/course/preview/shells--payloads)
[![activerecon](../../../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

<div class="row row-cols-lg-2"><div>

Packet tracing is a technique to find the number of hosts between us and our target. Sometimes, we may even get information about intermediate hosts 🗺️.

The main technique used is an increasing TTL (Time-To-Live). The TTL determines the number of hops before the packet is destroyed. Intermediate machines that destroy a packet **may** answer back saying that the packet was destroyed.

We keep sending a packet, and increasing by one the TTL. This is how we may map the network.
</div><div>

Refer to the [traceroute](/operating-systems/networking/commands/index.md#command-traceroute)/[tracepath](/operating-systems/networking/commands/index.md#command-tracepath) commands, or [tracert](/operating-systems/networking/commands/index.md#command-tracert) on Windows.

<br>

**Additional notes**

💥 Routes taken by packets may change.

📚 Some well-known operating systems have well-known TTL values. We may use that to identify the operating system that responded, while it's very unreliable.
</div></div>