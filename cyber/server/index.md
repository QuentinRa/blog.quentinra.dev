# Server Security

...

<hr class="sl">


## File upload

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

A user may upload a file on a server such as an avatar. You must prevent users from uploading malicious files (ex : scripts), AND prevent users from accessing content belonging to other users (if they shouldn't).

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Secure filters for uploaded files
    * ❌ xxx.png.php
    * ❌ Do not use /upload /images /media /resources /tmp for private files, and better, do not allow access to private files via URL <small>(or at least, use a "deny all, allow xxx" kind of .htaccess)</small>
    * ❌ do not trust "content-type"
    * ❌ use secure functions/ways to get the name of the uploaded file. Hackers can try to bypass them, like by using ASCII characters, or stuff like that.

If an attacker manage to upload a PHP script on the server, they will most likely try to do **reverse engineering**, meaning using a command such as `sudo nc -lvnp 443`, and accessing a remote shell on your server <small>(443 = HTTPS, so you go "unnoticed")</small>.

<hr class="sr">

## Discovery

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

* <i class="bi bi-info-square" style="background:#7cfc00"></i> There are cases when the request is in the URL, such as "/account/5123" or "/invoices?ref=365230". Every website should ensure that no unauthorized user can access private data.
* <i class="bi bi-info-square" style="background:#ffd700"></i> use `wfuzz` (or any similar tool) to automate the process above
* <i class="bi bi-info-square" style="background:#ffd700"></i> use `Gobuster` (or any similar tool) with a list of directories (see bruteforce) to search for hidden directories