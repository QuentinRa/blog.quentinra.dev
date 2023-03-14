# Discovery

<div class="row row-cols-md-2"><div>

If there is a website, check the [webserver methodology](/_cybersecurity/exploitation/web/methodology.md) to learn more about how you could find vulnerabilities and exploit them 🗺️.

</div><div>

There are a lot of ways to perform its discovery 

* `ping`: test if the host is up, and accepting ICMP packets. Useful to find if the flag `-Pn` must be used in `nmap`.

* **Nmap** ([course](nmap/index.md)): to find open ports, their services+version with `-sV`, the OS with `-O` or `-sV`, and try to exploit vulnerabilities

* **Nessus** ([course](nessus/index.md)): find open ports and their vulnerabilities. This is a local website that can be used when needing an automated scan, albeit noisy, and somewhat slow.

* `traceroute/tracepath` which are using the TTL to know how many steps/hops it took for a packet to reach the target <small>(they increase the TTL by one, and try to get the intermediaries IPs as they respond that the packet was destroyed, but most aren't responding, so we got no information. Also, the route may change, as routers are always calculating the most optimal route)</small>.
</div></div>