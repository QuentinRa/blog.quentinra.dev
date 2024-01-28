# VoIP

[![introductiontonetworking](../../../cybersecurity/_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)
[![sip_authentication](../../../cybersecurity/_badges/rootme/network/sip_authentication.svg)](https://www.root-me.org/en/Challenges/Network/SIP-authentication-103)

<div class="row row-cols-lg-2"><div>

The Voice over Internet Protocol (VoIP) is a technology that allows voice transmissions and multimedia communications over the Internet.

It involves a few protocols.

#### Session Initiation Protocol (SIP) 🔐

The SIP protocol is quite used to VoIP authentication, from initiating, to managing, and terminating sessions. 

**Ports** 🐲: TCP/5060 and TCP/5061

☠️ We may be able to enumerate users.

☠️ We can try to brute force credentials using [sipcrack](https://manpages.debian.org/buster/sipcrack/sipcrack.1.en.html) while they may be transferred as plaintext.

```shell!
$ sudo apt install sipcrack
$ sipcrack -w /usr/share/wordlists/rockyou.txt message
```
</div><div>

#### H.323

The H.323 protocol is a system specification commonly used for voice and video conferencing over the internet.

**Ports** 🐲: TCP/1720

<br>

#### Real-time Transport Protocol (RTP)

The Real-time Transport Protocol (RTP) is used for delivering audio and video over IP networks in real-time. It's often used with RTCP.

**Ports** 🐲: 

* RDP: usually an even port number (TCP)
* RTCP: usually RDP port + 1 (TCP)
</div></div>