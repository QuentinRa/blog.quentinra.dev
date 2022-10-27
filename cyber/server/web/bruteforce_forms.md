# Bruteforce forms

<div class="row row-cols-md-2"><div>

This practice of using bruteforce on GET/POST Forms, is usually called "web fuzzing". Basically, every request made by a client to the server is transferring a list of `key=value` such as `username=toto&password=toto`. The art of injecting data is what we call fuzzing.

> **Note**: BurpSuite can be used too, see the Intruder tab.<br>
> **Note**: FeroxBuster users should take a look at the [feroxfuzz](https://github.com/epi052/feroxfuzz/) library.
</div><div>

Fuzzing involve taking values from a wordlist, and testing one by one these values in the request. On Kali, you can use these two commands to find where wordlists are stored:

* `wordlists`
* `seclists` (may have to be installed, wordlists from [SecLists](https://github.com/danielmiessler/SecLists))

Finally, much like in forced browsing, you will have to private an URL

* `http://xxx.yyy`
* `http://xxx.yyy:80`
* `127.0.0.1`
* `127.0.0.1:80`
* ...
</div></div>

<hr class="sl">

## Bruteforce using wfuzz

<div class="row row-cols-md-2"><div>

[wfuzz](https://github.com/xmendez/wfuzz) (4.7k ⭐). FUZZ is pretty simple: there is a wordlist, and you add a word FUZZ in the URL/request, and wfuzz will replace, one by one, the word FUZZ with every entry in the wordlist. [See the official documentation here](https://wfuzz.readthedocs.io/en/latest/index.html), or use `wfuzz -h`.

Try to bruteforce a GET form.

```bash
$ wfuzz -w wordlist URL/account?id=FUZZ
```

Try to bruteforce a POST form.

```bash
$ wfuzz -w wordlist -d "username=admin&pass=FUZZ" URL/login.php
```

Add some verbose, if you want to.

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

<hr class="sr">

## Bruteforce using ffuf

<div class="row row-cols-md-2"><div>

Nothing aside from this [ffuf](https://github.com/ffuf/ffuf) GitHub link.
</div><div>
</div></div>

<hr class="sl">

## Bruteforce authentication forms using Hydra

<div class="row row-cols-md-2"><div>

Hydra is mostly used to bruteforce services, but it can also be used with authentication forms.

```bash
$ hydra -l toto -P wordlist URL http-post-form "/login.php:username=^USER^&password=^PASS^:F=incorrect" -V
```

<p class="mt-3">The request that we will bruteforce is something like this</p>

```none
username=toto&password=xxx
```
</div><div>

This command will

* Attack the form located at `URL/login.php` <small>(the `/login.php`)</small>
* Set the field with the name "username" with "toto"
* Set the field with the name "password" with every entry in the wordlist, on by one
* Consider comme failures (`-F`) any web page that returns the word "incorrect"

You should check the [bruteforce services](../../random/crack_password/hydra.md) page to learn more about Hydra.
</div></div>