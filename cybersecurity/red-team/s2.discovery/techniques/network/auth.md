# Service authentication

[![passwordattacks](../../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)
[![easyctf](../../../../_badges/thm-p/easyctf.svg)](https://tryhackme.com/room/easyctf)
[![agentsudoctf](../../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)
[![basicpentestingjt](../../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![netsecchallenge](../../../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)
[![cowboyhacker](../../../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)

<div class="row row-cols-lg-2"><div>

When we discover a service, we often want to test default credentials as it is a fast and easy attack vector. 🔏

We often use one of these tools:

* [hydra](/cybersecurity/red-team/tools/cracking/auth/hydra.md)
* [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md#brute-force-scripts)
* ncrack
* patator
* medusa

Look at [wordlists#accounts](/cybersecurity/red-team/_knowledge/topics/wordlists.md#accounts) to find handy wordlists.
</div><div>

**Additional notes**

* If we don't find any valid credentials nor any other attack vector, we may try to use wordlists with the most common passwords. 🪲

* Otherwise, we may also try our luck with [password spraying](../spraying.md). 🗝️

* When testing a list of usernames, don't forget to add the switch to stop when one credential is found. ⚠️
</div></div>