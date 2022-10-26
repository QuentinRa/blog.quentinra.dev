# Notes

* https://www.blackhat.com/

<hr class="sep-both">

## Dorking

* inurl:admin
* https://en.wikipedia.org/wiki/Google_hacking

<hr class="sep-both">

## Web

URL
* Scheme: (protocol) HTTP/HTTPS/...
* Username:Password@Domain:port/Path?query#Fragment
* Methods GET, DELETE...
* Headers
  * Server: some server
  * Set-cookie: ... => server send the cookie in every request
  * ...
* Response code

* source / view-source:
  * HTML comments
  * hidden stuff
  * try to find the framework used/version
    * test default credentials
    * test bruteforce with default username
    * test if there are vulnerabilities for this version
    * look for the default favicon
      * https://wiki.owasp.org/index.php/OWASP_favicon_database
      * curl favicon.ico | md5sum
      * Download, then
      * Get-FileHash .\favicon.ico -Algorithm MD5
    * In credits/footer/...
* inspector
  * show/hide/remove elements
* debugger (in sources on chrome)
  * put a break point
  * run the page again, the page will pause waiting for debugger
* Network
  * Header
  * Response
  * ...

Penetration tester (web)
=> map every feature=~page (like both /account /account?id=5)

A website content is usually what we can't see at first sight (backups, old files, configuration files, administration panels, framework panels...).

here are three main ways of discovering content on a website

* Manually, 
* Automated,
* and OSINT

**Robots.txt**: sitemap, and page declared as forbidden to robots=crawlers.

Sitemap way lead to old endpoints that are not used anymore, but still available, and maybe vulnerable.

**Headers**: server version, maybe os...

Wappalyzer (https://www.wappalyzer.com/) is an online tool and browser extension that helps identify what technologies a website uses, such as frameworks, Content Management Systems (CMS), payment processors and much more, and it can even find version numbers as well.

* Look for old versions of the Wayback Machine https://archive.org/web/
* Look if there are some companies employees on GitHub, try to find the source code...
* S3 Buckets: http(s)://{name}.s3.amazonaws.com with name chosen by the owner. If perms are incorrect, then.

ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u http://10.10.152.110/FUZZ

dirb http://10.10.152.110/ /usr/share/seclists/Discovery/Web-Content/common.txt

* https://github.com/danielmiessler/SecLists/
* sudo apt install seclists

<hr class="sep-both">

## Hydra

* https://github.com/vanhauser-thc/thc-hydra
* bruteforce some authentication service
  * MYSQL
  * RDP
  * SSH

This shows the importance of using a strong password, if your password is common, doesn't contain special characters and/or is not above 8 characters, its going to be prone to being guessed. 100 million password lists exist containing common passwords, so when an out-of-the-box application uses an easy password to login, make sure to change it from the default! Often CCTV camera's and web frameworks use admin:password as the default password, which is obviously not strong enough.

* hydra -l username -P rockyou.txt ssh://MACHINE_IP
* hydra -l username -P rockyou.txt ftp://MACHINE_IP
* `-t n`: use $n$ threads
* hydra -l username -P rockyou.txt MACHINE_IP ssh
* Post Web Form
* http-post-form "/:username=^USER^&password=^PASS^:F=incorrect" -V
  * /login
  * name="usernam" is filled with the username (USER)
  * name="password" is filled with the password (PASS)
  * F=incorrect means that the attempt is incorrect is this word is on the page
* -V: verbose
* hydra -l molly -P rockyou.txt 10.10.19.153 http-post-form "/login:username=^USER^&password=^PASS^:F=incorrect" -V