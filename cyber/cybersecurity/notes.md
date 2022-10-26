# Notes

<hr class="sep-both">

## Web

* source / view-source:
  * HTML comments
  * hidden stuff
  * try to find the framework used/version
    * test default credentials
    * test bruteforce with default username
    * test if there are vulnerabilities for this version
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