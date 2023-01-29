# Operating System (Windows)

<div class="row row-cols-md-2"><div>

Microsoft Windows is the most used operating system. Windows versions that were quite used are Windows XP, Windows 7, Windows 10, and now Windows 11 is slowly gaining new users.

> There are a lot of things that are similar to [Linux Operating systems](/operating-systems/linux/knowledge/index.md), so I will add fewer details here.
</div><div>

Some dates about the latest versions

* Windows 7 (2009-2020)
* Windows 10 (2015-2025)
* Windows 11 (2021-???)
* Windows 12 (???-???)
</div></div>

<hr class="sep-both">

## Windows images (ISO)

If you don't have Windows, as a developper, you can use an emulator with one of the images below.

<div class="row row-cols-md-2 mt-3"><div>

* [Windows 10 Enterprise](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise) <small>(official evaluation version, free)</small>
* [Windows 11 Enterprise](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-11-enterprise) <small>(official evaluation version, free)</small>
* [Windows 11 Enterprise](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/) <small>(official evaluation version, free)</small>
* [Windows 7/8/10](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/) <small>(90 days, IEUser/Passw0rd!)</small>
</div><div>

* [Windows XP Professional](https://www.microsoft.com/en-us/download/details.aspx?id=31791) <small>(free, official)</small>
* [Windows XP](https://download.cnet.com/Windows-XP-Mode/3000-18513_4-77683344.html) <small>(backup, was free, but removed recently)</small>.
* [Windows 10/11/Server 2019/Server 2022 (Student)](https://azureforeducation.microsoft.com/devtools) <small>(only for students, free, official, ISO+Activation key)</small>.
</div></div>

<hr class="sep-both">

## Windows console

<div class="row row-cols-md-2"><div>

You can run commands on Windows inside a **CMD** (Command Prompt), or inside a [**PowerShell**](../powershell/index.md). The latter is an improved version of the former, which is retro compatible: commands working in a CMD are, ⚠️for most ⚠️, working inside a PowerShell.

The syntax used **on this website** (📌):

* `PS>`: commands only available in PowerShell
* `CMD>` commands available in both CMD and PowerShell

You can start a CMD with `cmd` or `cmd.exe`. You can start a PowerShell with `powershell` or `powershell.exe`. You can also use

```powershell
CMD> powershell -c "PowerShell command here"
```
</div><div>

**Hint 1**

⚠️⚠️ DANGER ⚠️⚠️. There are many aliases in PowerShell, such as `sc` for `Set-Content`. The problem is that some aliases are also CMD commands... The easy solution is to add `.exe`, such as `sc.exe`.

**Hint 2**

To run administrative commands in a CMD/PowerShell, you need to start it by right-clicking on it, and using "Run as administrator".

**Hint 3**

You can open a CMD/PowerShell in a folder by using <kbd>SHIFT+Right-click</kbd> on the folder, then selecting "Open a PowerShell here". Note that since Windows 11, you have to click on "More options" first...
</div></div>

<hr class="sep-both">

## CMD commands

If you don't use PowerShell, which is Linux friendly so most Unix commands are available, here are some commands that you will most likely use. See [comparison of cmdlets with similar commands](https://en.wikipedia.org/wiki/PowerShell#Comparison_of_cmdlets_with_similar_commands). If you need help, use `command /?`, `help command`, `command /help`...

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

* `LocalSystem`: an automatically created account used by the system to do internal tasks. It has higher privileges than Administrator.
* `Administrator`: manage users, apps, groups, and system-wide settings...
* `Standard User`: can use apps, can access their files...

**Groups**

Administrators can set permissions for a group, and users may be in multiple groups.

**User Account Control (UAC)** (=sudo)

When there is a need for a user to elevate, Windows will show the User Account Control (UAC), in which a root user can press "yes", and a non-root user will have to log in using an account having sufficient privileges to do the requested action.
</div><div>

**Permissions** ([doc](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/bb727008(v=technet.10)#understanding-file-and-folder-permissions))

Windows has 7 categories of permissions: Read <small>(**R**)</small>, Write <small>(**W**)</small>, List Folder Contents, Read & Execute <small>(**RX**)</small>, Modify <small>(**M**)</small>, Full Control <small>(**F**)</small> and Special permissions.

There are advanced permissions: Create Directory <small>(**AD**)</small>, Create File <small>(**WD**)</small>, Delete <small>(**D**)</small>, Execute/Traverse <small>(**X**)</small>...

Permissions are controlled by Discretionary Access Control List (DACLs), see the [icacls](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/icacls) command.

```ps
CMD> icacls xxx
xxx  NT AUTHORITY\SYSTEM:(I)(F)
     BUILTIN\Administrators:(I)(F)
     Local\username:(I)(F)
CMD> icacls xxx /grant Everyone:F
CMD> icacls xxx /grant username:F
```
</div></div>

<hr class="sep-both">

## File system

<div class="row row-cols-md-2"><div>

Modern versions of Windows are using the New Technology File System (**NTFS**). Before, FAT16/32, and HPFS were used. FAT is still used for stuff like USB keys. NTFS is a file system that can repair itself in case of failure, using logs. It's known as a journaling file system.

**Case-insensitive**

Unlike Linux, for Windows, `a` and `A` are the same. And you can use `\ ` (the default separator), and `/` (Unix separator).

```ps
CMD> cd c:\Users\xxx
CMD> cd C:\Users\xxx
CMD> cd /Users/xxx
CMD> cd \Users\xxx
```

</div><div>

I'm using below Unix Paths, because it's easier to write. See environment variables for the path, if it was changed.

* root: `/`, which is usually `c:\ `
* Windows root: usually `/Windows`
* Files belonging to a user
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

```powershell
PS> ls Env: # list all
PS> echo $Env:systemroot # print one
PS> $Env:xxx = 'yyy' # set
```

These commands are only available in a CMD

```powershell
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

## Windows services

You can use the commands next to each task to use/open them, and you can also enter the command inside "execute" (Win  ➕ R). Note that extensions that you may see are such as ".exe", or ".msc" optional (see `PATHEXT`).

<div class="row row-cols-md-2"><div>

**Task Manager** (`taskmgr`)

* Shortcut: <kbd>CTRL+SHIFT+ESC</kbd>
* List of running processes
* This guide is quite complete [Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/)

**Control panel** (`control`)

* This is the entry point to most settings
* In the top-right corner, it's possible to switch to another view <small>(ex: small icons)</small>, in which you may discover menus that you (most likely) never opened before, but may but useful one way or another.
</div><div>

* `lusrmgr.msc`: list of users/groups
* `msconfig`: see services, manage system configurations
* `lsass` is responsible for authentication within Windows.
* `winver`: show Windows version+build, and license holder.
* `control system`: open system info <small>(device/Windows specs)</small>
* `msinfo32`: system info <small>(raw, can search)</small>, hardware and services
* `UserAccountControlSettings`: change UAC settings
* `compmgmt` is responsible for managing **shares**, **running tasks**, **listing events** ([doc](https://learn.microsoft.com/en-us/windows/win32/eventlog/event-types), monitoring performance (`perfmon`/`resmon`), or even manage device hardware/services.
* `regedt32/regedit` ([doc](https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/windows-registry-advanced-users)): open Windows registry, a database used to store information needed to configure the system for users/applications/devices <small>(ports in use, applications...)</small>.
</div></div>

<hr class="sep-both">

## Windows security

<div class="row row-cols-md-2 mt-4"><div>

**Windows Update** (`control /name Microsoft.WindowsUpdate`)

A service looking for updates, downloading them, and asking <small>(forcing since Windows 10)</small> the user to install them. They are usually released on the 2nd Tuesday of each month (Patch Tuesday).
</div><div>

**Windows security** / **Windows defender**

A set of tools to protect your Windows. There is an antivirus, which has a "ransomware protection" feature. There is a firewall to set rules for your network traffic. [SmartScreen](https://learn.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview) was designed to protect against phishing or malware, and there is a tab with security features such as Core isolation.


**BitLocker**

The Trusted Platform Module (TPM) hardware component provides security against tampering along with many other things. BitLocker was designed "to help protect user data and to ensure that a computer has not been tampered with while the system was offline", as per [Microsoft](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview).
</div></div>