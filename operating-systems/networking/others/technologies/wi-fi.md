# WI-FI

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Notes

Wi-Fi

* sniffing
* deauthentication packets
* jamming (flood the network)
* Wireless networks use radio frequency (RF) technology to transmit data between devices.
* wireless adapter to convert data to RF
* WiFi
    * Service Set Identifier (SSID) and password
    * connection request frame or association request (first when joining)
* ask WAP before sending
* Lightweight Extensible Authentication Protocol (LEAP) and Protected Extensible Authentication Protocol (PEAP) -> EAP-TLS
* Terminal Access Controller Access-Control System Plus (TACACS+) server
</div><div>

**https://tryhackme.com/room/wifihacking101**

* SSID = network name, ESSID = AP sharing a same SSID (act as a SALT, make each key unique to the access point)
* RADIUS = Auth server
* WEP (Wired Equivalent Privacy)
* WPA
    * WPA2-EAP: use RADIUS
    * WPA2-PSk: password/passphrase/code
* Airmon-ng: start/stop monitoring interface?
* https://aircrack-ng.org/documentation.html
* ~~`aircrack-ng -b xx:xx:xx:xx:xx:xx -e 'xxx' -j hash xxx.cap` generates `hash.hccapx`~~
    * https://github.com/ZerBea/hcxtools
    * `hcxpcaptool -j hash xxx.cap`
    * `john --format=wpapsk --wordlist=/usr/share/wordlists/rockyou.txt hash`
</div></div>