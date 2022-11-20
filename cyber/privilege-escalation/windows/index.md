# Compromise a Windows host

[![windowsfundamentals1xbx](../../_badges/thm/windowsfundamentals1xbx.svg)](https://tryhackme.com/room/windowsfundamentals1xbx)
[![windowsfundamentals2x0x](../../_badges/thm/windowsfundamentals2x0x.svg)](https://tryhackme.com/room/windowsfundamentals2x0x)
[![windowsfundamentals3xzx](../../_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)
[![windows_privilege_escalation](../../_badges/poat/windows_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md)

<div class="row row-cols-md-2"><div>

As there isn't much we can do as a regular user, we will try to elevate our level of privileges to Administrator, or system. You may have to do horizontal escalation first, i.g. moving to another account that has the same level of privilege, but may have different permissions.

* ...

The **goal is to pop out a powershell/cmd as root** (root shell), basically, the same as selecting "run as administrator" for one of them.

</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [WinPeas](https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS) (10.5k ⭐)
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) (1.8k ⭐)
* [PowerUp](https://github.com/HarmJ0y/PowerUp) (222⭐) that was deprecated over [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) (1.8k ⭐) that was deprecated again over [PowerSploit](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc) (10k ⭐) which is now archived 😂. PowerUp from PowerSploit is still used.
</div></div>