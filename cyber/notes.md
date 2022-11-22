# R

* Remember for web/general/security
* .todo: dns discord
* web general | terminology | URL may have to be moved

<hr>

## Reaped

* https://github.com/Hifumi1337/Bounty-Hacker
* https://security.stackexchange.com/questions/234859/inject-update-motd-d-00-header-to-run-a-script-on-ssh-login
* https://defaultcredentials.com/

<hr>

## Prev esc

--- https://tryhackme.com/room/linprivesc
=> hint/notes
=> network

--- https://tryhackme.com/room/windowsprivesc20 🐍🐍🐍

<hr>

## Forced Browsing

[![webenumerationv2](../../../_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)

* Nikto: sensitive files, vulnerabilities of the web server, misconfigurations
  * -h: headers and sensitive files
  * can take a nmap scan
  * `-p 80,8000,8080`
  * https://github.com/sullo/nikto/wiki/Plugin-list
  * -Plugin (ex: robots, cgi, ...)
  * -Display (verbosity): see the course
  * -Tuning search file upload...
  * -o Text/HTML report

<hr>

## Overconfidence

--- https://tryhackme.com/room/easyctf 🐍🐍⭐

* `python2 simple.py`
* oh gosh, volatily + `pip install --upgrade setuptools` https://stackoverflow.com/questions/31719816/pip-fails-to-install-anything-error-invalid-command-egg-info
* `print "[+] Specify an url target"`

--- https://tryhackme.com/room/lazyadmin 🐍🐍⭐

* nmap
* gobuster
* FTP do not seem to work with path (to upload with put, but it works if you start FTP in the directory where the file is)

--- https://tryhackme.com/room/allinonemj 🐍🐍⭐

* Test: `wpscan --url http://10.10.162.222/wordpress/ --detection-mode aggressive`
* `php://filter/convert.base64-encode/resource=../../../../../wp-config.php` (file inclusion, https://www.idontplaydarts.com/2011/02/using-php-filter-for-local-file-inclusion/)

--- https://tryhackme.com/room/ignite (done)

* default credentials => lead to nothing
* command injection

* echo -n "" > assets/images/test.phpx
* `%27%2b%70%69%28%70%72%69%6e%74%28%24%61%3d%27%73%79%73%74%65%6d%27%29%29%2b%24%61%28%27ls%27%29%2b%27`
* https://stackoverflow.com/questions/17420878/php-preg-match-delimiter-must-not-be-alphanumeric-or-backslash
* no need for the "1" in interact
* https://www.exploit-db.com/exploits/41240 (need for some tools to be installed :/)
* https://github.com/Arrexel/phpbash 
* could have used python from the start, baka
* https://exploits.run/
* the password of the db was reused...
* if I used quotes, it would have worked in one go...
* https://unicornsec.com/
* https://saharshtapi.github.io/
* https://atom.hackstreetboys.ph/
* https://stawm.design.blog/
* https://infosecjunky.com/
* https://marcorei7.wordpress.com/

--- https://tryhackme.com/room/c4ptur3th3fl4g (done)

* https://dencode.com/en/
* https://n0w4n.nl/
* https://github.com/s0md3v/Hash-Buster
* steg hide always ask for a password, can leave it blank
* strings to see the content of an image, wtf?
* Audacity/...
  * https://academo.org/demos/spectrum-analyzer/
  * https://hackedpatched.wordpress.com/
  * https://morsecode.world/international/decoder/audio-decoder-adaptive.html
  * apt install audacity (click on the file name->wav to spectrogram)
* https://www.tunnelsup.com/hash-analyzer/
* https://futureboy.us/stegano/
* https://xavag3djang0.github.io/
* https://0xnirvana.gitbook.io/writeups/
* https://robertmuwanga.netlify.app/
* https://niekdang.wordpress.com/

--- https://tryhackme.com/room/wgelctf

* use common first, before small/...
* `document.firstChild.nextSibling.innerHTML.match(/<!--.*?-->/g)`
* `$(whoami)  ALL=(ALL) NOPASSWD:ALL`

List

* html comments
* gobuster
* sudo -l

<hr>

## HackTheBox

* Server Message Block
* `smbclient -L IP -U Anonymous` (list shares)
* `smbclient //IP/Anonymous -U Anonymous` (typo, two slashes)
* Redis 6379/tcp in-memory db
* redis-cli `sudo apt install redis-tools` (-h host -p port)
  * `10.129.15.139:6379> help`
  * https://redis.io/commands/
  * info (see version...)
  * `keys *`
  * `get flag`