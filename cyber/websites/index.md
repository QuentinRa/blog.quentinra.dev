# Attacks on websites

...

<hr class="sl">

## Cookies

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

Cookies are used to store data. Most of the time, they are encrypted, but if they can be decrypted, then someone can change the value, and re-encrypt them.

**How**: use F-12 to open the console, go to Application, then **Cookies**.

* A cookie is just a value associated with a file on the server side. If someone manage to get this "value", for instance for an authentication cookie, then they can bypass 2FA/... and login.
* You may try to decrypt a cookie using [Cyberchef](https://gchq.github.io/CyberChef/)

<hr class="sr">

## File upload

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

A user may upload a file on a server such as an avatar. You must prevent users from uploading malicious files (ex : scripts), AND prevent users from accessing content belonging to other users (if they shouldn't).

* Secure filters for uploaded files
  * ❌ xxx.png.php
  * ❌ /upload /images /media /resources /tmp
  * ❌ do not trust "content-type"
  * ❌ use secure functions/ways to get the name of the file. Hackers can try to bypass them, like by using ASCII characters, or stuff like that.

If an attacker manage to put a PHP script on the server, they will most likely try **reverse engineering** meaning using a command such as `sudo nc -lvnp 443`, and accessing a terminal on your server (443 = HTTPS, so you go "unnoticed").

<hr class="sl">

## Forms

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

Forms are an entrypoint for way too many attacks. They can use bruteforce to guess username/password; try injecting some queries to expose your database, or execute malicious code; simply overusing your quota of sms/emails/... to make your services unavailable; or alter some request to get unlimited funds.

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Open the console, and try to look for hidden input fields. Sometimes, you can do some stuff to break the server-side. You can also easily bypass JavaScript checks. You can also make a JavaScript extension to BruteForce forms (it's quite easy).
* <i class="bi bi-info-square" style="background:#ffd700"></i> See **BurpSuite** to intercept requests, bruteForce forms, repeat requests...

<hr class="sr">

## URLs

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

There are cases when the request is in the URL, such as "/account/5123" or "/invoices?ref=365230". Every website should ensure that no unauthorized user can access private data.