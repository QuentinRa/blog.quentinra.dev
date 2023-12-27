# Remote procedure call (RPC)

<div class="row row-cols-lg-2"><div>

Remote procedure call (RPC) is a protocol in which a process can communicate with another process on a different host.

🐊️ **Port**: 111 (TCP/UDP)

RPC can be used to find on which port is a service running. This is done by the `rpcbind` service <small>(a.k.a. `port mapper`)</small>. It takes a program number, and a version number, and respond with the port.
</div><div>
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

#### RPC SMB Footprinting

[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

```shell!
$ rpcclient -U "" --password "" 10.129.128.15
client> srvinfo # SMB Server Information
client> netshareenumall # SMB Shares + Local Path
client> netsharegetinfo share_name # Permissions, SID, etc.
client> enumdomusers # List Users
client> queryuser <hexid>
client> querygroup <hexid>
```

We can use [samrdump](tools/impacket.md#samrdump) to get the same output as `enumdomusers`. If no users are found, we may still be able to find users by brute forcing hexadecimal IDs.

```ps
$ for i in $(seq 500 1100);do rpcclient [...] -c "queryuser 0x$(printf '%x\n' $i)" | grep "User Name\|user_rid\|group_rid" && echo "";done
```
</div><div>
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* buffer overflow
* malicious port redirect
</div><div>
</div></div>