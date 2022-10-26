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