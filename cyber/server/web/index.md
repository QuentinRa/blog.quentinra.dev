# Exploit a webserver

[![introwebapplicationsecurity](../../_badges/introwebapplicationsecurity.svg)](https://tryhackme.com/room/introwebapplicationsecurity)
[![contentdiscovery](../../_badges/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![walkinganapplication](../../_badges/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![httpindetail](../../_badges/httpindetail.svg)](https://tryhackme.com/room/httpindetail)

*According to TryHackMe, there are 4 categories of failures related to webservices.*

<div class="row row-cols-md-2"><div>

**Identification and Authentication Failure** 🔑

* The website do not prevent bruteforce
* The website allows users to use weak passwords
* The website do not encrypt passwords
	
<br>

**Broken Access Control** 📭 <small>(a hacker can access files/URLs we shouldn't)</small>

* The principle of the least privilege not applied correctly
* Someone can use someone else token/id to do...
* A user can access "logged-only" pages without logging in
</div><div>

**Injections** 🪤

* There is an insufficient, or no validation at all
* There is an insufficient, or no sanitization at all

<p>&nbsp;</p>

**Cryptographic Failures** 🔓

* The server is using clear text
* The server allow/use HTTP instead of HTTPS
* The server use a weak cryptographic algorithm
</div></div>