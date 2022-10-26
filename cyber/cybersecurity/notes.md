# Learn again

* https://0xsanz.medium.com/70-ways-to-get-root-linux-privilege-escalation-d98ec78f1405 (do not seem really "useful")
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