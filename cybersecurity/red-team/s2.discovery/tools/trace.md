# Packet tracing

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

Packet tracing is a technique to find the number of hosts between us and our target. Sometimes, we may even get information about intermediate hosts 🗺️.

The technique used is an increasing TTL (Time-To-Live). The TTL determine the number of hops before the packet is destroyed. Intermediate machines that destroy a packet **may** answer back saying that the packet was destroyed.
</div><div>

We keep sending a packet, and increasing by one the TTL. This is how we get information.

See the [traceroute](/operating-systems/networking/commands/index.md#command-traceroute)/[tracepath](/operating-systems/networking/commands/index.md#command-tracepath) commands, or [tracert](/operating-systems/networking/commands/index.md#command-tracert) on Windows.

➡️ Map the internal network

💥 Routes taken by packets may change.
</div></div>