# LLMNR/NBT-NS Poisoning

<div class="row row-cols-lg-2"><div>

Inside an internal windows network, when a DNS server is not available or a DNS request fails, LLMNR and NBT-NS may be used.

* 🐲 LLMNR uses UDP port 5355
* 🐲 NBT-NS uses UDP port 137
* ☠️ NBT-NS may be used in older Windows-based networks
* ☠️ NBT-NS may be used when LLMNR fails to find a host

Both protocols are vulnerable to multiple attacks such as spoofing.
</div><div>

* You can use [responder](/cybersecurity/red-team/tools/utilities/networking/responder.md)

```ps
$ sudo responder -i IP -I tun0
$ sudo responder -I tun0
```

* Refer to [M-I-T-M](/cybersecurity/red-team/s3.exploitation/vulns/others/network/mitm.md) for more tools and attacks
</div></div>