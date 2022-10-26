# Learn again

* https://www.kali.org/tools/hashid/
* https://github.com/t0thkr1s/gtfo
* https://vulners.com/ -> https://vulners.com/cve/CVE-2016-1531
* WTF (strace) https://jvns.ca/strace-zine-v3.pdf
* no_root_squash: if a root user (client) is dumping a file on the server, then they will be created as "root": https://en.wikipedia.org/wiki/Unix_security#Root_squash
* https://github.com/mzet-/linux-exploit-suggester
* https://github.com/diego-treitos/linux-smart-enumeration (lse)
* https://0xsanz.medium.com/70-ways-to-get-root-linux-privilege-escalation-d98ec78f1405 (do not seem really "useful")
* ".old" as backups
* unexpected folders in "/"
* hydra -l username -P rockyou.txt ssh://{target ip}
  * try to bruteforce ssh password
  * ssh xxx@yyy -T -L xxx:domain:xxx: create a tunnel mapping one port to another, need more research.
* Nessus policies
  * if you have a scope/knowledge of specific ports/app (dig)
  * Discovery (all ports for instance)
  * Credentials tabs
* we may try to find urls with ".bak" files, like backup of scripts...

* Must read again
  * https://tryhackme.com/room/blue
  * https://tryhackme.com/room/ice
  * https://tryhackme.com/room/linuxstrengthtraining
  * https://tryhackme.com/room/blaster
  * https://tryhackme.com/room/kenobi

* Random: https://www.thewindowsclub.com/how-to-create-a-virtualbox-shared-folder-in-windows

<hr class="sl">

## WEB

URL

* Scheme: (protocol) HTTP/HTTPS/...
* Username:Password@Domain:port/Path?query#Fragment
* Methods GET, DELETE...
* Headers
  * Server: some server
  * Set-cookie: ... => server send the cookie in every request
  * ...
* Response code

<hr class="sep-both">

## Burp

Burp Suite is also very commonly used when assessing mobile applications, as the same features which make it so attractive for web app testing translate almost perfectly into testing the APIs (Application Programming Interfaces) powering most mobile apps.

* Proxy: intercept, and modify request
* Repeater: intercept, modify, and resend multiple times
* Intruder: try to bruteforce entrypoint/forms/...
* Decoder: decode something, or encode a payload
* Comparer: compare data
* Sequencer: check algorithm generating tokens/...

```
Ctrl + Shift + D Switch to the Dashboard
Ctrl + Shift + T Switch to the Target tab
Ctrl + Shift + P Switch to the Proxy tab
Ctrl + Shift + I Switch to the Intruder tab
Ctrl + Shift + R Switch to the Repeater tab
```

* Project options (only one project)
* Users options (application-wise)

--- Proxy

* intercept is on
* HTTP history: even if off, we can find requests here
* In the proxy options, we can grab responses, or add a filter on only some responses
* forward: allow to pass (CTRL+F)
* Right-click > send to
* https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-basic/
  * click on it
  * options
  * Title: Burp
  * Proxy IP: 127.0.0.1 
  * Port: 8080
  * click on your config to turn it on
* HTTPS
  * http://burp/cert cacert.der
  * http://burpsuite/ -> CA
  * You need to intercept the request!
  * https://portswigger.net/burp/documentation/desktop/external-browser-config/certificate
    * Search certificates
    * View certificates
    * import
    * Trust this CA to identify websites
    * OK > OK
* There is an integrated preconfigured chrominium web browser if needed
* Scoping: avoid capturing two much
  * Target > select a target > Right-click > add to scope
  * "yes" to disable out of scope logs
  * in the proxy options, you can only intercept scoped requests
* Target > Site map
  * map the website as we visit it
* Target > Issues definitions: list of attacks BurpSuite can detect.
* In the proxy, you need to ensure that values are encoded. Select something > convert in > URL > URL encode key characters. Use the shortcut CTRL+U.

<hr class="sep-both">

## Windows

The file system used in modern versions of Windows is the New Technology File System or simply NTFS. Before NTFS, there was FAT16/FAT32 (File Allocation Table) and HPFS (High Performance File System). You still see FAT partitions in USB devices, MicroSD cards, etc.

NTFS is known as a journaling file system. In case of a failure, the file system can automatically repair the folders/files on disk using information stored in a log file. This function is not possible with FAT.

NTFS addresses many of the limitations of the previous file systems; such as:

Supports files larger than 4GB
Set specific permissions on folders and files
Folder and file compression
Encryption (Encryption File System or EFS)

* https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands

The permissions are: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/bb727008(v=technet.10)

* %windir% (search) path to C:\Windows (usually)
  * The System32 folder holds the important files that are critical for the operating system.
* `$Env:windir` / `Get-ChildItem -Path Env:`
* https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2
* User accounts: 
  * Administrator: add users, delete users, modify groups, modify settings on the system, etc.
  * Standard User=Member: modify its own folder
  * `Get-LocalGroup`
  * `net localgroup users`
  * C:\Users
  * Search bar > lusrmgr.msc
  * Or Windows+R > lusrmgr.msc
  * lusrmgr.msc: interface to groups/users
  * `Get-LocalUser`
  * `net user quent` https://spgeeks.devoworx.com/get-groups-in-which-a-user-is-a-member-using-cmd/ (see full name, last password change, groups...)

if you click on Groups, you see all the names of the local groups along with a brief description for each group.

Each group has permissions set to it, and users are assigned/added to groups by the Administrator. When a user is assigned to a group, the user inherits the permissions of that group. A user can be assigned to multiple groups.
* User Account Control (UAC)
  * Everyone is a user
  * When there is a need to upgrade a process
  * Then user is prompted
* See tasks
  * Ctrl+Shift+Esc
  * https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/
* Control panel > small icons
* MSConfig W+R
* taskmgr W+R

<hr class="sep-both">

## ADS

Alternate Data Streams (ADS) is a file attribute specific to Windows NTFS (New Technology File System).

Every file has at least one data stream ($DATA), and ADS allows files to contain more than one stream of data. Natively Window Explorer doesn't display ADS to the user. There are 3rd party executables that can be used to view this data, but Powershell gives you the ability to view ADS for files.

From a security perspective, malware writers have used ADS to hide data.

Not all its uses are malicious. For example, when you download a file from the Internet, there are identifiers written to ADS to identify that the file was downloaded from the Internet.

To learn more about ADS, refer to the following link from MalwareBytes here.

* https://blog.malwarebytes.com/101/2015/07/introduction-to-alternate-data-streams/

Alternate Data Streams (ADS)
Dans les fichiers NTFS, généralement un flux :$DATA est le flux par défaut, mais il peut y avoir d’autres flux cachés dans un exécutable.
Get-Item -Path fichier.exe -Stream * : voir tous les flux
wmic process call create $(Resolve-Path .\fichier.exe:flux) : lancer l’exécutable via un flux