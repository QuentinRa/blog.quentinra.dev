# R

* Remember for web/general/security
* .todo: dns discord
* web general | terminology | URL may have to be moved

<hr>

<hr class="sep-both">

## 👻 TODO 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

xxx
</div><div>


</div></div>

<hr>

## Reaped

...

<hr>

## Special

* `wireshark` (https://tryhackme.com/room/startup): wireshark `.pcapng`. Then right-click on interesting packets, and click on "follow TCP Stream"

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

--- https://tryhackme.com/room/easyctf 🐍🐍⭐

* `python2 simple.py`
* oh gosh, volatily + `pip install --upgrade setuptools` https://stackoverflow.com/questions/31719816/pip-fails-to-install-anything-error-invalid-command-egg-info
* `print "[+] Specify an url target"`

--- https://tryhackme.com/room/lazyadmin 🐍🐍⭐

* nmap
* gobuster
* ...

* FTP do not seem to work with path (to upload with put, but it works if you start FTP in the directory where the file is)

--- https://tryhackme.com/room/allinonemj 🐍🐍🐍

* Test: `wpscan --url http://10.10.162.222/wordpress/ --detection-mode aggressive`
* `php://filter/convert.base64-encode/resource=../../../../../wp-config.php` (file inclusion)