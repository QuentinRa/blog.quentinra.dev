# Remote procedure call (RPC)

<div class="row row-cols-lg-2"><div>

Remote procedure call (RPC) is a protocol in which a process can communicate with another process on a different host.

🐊️ **Port**: 111 (TCP/UDP)

RPC can be used to find on which port is a service running. This is done by the `rpcbind` service <small>(a.k.a. `port mapper`)</small>. It takes a program number, and a version number, and respond with the port.
</div><div>

List RPC programs:

```ps
$ rpcinfo IP
$ rpcinfo -p IP
```
</div></div>

<hr class="sep-both">

## RPC SMB Footprinting

[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![active_directory_enumeration_attacks](../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

<div class="row row-cols-lg-2"><div>

If `msrpc` is running <small>(often on port 135)</small>, we may be able to exploit it:

```shell!
$ rpcclient -U "%" IP
$ rpcclient -U "" --password "" IP
$ rpcclient -U "" -N IP
client> srvinfo         # SMB Server Information
client> netshareenumall # SMB Shares + Local Path
client> netsharegetinfo share_name # Permissions, SID, etc.
client> querydominfo    # Stats
client> getdompwinfo    # Password Policy
client> enumdomusers    # List Users
client> queryuser <hexid>
client> querygroup <hexid>
```

👻 Refer to this [cheatsheet from SANS](https://www.willhackforsushi.com/sec504/SMB-Access-from-Linux.pdf).
</div><div>

We can also use [samrdump](tools/impacket.md#samrdump) to list users. If no users are found, we may still be able to find users by brute forcing hexadecimal IDs.

```ps
$ for i in $(seq 500 1100);do rpcclient [...] -c "queryuser 0x$(printf '%x\n' $i)" | grep "User Name\|user_rid\|group_rid" && echo "";done
$ c=""; for i in $(seq 500 1000);do c="${c}queryuser 0x$(printf '%x\n' $i);"; done; rpcclient [...] -c "${c}exit" | grep "User Name\|user_rid\|group_rid"
```

```shell!
$ enum4linux-ng IP -R # find more users than the for above!
$ enum4linux-ng IP -R 64 # 64 per rpcclient call, faster
```

See also: [ridenum](https://github.com/trustedsec/ridenum) <small>(0.2k ⭐, 2020 🪦)</small>.
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* buffer overflow
* malicious port redirect
</div><div>
</div></div>