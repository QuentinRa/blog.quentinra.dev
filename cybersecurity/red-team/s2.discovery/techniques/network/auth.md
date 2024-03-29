# Service authentication

[![passwordattacks](../../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)
[![password_attacks](../../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![easyctf](../../../../_badges/thm-p/easyctf.svg)](https://tryhackme.com/room/easyctf)
[![agentsudoctf](../../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)
[![basicpentestingjt](../../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![netsecchallenge](../../../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)
[![cowboyhacker](../../../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)
[![unbakedpie](../../../../_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)
[![wifinetic](../../../../_badges/htb-p/wifinetic.svg)](https://app.hackthebox.com/machines/Wifinetic)

<div class="row row-cols-lg-2"><div>

When we discover a service, we often want to test default credentials as it is a fast and easy attack vector. 🔏

We often use one of these tools:

* [hydra](/cybersecurity/red-team/tools/cracking/auth/hydra.md)
* [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md#brute-force-scripts)
* [CrackMapExec](/cybersecurity/red-team/tools/cracking/auth/cme.md)
* [NetExec](/cybersecurity/red-team/tools/cracking/auth/nxc.md)
* [Crowbar](/cybersecurity/red-team/tools/cracking/auth/crowbar.md)
* ncrack
* patator
* [medusa](/cybersecurity/red-team/tools/cracking/auth/medusa.md)

Look at [wordlists#accounts](/cybersecurity/red-team/_knowledge/topics/wordlists.md#accounts) to find handy wordlists.
</div><div>

**Additional notes**

* If we don't find any valid credentials nor any other attack vector, we may try to use wordlists with the most common passwords. 🪲

* Otherwise, we may also try our luck with [password spraying](/cybersecurity/red-team/s2.discovery/techniques/passwords/spraying.md). To avoid account lockout, we may be forced to use it anyway. 🗝️ By default there is no account lockout on Windows Server.

* When testing a list of usernames, remember to add the switch to stop when one credential is found. ⚠️
</div></div>