# User Account Control (UAC)

[Go back](../index.md#windows-privilege-escalation-)

<div class="row row-cols-md-2"><div>

The [User Account Control (UAC)](/operating-systems/windows/knowledge/index.md#permissions-and-users) is the equivalent of `sudo` on Linux. It's shown when administrative privileges are required, for instance, to install applications.

* ➡️ By-pass technique using eventvwr <small>(2016?)</small>

[![blaster](../../../_badges/thm-p/ice.svg)](https://tryhackme.com/room/blaster)

Bypass User Account Control (UAC) using `eventvwr.exe`. The attack is done by editing the registry, which means you must have sufficient privileges to do so <small>(not necessarily an admin, but not a regular user)</small>.

* ➡️ [CVE-2019-1388](https://github.com/nobodyatall648/CVE-2019-1388)

[![blaster](../../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)

A flaw in UAC allows users to open a browser as Administrator, which can be further exploited allowing us to start a shell as Administrator.
</div><div>

* ➡️ **AlwaysInstallElevated**: it's unlikely, but if an admin allowed programs to be installed without needed Administrator privileges, then you can install a malicious program.

[![windowsprivesc20](../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

```java
PS> reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer
PS> reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer
PS> msiexec /quiet /qn /i $Env:TMP\malicious.msi
```
</div></div>