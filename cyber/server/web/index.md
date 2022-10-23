# Exploit a webserver

*According to TryHackMe, there are 4 kinds of failures related to webservices.*

<div class="row row-cols-md-2"><div>

**Identification and Authentication Failure** 🔑

* The website do not prevent bruteforce
* The website allows users to use weak passwords
* The website do not encrypt passwords

**Broken Access Control** 📭 <small>(a hacker can access files/URLs we shouldn't)</small>

* The principle of the least privilege not applied correctly
* Someone can use someone else token/id to do...
* A user can access "auth-only" pages without logging in
</div><div>

**Injections** 🪤

* There is an insufficient, or no validation at all
* There is an insufficient, or no sanitization at all

<br>

**Cryptographic Failures** 🔓

* The server is using clear text
* The server allow/use HTTP instead of HTTPS
* The server use a weak cryptographic algorithm
</div></div>