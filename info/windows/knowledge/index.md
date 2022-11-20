# Operating system

...

<hr class="sep-both">

## Permissions, and users

<div class="row row-cols-md-2"><div>

**Users**

* `Administrator`: manage users, apps, groups, system-wide settings...
* `Standard User`: can use apps, can access their files

**Groups**

Administrators can set permissions for a group, and users may be in multiple groups.

**User Account Control (UAC)** (=sudo)

When there is a need for a user to elevate, Windows will show the User Account Control (UAC), in which a root user can press "yes", and a non-root user will have to log in using an account having sufficient privileges to do the requested action.
</div><div>

**Permissions** ([doc](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/bb727008(v=technet.10)#understanding-file-and-folder-permissions))

Windows has 7 categories of permissions: Read, Write, Read & Execute, List Folder Contents, Modify, Full Control (**F**).

Permissions are controlled by Discretionary Access Control List (DACLs), see the `icacls` command.

```java
CMD> icacls xxx
xxx NT AUTHORITY\SYSTEM:(I)(F)
    BUILTIN\Administrators:(I)(F)
    Local\username:(I)(F)
```
</div></div>

<hr class="sep-both">

## File system

<div class="row row-cols-md-2"><div>

Modern versions of Windows are using the New Technology File System (**NTFS**). Before, FAT16/32, and HPFS were used. FAT is still used for stuff like USB keys. NTFS is a file system that can repair itself in case of failure, using logs. It's known as a journaling file system.
</div><div>

...
</div></div>

<hr class="sep-both">

## Environment variables

...

<hr class="sep-both">

### Windows services

You can use the commands next to each task to use/open them, and you can also enter the command inside "execute" (Win  ➕ R).  

<div class="row row-cols-md-2"><div>

**Task Manager** (`taskmgr`)

* Shortcut: <kbd>CTRL+SHIFT+ESC</kbd>
* List running processes
* This guide is quite complete [Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/)
</div><div>

**Control panel** (`control`)

* This is the entry point to most settings
* In the top-right corner, it's possible to switch to another view <small>(ex: small icons)</small>, in which you may discover menus that you never opened before, but may but useful one way or another.
</div></div>

<hr class="sep-both">

### Windows security

<div class="row row-cols-md-2 mt-4"><div>

**Windows Update** (`control /name Microsoft.WindowsUpdate`)

A service looking for updates, downloading them, and asking <small>(or, forcing since Windows 10)</small> the user to install them. They are typically released on the 2nd Tuesday of each month (Patch Tuesday), unless there is an important patch.
</div><div>

**Windows security** / **Windows defender**

A set of tools to protect your Windows. There is an antivirus, which has a "ransomware protection" feature. There is a firewall to set rules for your network traffic. [SmartScreen](https://learn.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview) was design to protects against phishing or malware, and there is a tab with security features such as Core isolation.


**BitLocker**

The Trusted Platform Module (TPM) hardware component providing security against tampering, or many other things. BitLocker was designed "to help protect user data, and to ensure that a computer has not been tampered with while the system was offline", as per [Microsoft](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview).
</div></div>