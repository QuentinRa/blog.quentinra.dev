# WI-FI

[![introductiontonetworking](../../../../cybersecurity/_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)
[![wifihacking101](../../../../cybersecurity/_badges/thm-p/wifihacking101.svg)](https://tryhackme.com/room/wifihacking101)

<div class="row row-cols-lg-2"><div>

Wi-Fi is a family of protocols commonly used for local area networking along with Ethernet. Exchanges are done using radio waves. Wireless adapters are responsible for converting data to radio frequency (RF).

Each Wi-Fi network has a SSID (Service Set Identifier) which is the name of the network shown to others <small>(ESSID)</small>. 

They often have a password. WPA <small>(Wi-Fi Protected Access)</small> is the replacement of WEP <small>(Wired Equivalent Privacy)</small> and a protocol to prevent unauthorized access to the network.

* WPA2-EAP uses a Radius Server
* WPA2-PSK uses a password/passphrase/code
* Cisco used LEAP/PEAP and now uses EAP-TLS
* Cisco uses a TACACS+ Server
</div><div>

Wi-Fi is commonly used to connect a device to an [access point](/operating-systems/networking/topology/devices/wap.md), which is connecting us to another network such as the internet.
</div></div>

<hr class="sep-both">

## Wi-FI vulnerabilities ☠️

<div class="row row-cols-lg-2"><div>

Well-known Wi-Fi attacks:

* **Wi-Fi deauthentication attack** 💥: a hacker sends the deauthentication frame to the access point using the client address

* **Radio jamming** 📶: a hacker disrupt communications
</div><div>

* Credentials can be sniffed and [cracked](/cybersecurity/cryptography/algorithms/hashing/index.md#wireless-password-cracking)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

[![wifihacking101](../../../../cybersecurity/_badges/thm-p/wifihacking101.svg)](https://tryhackme.com/room/wifihacking101)

* [AirCrack Documentation](https://aircrack-ng.org/documentation.html)
* Airmon-ng: start/stop monitoring interface?
* <s>`aircrack-ng -b xx:xx:xx:xx:xx:xx -e 'xxx' -j hash xxx.cap` generates `hash.hccapx`</s>
* Refer to hash cracking

[![crackingpasswordswithhashcat](../../../../cybersecurity/_badges/htb/crackingpasswordswithhashcat.svg)](https://academy.hackthebox.com/course/preview/cracking-passwords-with-hashcat)

* PMKID, MAC
* ...
</div><div>

* Radius: Auth Server
</div></div>