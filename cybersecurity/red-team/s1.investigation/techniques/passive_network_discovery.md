# Passive Internal Network Discovery

[![active_directory_enumeration_attacks](../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

<div class="row row-cols-lg-2"><div>

When inside an internal network, we may receive a lot of traffic passively, such as ARP requests.

* Refer to [network traffic analysis](/cybersecurity/red-team/_knowledge/topics/network_traffic_analysis.md)
* You may also run [responder](/cybersecurity/red-team/tools/utilities/networking/responder.md) in analysis mode

```ps
$ sudo responder -I tun0 -A
```

📚 You may get a lot of information for active directory enumeration such as DC names and IPs, network names, etc.
</div><div>
</div></div>