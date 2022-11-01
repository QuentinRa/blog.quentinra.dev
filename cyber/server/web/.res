SSRF
https://www.youtube.com/watch?v=1iHCZybiDcw
https://www.youtube.com/watch?v=-pNYmgK_dWo
https://www.youtube.com/watch?v=G-v2NEgyzSs

Cookies
https://www.databreaches.net/hackers-are-using-cookies-to-sidestep-two-factor-authentication/
https://www.thewindowsclub.com/cookie-stealing-or-scraping
https://thehackernews.com/2021/10/hackers-stealing-browser-cookies-to.html

File upload
A user may upload a file on a server such as an avatar. You must prevent users from uploading malicious files (ex : scripts),
AND prevent users from accessing content belonging to other users (if they shouldn't).

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Secure filters for uploaded files
  * ❌ DO NOT use some stupid filter allowing "xxx.png.php"
  * ❌ DO NOT use /upload /images /media /resources /tmp for user (non-public) files, and better, do not allow access to non-public files via URL <small>(or at least, use a "deny all, allow xxx" kind of .htaccess)</small>. Usually, instead of matching a folder (ex: "www") with the server root <small>(ex: "localhost/")</small>, we are matching it with a sub-folder <small>(ex: www/public)</small>, so that we can use a folder such as "www/uploads" not available via URL <small>(you can't do "localhost/../uploads" in a URL)</small>.
  * ❌ DO NOT trust "content-type"
  * ❌ USE secure functions/ways to get the name of the uploaded file. Hackers can try to bypass them, like by using ASCII characters, or stuff like that.

If an attacker manage to upload a PHP script on the server,
they will most likely try to do **reverse engineering**, meaning using a command such as `sudo nc -lvnp 443`,
and accessing a remote shell on your server <small>(443 = HTTPS, so you go "unnoticed")</small>.
----

Random
$_REQUEST=$_GET+$_POST. If both have a key, then post is used.
GET url with non-injectable parameter (verified)
POST URL in which you can override the value of the non-injectable parameter
curl 'http://10.10.136.157/customers/reset?email=robert@acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert&email=hacker@hack.ca'
https://tryhackme.com/room/authenticationbypass
https://tryhackme.com/room/subdomainenumeration