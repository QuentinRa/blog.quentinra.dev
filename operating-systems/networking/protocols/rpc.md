# Remote procedure call (RPC)

<div class="row row-cols-md-2"><div>

Remote procedure call (RPC) is a protocol in which a process can communicate with another process on a different host.

🐊️ **Port**: 111 (TCP/UDP)

RPC can be used to find on which port is a service running. This is done by the `rpcbind` service <small>(a.k.a. `port mapper`)</small>. It takes a program number, and a version number, and respond with the port.
</div><div>
</div></div>