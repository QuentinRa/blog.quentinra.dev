# R

* Remember for web/general/security
* .todo: dns discord
* web general | terminology | URL may have to be moved

<hr>

## Reaped

...

<hr>

## Prev esc

https://tryhackme.com/room/linprivesc
=> hint/notes
=> network

* https://tryhackme.com/room/windowsprivesc20 (dropped fur now)

<hr>

## Forced Browsing

--- https://tryhackme.com/room/webenumerationv2

* Nikto: sensitive files, vulnerabilities of the web server, misconfigurations
  * -h: headers and sensitive files
  * can take a nmap scan
  * `-p 80,8000,8080`
  * https://github.com/sullo/nikto/wiki/Plugin-list
  * -Plugin (ex: robots, cgi, ...)
  * -Display (verbosity): see the course
  * -Tuning search file upload...
  * -o Text/HTML report
* Bash/sh and/or \"'(safe and vuln)'\"")

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