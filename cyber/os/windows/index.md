# Exploit Windows

[![windowsfundamentals1xbx](../../_badges/windowsfundamentals1xbx.svg)](https://tryhackme.com/room/windowsfundamentals1xbx)
[![windowsfundamentals2x0x](../../_badges/windowsfundamentals2x0x.svg)](https://tryhackme.com/room/windowsfundamentals2x0x)
[![windowsfundamentals3xzx](../../_badges/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)
[![retro](../../_badges/retro.svg)](https://tryhackme.com/room/retro)
[![ice](../../_badges/ice.svg)](https://tryhackme.com/room/ice)
[![blaster](../../_badges/blaster.svg)](https://tryhackme.com/room/blaster)

<hr class="sl">

## Knowledge about Windows

*It will, most likely, not change your life much if you know this, but, it's interesting I think.*

<div class="row row-cols-md-2"><div>

**File system**

Modern versions of Windows are using the New Technology File System (**NTFS**). Before, FAT16/32, and HPFS were used. FAT is still used for stuff like USB keys. NTFS is a file system that can repair itself in case of failure, using logs. It's known as a journaling file system.

**Task Manager**

* Shortcut: <kbd>CTRL+SHIFT+ESC</kbd>
* List running processes
* This guide is quite complete [Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/)

**Control panel**

* This is the entry point to most settings
* In the top-right corner, it's possible to switch to another view <small>(ex: small icons)</small>, in which you may discover menus that you never opened before, but may but useful one way or another.

</div><div>

**Users**

* `Administrator`: manage users, apps, groups, system-wide settings...
* `Standard User`: can use apps, can access their files

When there is a need for a user to elevate, Windows will show the User Account Control (UAC), in which a root user can press "yes", and a non-root user will have to log in using an account having sufficient privileges to do the requested action.

**Permissions**

Windows has 7 categories of permissions: Read, Write, Read & Execute, List Folder Contents, Modify, Full Control. You can learn more about them in this [article](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/bb727008(v=technet.10)#understanding-file-and-folder-permissions).

The administrator can set permissions for a group, and users may be in multiple groups.
</div></div>

<hr class="sr">

## Windows handy commands

*For a complete list of commands, you may check [Windows server shell reference](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands).*

<div class="row row-cols-md-2"><div>

Most Linux commands are available, although they are aliases to Windows commands

* `cd`: move to another folder
* `ls`: list files in a folder
* `pwd`: path to the current directory
* `cat`: print (usually small) files
* `find`: find a file/folder
* `wget`: download something
</div><div>

Learn more about your environment

* `whoami`: see your username, or `NT AUTHORITY\SYSTEM` (root)
* `hostname`: see hostname
* `systeminfo`: see infos about the system
* `Get-ChildItem -Path Env:`: see environment variables
* `$Env:windir`: print the value of one environment variable
* `$Env:xxx = 'yyy'`: set an environment variable

Infos on a Local Machine

* `Get-LocalGroup`: list groups (users, administrators...)
* `Get-LocalUser`:list users
* `net localgroup users`:list users in the group "users"
* `net localgroup administrators`: list administrators
* `net user username`: infos about an user
</div></div>

<hr class="sl">

## Windows environment

*Note that you may not be able to use Linux paths such as `/` instead of `c:\\`, as I'm using bellow.*

<div class="row row-cols-md-2"><div>

**Look for (sensitive?) information** 🔑

* `cd /`: the root, maybe you will find something interesting?
* `/Users`: usually, each folder is associated with a user
  * `/Users/xxx/Desktop`
  * `/Users/xxx/Documents`
  * You should also check the trash-box
  * Check browser history / credentials...
* Maybe check `%appdata%`

<br>

**Windows files** <small>(it may not be `/Windows`, see `$Env:windir`)</small>

* in a file explore, enter `%windir%`
* `cd /Windows/System32/config/`: this may be a location for the **Security Account Manager** (**SAM**) database file is stored. This file is used to store users, their passwords, their groups...
</div><div>

**Windows services** <small>(usually use "Win✖️R" to open one)</small>:

* `lusrmgr.msc`: list of users/groups
* `taskmgr`: open the task manager
* `MSConfig`: open the system configuration menu
* `lsass` is responsible for authentication within Windows. There is [mimikatz/kiwi](https://github.com/gentilkiwi/mimikatz) (16.2k ⭐) to extract passwords from the memory. For instance, if there is a task running belonging to a user, even if they are not logged in, we can get their password.

<br>

**Random**

* Kerberos is the authentication system in Windows domains.
</div></div>

<hr class="sr">

## Alternate Data Streams (ADS)

<div class="row row-cols-md-2"><div>

On a file system using NTFS, ADS allow files to have more than one stream (`flux`) of data. By default, every file has only one stream: **:$DATA**. You can inspect a file using

```powershell
> Get-Item -Path SomeFile -Stream *

PSPath        : Microsoft.PowerShell.Core\FileSystem::XXX\toto.pdf::$DATA
PSParentPath  : Microsoft.PowerShell.Core\FileSystem::XXX
PSChildName   : toto.pdf::$DATA
PSDrive       : XXX
PSProvider    : Microsoft.PowerShell.Core\FileSystem
PSIsContainer : False
FileName      : XXX\toto.pdf
Stream        : :$DATA
Length        : 0
```
</div><div>

They can be used by Windows to store data, such as identifier on a file telling the operating system that this file was download from the Internet.

Hackers can use that to store malicious code inside a file. They can execute it like this later, for instance using a legit/non-malicious application

```powershell
> $(Resolve-Path .\file.exe:stream)
```

More about it:

* [Introduction to Alternate Data Streams](https://www.malwarebytes.com/blog/news/2015/07/introduction-to-alternate-data-streams)
</div></div>