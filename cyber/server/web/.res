SSRF
https://www.youtube.com/watch?v=1iHCZybiDcw
https://www.youtube.com/watch?v=-pNYmgK_dWo
https://www.youtube.com/watch?v=G-v2NEgyzSs

Cookies
https://www.databreaches.net/hackers-are-using-cookies-to-sidestep-two-factor-authentication/
https://www.thewindowsclub.com/cookie-stealing-or-scraping
https://thehackernews.com/2021/10/hackers-stealing-browser-cookies-to.html

Subdomain enumeration
ffuf -w wordlist -H "Host: FUZZ.URL" -u URL

# Bruteforce forms

<div class="row row-cols-md-2"><div>

This practice of using bruteforce on GET/POST Forms, is usually called "web fuzzing". Basically,
 every request made by a client to the server is transferring a list of `key=value` such as `username=toto&password=toto`.
 The art of injecting data is what we call fuzzing.

> **Note**: BurpSuite can be used too, see the Intruder tab.<br>
> **Note**: FeroxBuster users should take a look at the [feroxfuzz](https://github.com/epi052/feroxfuzz/) library.

📌 **Insecure Direct Object References** (BrokenAccessControl), is a failure in which we can guess given a URL how to access other elements, and if we change the URL <small>(id=10$\to$id=11)</small>, we can indeed access them.