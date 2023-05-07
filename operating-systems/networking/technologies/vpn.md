# Virtual private network (VPN)

[![extendingyournetwork](../../../cybersecurity/_badges/thmp/extendingyournetwork.svg)](https://tryhackme.com/room/extendingyournetwork)

<div class="row row-cols-md-2"><div>

A **virtual private network** (**VPN**) is a technology allowing two or more computers on different networks to communicate securely as if they were on the same network segment.

Common use cases are:

* 🐦 to by-pass (country/...) restrictions and access some websites
* 🎠 to access a company internal network
* 🌍 to create a common network between companies
* ...

There are 3 categories of VPNs:

* **Remote access**: connect to a remote location <small>(see also: Split-Tunnel)</small>
* **Site-to-Site**: connect geographically separated networks
* **SSL**: use SSL/TLS, usually used in web browsers
</div><div>

VPN can be implemented using

* **Point-to-Point Tunneling Protocol** (PPTP): an implementation based on PPP, allowing traffic to leave the network. It's considered as less-secure and more vulnerable than others.
* **Layer 2 Tunneling Protocol** (L2TP): implementation based on PPP used with IPSec for tunneling
* [**OpenVPN**](https://openvpn.net/): usually a server generates a configuration that clients use to authenticate themselves and access the VPN network

```ps
$ sudo apt install openvpn # install
$ sudo openvpn user_config.ovpn # connect 
```

* ...
</div></div>