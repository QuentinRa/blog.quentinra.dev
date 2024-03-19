# Network Traffic Analysis

[![adventofcyber2](../../../_badges/thm/adventofcyber2/day7.svg)](https://tryhackme.com/room/adventofcyber2)
[![startup](../../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![chrome](../../../_badges/thm-p/chrome.svg)](https://tryhackme.com/room/chrome)
[![cap](../../../_badges/htb-p/cap.svg)](https://app.hackthebox.com/machines/Cap)
[![ftp_authentication](../../../_badges/rootme/network/ftp_authentication.svg)](https://www.root-me.org/en/Challenges/Network/FTP-authentication)
[![telnet_authentication](../../../_badges/rootme/network/telnet_authentication.svg)](https://www.root-me.org/en/Challenges/Network/TELNET-authentication)
[![twitter_authentication](../../../_badges/rootme/network/twitter_authentication.svg)](https://www.root-me.org/en/Challenges/Network/Twitter-authentication-101)

<div class="row row-cols-lg-2"><div>

Network Traffic Analysis may involve capture traffic and investigating it to find useful information such as:

* 📚 Interesting files to reverse
* 🗝️ Cleartext passwords
* 🗺️ Lists of hosts/IP and protocols
* ...

We may not have a GUI and have to use a TUI or CLI applications.
</div><div>

Common applications are:

* [Wireshark](/operating-systems/networking/others/tools/wireshark/index.md) <small>(GUI)</small>
* [termshark](/operating-systems/networking/commands/index.md#command-termshark) <small>(TUI)</small>
* [tshark](/operating-systems/networking/commands/index.md#command-tshark) <small>(CLI)</small>
* [tcpdump](/operating-systems/networking/commands/index.md#command-tcpdump) <small>(CLI)</small>
* [netminer](https://www.netminer.com/en/product/netminer.php) <small>(paid 💵)</small>
* [pktmon](https://learn.microsoft.com/en-us/windows-server/networking/technologies/pktmon/pktmon) <small>(CLI)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Port scanning: look for packets matching the scan (ex: SYN=1;ACK=0)
* `tshark -Y`, `tshark -r xxx.pcapng -T fields -e data.txt`
* [net-creds](https://github.com/DanMcInerney/net-creds) <small>(1.6k ⭐, 2019 🪦)</small> from [creds.py](https://github.com/DanMcInerney/creds.py) <small>(0.2k ⭐, 2015 🪦)</small>
</div><div>
</div></div>