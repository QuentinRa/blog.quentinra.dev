# User Account Control (UAC)

<div class="row row-cols-lg-2"><div>

The [User Account Control (UAC)](/operating-systems/windows/_knowledge/index.md#permissions-and-users) is the equivalent of `sudo` on Linux. It's shown when administrative privileges are required, for instance, when a regular user wants to install applications for all users.

You can refer to [UACME](https://github.com/hfiref0x/UACME) <small>(6.6k ⭐)</small> to defeat UAC.

#### Bypass UAC using eventvwr (2016)

[![blaster](../../../../_badges/thm-p/ice.svg)](https://tryhackme.com/room/blaster)

Bypass User Account Control (UAC) using `eventvwr.exe`. The attack is done by editing the registry, which means you must have sufficient privileges to do so <small>(not necessarily an admin, but not a regular user)</small>.

#### Bypass UAC using SystemPropertiesAdvanced (2016)

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

The 32-bit version of `SystemPropertiesAdvanced` located at `C:\Windows\SysWOW64\SystemPropertiesAdvanced.exe` can be exploited to bypass UAC if `srrstr.dll` is not found in Windows directories.

Create and put a DLL in any folder that is within the path and execute the binary above to execute your DLL while bypassing UAC.

➡️ You can use [msfvenom](/cybersecurity/red-team/tools/frameworks/metasploit/msfvenom.md) to create a malicious DLL.
</div><div>

#### CVE-2019-1388

[![blaster](../../../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)

A [flaw](https://github.com/nobodyatall648/CVE-2019-1388) in UAC allows users to open a browser as Administrator, which can be further exploited allowing us to start a shell as Administrator.

#### AlwaysInstallElevated Misconfiguration

[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

If an admin allowed programs to be installed without administrator privileges, then we can install a malicious program.

```java
PS> reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer
PS> reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer
PS> msiexec /quiet /qn /i $Env:TMP\malicious.msi
```
</div></div>