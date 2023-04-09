# Intrusion System

<div class="row row-cols-md-2"><div>

Intrusion System are separated into two categories:

* **Intrusion Detection System (IDS)** 🛟: detect intrusions
* **Intrusion Prevention System (IPS)** 🗼: detect and block intrusions. An IPS is expensive, but provide more security.

They identify/detect known and unknown attacks, and block/prevent them. It can be used either to alert or to block an intrusion.

A company will select one based on their security requirements, the cost, their network topology, and their maintenance capacity.
</div><div>

An IDS/IPS can be set up and operates at different levels

* **Application-Based IDS/IPS** 🖼️: monitor an application, and detect/block suspicious activities <small>(SQLi, buffer overflow)</small>

* **Host-Based IDS/IPS** (HIPS/HIDS) 💻: monitor a host, analyse traffic, logs, and system activity to detect/block suspicious activities

* **Network-Based IDS/IPS** (NIDS/NIPS) 📶: usually on a switch/router, detect and block malicious traffic
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Anti-malwares/EDR
* [snort](https://www.snort.org/)
* [suricata](https://suricata.io/)
* [pfsense](https://www.pfsense.org/)
</div><div>

* Tripwire (integrity, database of expected states)
* OSSEC (monitor log files, detect rootkits)
* AIDE (integrity, permissions/file attributes changes)
* NIDS are usually installed where traffic enter/exit
</div></div>