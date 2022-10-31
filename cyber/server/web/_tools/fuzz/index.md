# Fuzzing

<div class="row row-cols-md-2"><div>

Fuzzing, or most likely web-fuzzing is the art of injecting data, and finding something,usually a bug. Fuzzers are used for way too much things

* Bruteforce a form
* Subdomains exploration
* Forced browsing
* Find Insecure Direct Object References (IDOR)
* ...
</div><div>

**Two ingredients are required**. First, a **wordlist**, basically a list of values to test. Some tools can take more than one, such as when you try to bruteforce with both a list of usernames, and a list of passwords

The second is a **URL**. For instance, `example.com`. Fuzzers will allow you to place where in the URL you want something to be injected. For instance,

* Guessing a subdomain? `FUZZ.example.com`
* Forced browsing? `example.com/FUZZ`
* Find Insecure Direct Object References? `example.com?id=FUZZ`
* ...
</div></div>