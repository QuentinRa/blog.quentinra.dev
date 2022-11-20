# Operating system

<div class="row row-cols-md-2"><div>

Microsoft Windows is the most used operating system. Windows versions that were quite used are Windows XP, Windows 7, Windows 10, and now Windows 11 is slowly gaining new users.

> There are a lot of things that are similar to [Linux Operating systems](/info/linux/knowledge/index.md), so I will add fewer details here.
</div><div>

Some dates about the latest versions

* Windows 7 (2009-2020)
* Windows 10 (2015-2025)
* Windows 11 (2021-???)
</div></div>

<hr class="sep-both">

## Windows console

<div class="row row-cols-md-2"><div>

You can run commands on Windows inside a **CMD** (Command Prompt), or inside a **Powershell** (see [Powershell](../powershell/index.md)). The latter is an improved version of the former, which is retro compatible, meaning commands working in a CMD are, ⚠️for most ⚠️, working inside a powershell.

The syntax used **on this website** (📌) is that commands starting with the prompt

* `PS>` are working in both a CMD or a Powershell
* `CMD>` are only working in a CMD

You can start a CMD with the commands `cmd`/`cmd.exe`, and a powershell with the commands `powershell`/`powershell.exe`.
</div><div>

**Hint 1**

To run administrative commands in a CMD/Powershell, you need to start it by right-clicking on it, and using "Run as administrator".

**Hint 2**

You can open a CMD/powershell in a folder by using <kbd>SHIFT+Right-click</kbd> on the folder, then selecting "Open a Powershell here". Note that since Windows 11, you have to click on "More options" first...
</div></div>

<hr class="sep-both">

## CMD commands

If you don't use powershell, which is Linux friendly so most Unix commands are available, here are some commands that you will most likely use. See [comparison of cmdlets with similar commands](https://en.wikipedia.org/wiki/PowerShell#Comparison_of_cmdlets_with_similar_commands). If you need help, use `command /?`, `help command`, `command /help`...

<div class="row row-cols-md-2 mt-4"><div>

* 🍃 `cd`: move to another folder

* 📝️ `dir`: list files, same as `ls`

* 📖 `type`: print files, same as `cat`

* 🧹 `cls`: clear the screen, same as `clear`

</div><div>

* 🔎 `find`: search files

* 🔎 `findstr`: search content in files, same as `grep`

* 🗃️ `move`: move files

* 🎣 `curl`: fetch web resources
</div></div>

<hr class="sep-both">

## Permissions, and users

<div class="row row-cols-md-2"><div>

**Users**

* `system`: an automatically created account used by the system to do internal tasks. It has more rights than an administrator.
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
PS> icacls xxx
xxx NT AUTHORITY\SYSTEM:(I)(F)
    BUILTIN\Administrators:(I)(F)
    Local\username:(I)(F)
```
</div></div>

<hr class="sep-both">

## File system

<div class="row row-cols-md-2"><div>

Modern versions of Windows are using the New Technology File System (**NTFS**). Before, FAT16/32, and HPFS were used. FAT is still used for stuff like USB keys. NTFS is a file system that can repair itself in case of failure, using logs. It's known as a journaling file system.

**Case-insensitive**

Unlike linux, for Windows, `a` and `A` are the same. And you can use `\ ` (the default separator), and `/` (Unix separator).

```bash
PS> cd c:\Users\xxx
PS> cd C:\Users\xxx
PS> cd /Users/xxx
PS> cd \Users\xxx
```

</div><div>

I'm using below Unix Paths, because it's easier to write. See environment variables for the path, if it was changed.

* root: `/`, which is usually `c:\ `
* Windows root: usually `/Windows`
* Find users files
    * `/Users`
    * `/Users/xxx/Desktop` (ex: user `xxx`)
    * `/Users/xxx/Documents`  (ex: user `xxx`)
* Installed programs
  * `"/Program Files/"`
  * `"/Program Files (x86)/"`
  * `%appdata%`: usually used to install app without administrator privilege <small>(locally installed)</small>, or to store application data.
</div></div>

<hr class="sep-both">

## Environment variables

<div class="row row-cols-md-2"><div>

The syntax to display/use an environment variable is different.

```bash
# only in Powershell
PS> ls Env: # list all
PS> echo $Env:systemroot # print one
PS> $Env:xxx = 'yyy' # set
```

```bash
CMD> set # list all
CMD> echo %windir% # print one
```
</div><div>

Environment variables are

* `PATH`: same use as on Linux
* `PATHEXT`: extensions that you may omit in commands
* `USERNAME`: current user
* `SystemDrive`: location to system drive
* `SystemRoot` / `windir`: location to Windows root
* `ProgramFiles`: location to program files
* `ProgramFiles(x86)`: location to program files
* `APPDATA`: location to app data
* `TEMP` / `TMP`: location to temp folder
</div></div>

<hr class="sep-both">

### Windows services

You can use the commands next to each task to use/open them, and you can also enter the command inside "execute" (Win  ➕ R). Note that extension that you may see are such as ".exe", or ".msc" optional (see `PATHEXT`).

<div class="row row-cols-md-2"><div>

**Task Manager** (`taskmgr`)

* Shortcut: <kbd>CTRL+SHIFT+ESC</kbd>
* List running processes
* This guide is quite complete [Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/)

**Control panel** (`control`)

* This is the entry point to most settings
* In the top-right corner, it's possible to switch to another view <small>(ex: small icons)</small>, in which you may discover menus that you never opened before, but may but useful one way or another.
</div><div>

* `lusrmgr.msc`: list of users/groups
* `msconfig`: see services, manage system configurations
* `lsass` is responsible for authentication within Windows.
* `winver`: show Windows version+build, and licence holder.
* `control system`: open system info (Device/Windows specifications)
* `msinfo32`: system info (raw, can search) + hardware and services
* `UserAccountControlSettings`: change UAC settings
* `compmgmt` is responsable for managing **shares**, **running tasks**, **listing events** ([doc](https://learn.microsoft.com/en-us/windows/win32/eventlog/event-types), monitor performance (`perfmon`/`resmon`), or even manage device hardware/services.
* `regedt32/regedit`: open Windows registry, a database used to store information needed to configure the system for users/applications/devices <small>(ports in use, applications...)</small>. See the [doc](https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/windows-registry-advanced-users).
</div></div>

<hr class="sep-both">

### Windows security

<div class="row row-cols-md-2 mt-4"><div>

**Windows Update** (`control /name Microsoft.WindowsUpdate`)

A service looking for updates, downloading them, and asking <small>(forcing since Windows 10)</small> the user to install them. They are usually released on the 2nd Tuesday of each month (Patch Tuesday).
</div><div>

**Windows security** / **Windows defender**

A set of tools to protect your Windows. There is an antivirus, which has a "ransomware protection" feature. There is a firewall to set rules for your network traffic. [SmartScreen](https://learn.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview) was design to protects against phishing or malware, and there is a tab with security features such as Core isolation.


**BitLocker**

The Trusted Platform Module (TPM) hardware component providing security against tampering, or many other things. BitLocker was designed "to help protect user data, and to ensure that a computer has not been tampered with while the system was offline", as per [Microsoft](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview).
</div></div>