# Attacks on websites

...

<hr class="sl">

## Cookies

Cookies are used to store data. Most of the time, they are encrypted, but if they can be decrypted, then someone can change the value, and re-encrypt them.

**How**: use F-12 to open the console, go to Application, then **Cookies**.

**Breaches?**

* A cookie is just a value associated with a file on the server side. If someone manage to get this "value", for instance for an authentication cookie, then they can bypass 2FA/... and login.
* You may try to decrypt a cookie using [Cyberchef](https://gchq.github.io/CyberChef/)