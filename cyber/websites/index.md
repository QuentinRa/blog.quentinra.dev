# Attacks on websites

...

<hr class="sl">

## Cookies

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

Cookies are used to store data. Most of the time, they are encrypted, but if they can be decrypted, then someone can change the value, and re-encrypt them.

**How**: use F-12 to open the console, go to Application, then **Cookies**.

**Breaches?**

* A cookie is just a value associated with a file on the server side. If someone manage to get this "value", for instance for an authentication cookie, then they can bypass 2FA/... and login.
* You may try to decrypt a cookie using [Cyberchef](https://gchq.github.io/CyberChef/)

<hr class="sr">

## File upload

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ff7f00)

A user may upload a file on a server such as an avatar. You must prevent users from uploading malicious files (ex : scripts), AND prevent users from accessing content belonging to other users (if they shouldn't).

* Secure filters for uploaded files
  * ❌ xxx.png.php
  * ❌ /upload /images /media /resources /tmp
  * ❌ do not trust "content-type"
  * ❌ use secure functions to get the name of the file. Hackers can try to bypass them, like by using ASCII characters or stuff like that.

If an attacker manage to put a PHP script on the server, they will most likely try **reverse engineering** meaning using a command such as `sudo nc -lvnp 443`, and accessing a terminal on your server (443 = HTTPS, so you go "unnoticed").