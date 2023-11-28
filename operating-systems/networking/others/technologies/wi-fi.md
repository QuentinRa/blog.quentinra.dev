# WI-FI

[![wifihacking101](../../../../cybersecurity/_badges/thm-p/wifihacking101.svg)](https://tryhackme.com/room/wifihacking101)

<div class="row row-cols-lg-2"><div>

Wi-Fi is a family of protocols commonly used for local area networking along with Ethernet. Exchanges are done using radio waves. Wireless adapters are responsible for converting data to radio frequency (RF).

Each Wi-Fi network has a SSID (Service Set Identifier) which is the name of the network shown to others.

They often have a password.
</div><div>

...
</div></div>

<hr class="sep-both">

## Wi-FI vulnerabilities ☠️

<div class="row row-cols-lg-2"><div>

Well-known Wi-Fi attacks:

* **Wi-Fi deauthentication attack** 💥: a hacker sends the deauthentication frame to the access point using the client address

* **Radio jamming** 📶: a hacker disrupt communications
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

[![wifihacking101](../../../../cybersecurity/_badges/thm-p/wifihacking101.svg)](https://tryhackme.com/room/wifihacking101)

* [AirCrack Documentation](https://aircrack-ng.org/documentation.html)
* Airmon-ng: start/stop monitoring interface?
* <s>`aircrack-ng -b xx:xx:xx:xx:xx:xx -e 'xxx' -j hash xxx.cap` generates `hash.hccapx`</s>
  * https://github.com/ZerBea/hcxtools
  * `hcxpcaptool -j hash xxx.cap`
  * `john --format=wpapsk --wordlist=/usr/share/wordlists/rockyou.txt hash`

</div><div>

Notes

Wi-Fi

* WiFi
  * connection request frame or association request (first when joining)
* ask WAP before sending
* Lightweight Extensible Authentication Protocol (LEAP) and Protected Extensible Authentication Protocol (PEAP) -> EAP-TLS
* Terminal Access Controller Access-Control System Plus (TACACS+) server

**https://tryhackme.com/room/wifihacking101**

* SSID = network name, ESSID = AP sharing a same SSID (act as a SALT, make each key unique to the access point)
* RADIUS = Auth server
* WEP (Wired Equivalent Privacy)
* WPA
    * WPA2-EAP: use RADIUS
    * WPA2-PSk: password/passphrase/code
</div></div>