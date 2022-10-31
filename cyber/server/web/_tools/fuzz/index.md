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

<hr class="sl">

## ffuf

<div class="row row-cols-md-2"><div>

Nothing aside from this [ffuf](https://github.com/ffuf/ffuf) GitHub link.
</div><div>

...
</div></div>

<hr class="sr">

## wfuzz

<div class="row row-cols-md-2"><div>

[wfuzz](https://github.com/xmendez/wfuzz) (4.7k ⭐) is a web fuzzer in Python.

Example

```bash
$ wfuzz -w wordlist URL/account?id=FUZZ
```

You can add some verbose, if you want to.

```bash
$ wfuzz -w wordlist -u URL/FUZZ -v
```

</div><div>

You can filter responses by code. `-h` will hide a response based on a criteria... And, `-s`, which is working the same, will do the opposite, and only show a response matching a criteria.

* `c code`: show/hide responses with this return code
* `l n`: show/hide responses with this $n$ number of lines
* `w n`: show/hide responses with this $n$ number of words
* `c n`: show/hide responses with this $n$ number of characters
* `s regex`: show/hide responses containing the regex

```bash
# ignore 404,500
$ wfuzz -w wordlist --hc 404,500 xxx.tld/account?id=FUZZ
# show only 200
$ wfuzz -w wordlist --sc 200 xxx.tld/account?id=FUZZ
```
</div></div>