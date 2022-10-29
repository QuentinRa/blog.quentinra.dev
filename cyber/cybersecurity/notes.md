# File upload

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

A user may upload a file on a server such as an avatar. You must prevent users from uploading malicious files (ex : scripts), AND prevent users from accessing content belonging to other users (if they shouldn't).

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Secure filters for uploaded files
  * ❌ DO NOT use some stupid filter allowing "xxx.png.php"
  * ❌ DO NOT use /upload /images /media /resources /tmp for user (non-public) files, and better, do not allow access to non-public files via URL <small>(or at least, use a "deny all, allow xxx" kind of .htaccess)</small>. Usually, instead of matching a folder (ex: "www") with the server root <small>(ex: "localhost/")</small>, we are matching it with a sub-folder <small>(ex: www/public)</small>, so that we can use a folder such as "www/uploads" not available via URL <small>(you can't do "localhost/../uploads" in a URL)</small>.
  * ❌ DO NOT trust "content-type"
  * ❌ USE secure functions/ways to get the name of the uploaded file. Hackers can try to bypass them, like by using ASCII characters, or stuff like that.

If an attacker manage to upload a PHP script on the server, they will most likely try to do **reverse engineering**, meaning using a command such as `sudo nc -lvnp 443`, and accessing a remote shell on your server <small>(443 = HTTPS, so you go "unnoticed")</small>.

<hr class="sep-both">

## OWASP

* https://owasp.org/www-project-top-ten/
* Juiceshop
* https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html
* https://github.com/OWASP/wstg
* https://wiki.owasp.org/index.php/OWASP_Testing_Guide_v4_Table_of_Contents
* https://github.com/OWASP/CheatSheetSeries
* https://www.zaproxy.org/
* https://github.com/OWASP/Amass

<hr class="sep-both">

## enum4linux

![Usage: Enumerating Information](https://img.shields.io/badge/usage-Enumerating%20Information-ffd700)

I don't know if there is still an `enum.exe`, because I can't find it, but you can use the tool [enum4linux](https://github.com/CiscoCXSecurity/enum4linux) for enumerating information from Windows, and Samba hosts.

```bash
$ ./enum4linux.pl <options> <ip>
# -U : list of users
# -M : list of devices
# -S : list of shares
# -o : os data
# -i : printer data
# -v : verbose
```

<hr class="sep-both">

# Notes

* https://tryhackme.com/resources/blog/online-training-for-careers
* https://tryhackme.com/resources/blog/cyber-security-awareness-month
* https://www.virustotal.com/gui/home/upload
* https://www.hybrid-analysis.com/
* https://otx.alienvault.com/ (An open-source threat tracking system)

<hr class="sep-both">

## Other

The Operating System (OS) is the layer sitting between the hardware and the applications and programs you are running.

* Passwords saved in notes
* Private photos/documents/emails
* CIA
  * Confidentiality: ensure ONLY those allowed can access
  * Integrity: not tampered with
  * Availability: available when needed
* Principle of the least privilege. 
* Intrusion Detection System (IDS): detect (IPS=blocks) system/network intrusion, and tries to break into the network
* Virtual Private Network (VPN) concentrator appliance: A VPN ensures that the network traffic cannot be read nor altered by a third party. It protects the confidentiality (secrecy) and integrity of the sent data.
* Antivirus software: You install an antivirus on your computer or smartphone to detect malicious files and block them from executing. 
* Host firewall: Unlike the firewall appliance, a hardware device, a host firewall is a program that ships as part of your system, or it is a program that you install on your system. For instance, MS Windows includes Windows Defender Firewall, and Apple macOS includes an application firewall; both are host firewalls.
* https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html
* SOC
  * 24 hours a day, seven days a week
  * vulnerabilities
  * use logs (DHCP, firewall, DNS...)
  * might use a SIEM
  * Network security monitoring (NSM): This focuses on monitoring the network data and analyzing the traffic to detect signs of intrusions. 
  * Threat hunting: With threat hunting, the SOC assumes an intrusion has already taken place and begins its hunt to see if they can confirm this assumption.
  * Other services by the SOC include cyber security training.

<hr class="sep-both">

# Resources

* There are websites on the Internet that allow you to check the reputation of an IP address to see whether it's malicious or suspicious.
  * AbuseIPDB
  * Cisco Talos Intelligence

>  cyber attack include an attacker making our network or systems inaccessible, defacing (changing) the public website,

<hr class="sep-both">

## Web

* **Load Balancers**: handle if a server is down (periodic health check - if no response, no more clients until there is an answer), and manage the server load
  * algorithms are round-robin, which sends it to each server in turn, or weighted, which checks how many requests a server is currently dealing with and sends it to the least busy server
* CDN (Content Delivery Networks): CDN works out where the nearest server is physically located and sends the request there instead of potentially the other side of the world
* Common databases: MySQL, MSSQL, MongoDB, GraphQL, Postgres
* WAF (Web Application Firewall)
  * protect web servers (ex: against DDOS)
  * analyse if the traffic comes from a bit, and the rate of the traffic
* Apache, Nginx, IIS and NodeJS
* Virtual Hosts: one server and multiples domains
* PHP, Python, Ruby, NodeJS, Perl and many more

<hr class="sep-both">

# Learn again

* netdiscover
* https://github.com/hashcat/hashcat
* hashcat --username --show -a 0 -m 1000 hashes.txt rockyou.txt
  * xxx:yyy --username ignore xxx
  * -a: attack mode
  * -m: hash type=nt=1000
  * https://github.com/hashcat/hashcat
* type file (cat file)
* https://www.sans.org/cyberaces/
* File permissions in Windows are controlled using DACLs (Discretionary Access Control List). To view these DACLs you can use the icacls command
* whoami /groups: see your groups
* dir flag* /s /p | search -f flag*
* https://crackstation.net/
* bg instead of background?
* In practice, any NT/SYS is ok
* X
  * use auxiliary/analyze/crack_windows
  * set CUSTOM_WORDLIST /usr/share/wordlists/rockyou.txt
* echo xxx name >> /etc/hosts 
* nmap xxx
  * Service Info: Host: Os: 
* https://github.com/wyllianbs/xfreerdp-gui && https://github.com/FreeRDP/FreeRDP
  * xfreedrp /u:x /p:y /v:ip
* https://msrc.microsoft.com/update-guide/en-US/vulnerability/CVE-2019-1388

<hr class="sep-both">

## Windows

* C:\Windows\system32\winver.exe: display windows version information
* C:\Windows\System32\control.exe system: view basic information about the system
* C:\Windows\System32\control.exe: open the control panel
* C:\Windows\System32\UserAccountControlSettings.exe: UAC settings
* Windows R > msconfig > Tools
* System Configuration (compmgmt)
  * System Tools
    * schedule tasks
    * view events that occured on the computer (https://learn.microsoft.com/en-us/windows/win32/eventlog/event-types, https://learn.microsoft.com/en-us/windows/win32/eventlog/eventlog-key)
    * Shared Folders is where you will see a complete list of shares and folders shared that others can connect to. In sessions, you can see users connected to shares.
    * users, and groups
    * In Performance, you'll see a utility called Performance Monitor (perfmon). Perfmon is used to view performance data either in real-time or from a log file. This utility is useful for troubleshooting performance issues on a computer system, whether local or remote. 
    * Device Manager allows us to view and configure the hardware, such as disabling any hardware attached to the computer.
  * Storage: Under Storage is Windows Server Backup and Disk Management.

WMI Control configures and controls the Windows Management Instrumentation (WMI) service.

Per Wikipedia, "WMI allows scripting languages (such as VBScript or Windows PowerShell) to manage Microsoft Windows personal computers and servers, both locally and remotely. Microsoft also provides a command-line interface to WMI called Windows Management Instrumentation Command-line (WMIC)."

Note: The WMIC tool is deprecated in Windows 10, version 21H1. Windows PowerShell supersedes this tool for WMI.

* C:\Windows\System32\msinfo32.exe: open system information
* %systemroot%
* resmon / Resource Monitor (CPU Disk Network Memory)
* ipconfig
* A  command to retrieve the help manual for a command is /?
* To clear the command prompt screen, the command is cls. 
* The next command is netstat. Per the help manual, this command will display protocol statistics and current TCP/IP network connections. 
* The net command is primarily used to manage network resources. This command supports sub-commands.
* net help /help too?
* gcm ipconfig https://stackoverflow.com/questions/304319/is-there-an-equivalent-of-which-on-the-windows-command-line

xxx

* C:\Windows\System32\regedt32.exe: open windows registry
* regedit
* The Windows Registry (per Microsoft) is a central hierarchical database used to store information necessary to configure the system for one or more users, applications, and hardware devices.

The registry contains information that Windows continually references during operation, such as:

Profiles for each user
Applications installed on the computer and the types of documents that each can create
Property sheet settings for folders and application icons
What hardware exists on the system
The ports that are being used.
* https://docs.microsoft.com/en-us/troubleshoot/windows-server/performance/windows-registry-advanced-users

yyy

* Windows Update

Windows Update is a service provided by Microsoft to provide security updates, feature enhancements, and patches for the Windows operating system and other Microsoft products, such as Microsoft Defender.

Updates are typically released on the 2nd Tuesday of each month. This day is called Patch Tuesday. That doesn't necessarily mean that a critical update/patch has to wait for the next Patch Tuesday to be released. If the update is urgent, then Microsoft will push the update via the Windows Update service to the Windows devices.

https://msrc.microsoft.com/update-guide

control /name Microsoft.WindowsUpdate

* Windows security - Windows defender
  * Antivirus. Can enable ransomware protection.
  * Firewall (Allow an app through firewall, WF.msc)
  * SmartScreen (protect against phishing..., https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview)
  * Device security (core isolation)

What is the Trusted Platform Module (TPM)?

Per Microsoft, "Trusted Platform Module (TPM) technology is designed to provide hardware-based, security-related functions. A TPM chip is a secure crypto-processor that is designed to carry out cryptographic operations. The chip includes multiple physical security mechanisms to make it tamper-resistant, and malicious software is unable to tamper with the security functions of the TPM".

* BitLocker

Per Microsoft, "BitLocker Drive Encryption is a data protection feature that integrates with the operating system and addresses the threats of data theft or exposure from lost, stolen, or inappropriately decommissioned computers".

On devices with TPM installed, BitLocker offers the best protection.

Per Microsoft, "BitLocker provides the most protection when used with a Trusted Platform Module (TPM) version 1.2 or later. The TPM is a hardware component installed in many newer computers by the computer manufacturers. It works with BitLocker to help protect user data and to ensure that a computer has not been tampered with while the system was offline".

Refer to the official Microsoft documentation to learn more about BitLocker (https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview). 

* https://docs.microsoft.com/en-us/windows-server/storage/file-server/volume-shadow-copy-service

Per Microsoft, the Volume Shadow Copy Service (VSS) coordinates the required actions to create a consistent shadow copy (also known as a snapshot or a point-in-time copy) of the data that is to be backed up.

Volume Shadow Copies are stored on the System Volume Information folder on each drive that has protection enabled.

If VSS is enabled (System Protection turned on), you can perform the following tasks from within advanced system settings.

Create a restore point
Perform system restore
Configure restore settings
Delete restore points

From a security perspective, malware writers know of this Windows feature and write code in their malware to look for these files and delete them. Doing so makes it impossible to recover from a ransomware attack unless you have an offline/off-site backup.

* Right-click on a hard-drive > shadow copies
* https://docs.microsoft.com/en-us/windows/win32/amsi/antimalware-scan-interface-portal
* https://docs.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-manage
* https://support.microsoft.com/en-us/windows/learn-about-windows-hello-and-set-it-up-dae28983-8242-bb2a-d3d1-87c9d265a5f0#:~:text=Windows%2010,in%20with%20just%20your%20PIN.
* https://www.csoonline.com/article/3253899/the-best-new-windows-10-security-features.html
* Note: Attackers use built-in Windows tools and utilities in an attempt to go undetected within the victim environment.  This tactic is known as Living Off The Land. Refer to the following resource here to learn more about this. 
* https://lolbas-project.github.io/

<hr class="sep-both">

## xx

https://tryhackme.com/room/pentestingfundamentals

* White Hat: follows the rules; try to benefit others
* Grey Hat: benefit others often, but usually not following the rules (ex: take down malicious website)
* Black Hat: criminals

**Rules of Engagement (ROE)**

Penetration tester determine the scope with the system owner. Everything outside the scope is deemed illegal. https://sansorg.egnyte.com/dl/bF4I3yCcnt/?. Determine the Permission, the scope (ex: some servers), and rules (ex: forbid some techniques)


**Stages**

* Information Gathering
* Enumeration/Scanning (discovering applications and services)
* Exploitation
* Privilege Escalation (Once you have successfully exploited a system or application (known as a foothold).  You can escalate horizontally and vertically)
* Post-exploitation

**X**

* https://www.isecom.org/OSSTMM.3.pdf (OSSTMM)
* OWASP https://owasp.org/ security of web applications and services
* NIST Cybersecurity Framework 1.1 https://www.nist.gov/cyberframework
* NCSC CAF https://www.ncsc.gov.uk/collection/caf/caf-principles-and-guidance

**YYY**

* Black-box no knowledge
* Grey-box partial/limited knowledge
* White-box full knowledge
* msf exploit(handler) > exploit -k -z

<hr class="sep-both">

## xx

https://tryhackme.com/room/principlesofsecurity

Defence in Depth is the use of multiple varied layers of security to an organisation's systems and data in the hopes that multiple layers will provide redundancy in an organisation's security perimeter.

Confidentiality, Integrity, and Availability (CIA) is the opposite of Disclosure, Alternation, and Destruction (DAD).

* Principles of Privileges
  * Level of access based on the role, and the sensitivity of the information stored on the system
  * Privileged Identity Management (PIM): translate a user's role within an organisation into an access role on a system
  * Privileged Access Management (PAM): management of the privileges a system's access role has, enforcing security policies such as password management, auditing policies and reducing the attack surface a system faces.
    * principle of least privilege
* Bell-La Padula Model "can't read up, can't read down"
* Biba Model "can read up, can't read down"
* WHELP https://tryhackme.com/room/principlesofsecurity

<hr class="sep-both">

## Linux prev esc

https://tryhackme.com/room/commonlinuxprivesc

* Reset passwords
* Bypass access controls to compromise protected data
* Edit software configurations
* Enable persistence, so you can access the machine again later.
* Change privilege of users
  * https://github.com/arthepsy/CVE-2021-4034 / https://github.com/berdav/CVE-2021-4034
* finger — user information lookup program
* https://github.com/netbiosX/Checklists/blob/master/Linux-Privilege-Escalation.md
* https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md
* https://github.com/alexb49/total-oscp-guide
* https://payatu.com/guide-linux-privilege-escalation