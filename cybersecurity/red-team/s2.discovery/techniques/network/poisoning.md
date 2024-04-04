# LLMNR/NBT-NS/mDNS Poisoning

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![breachingad](../../../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

<div class="row row-cols-lg-2"><div>

Inside an internal windows network, when a DNS request fails or a DNS server is not available, LLMNR and NBT-NS may be used to send a local query to machines within the subnet.

* 🐲 LLMNR uses UDP port 5355
* 🐲 NBT-NS uses UDP port 137
* ☠️ NBT-NS may be used in older Windows-based networks
* ☠️ NBT-NS may be used when LLMNR fails to find a host
* ☠️ mDNS may be used when both LLMNR and NBT-NS failed

Both protocols are vulnerable to multiple attacks such as spoofing.
</div><div>

* You can use [responder](/cybersecurity/red-team/tools/utilities/networking/responder.md)

```ps
$ sudo responder -i IP -I tun0
$ sudo responder -I tun0
```

* Refer to [M-I-T-M](/cybersecurity/red-team/s3.exploitation/vulns/others/network/mitm.md) for more tools and attacks
</div></div>

<hr class="sep-both">

## LLMNR/NBT-NS Poisoning Remediation 🛡️

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![breachingad](../../../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

<div class="row row-cols-lg-2"><div>

The best remediation is to disable both protocols, but in some environments, it may not be possible without impacting existing tools.

We can try to send fake LLMNR or NBT-NS requests, and if an host respond, then it's most malicious and we need to investigate.

We must ensure that both stay disabled, such as by monitoring `HKLM\Software\Policies\Microsoft\Windows NT\DNSClient`.
</div><div>

We can try to implement `Network Access Control (NAC)`.
</div></div>