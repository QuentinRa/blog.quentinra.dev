# Bruteforce forms

<div class="row row-cols-md-2"><div>

This practice of using bruteforce on GET/POST Forms, is usually called "web fuzzing". Basically, every request made by a client to the server is transferring a list of `key=value` such as `username=toto&password=toto`. The art of injecting data is what we call fuzzing.

> **Note**: BurpSuite can be used too, see the Intruder tab.<br>
> **Note**: FeroxBuster users should take a look at the [feroxfuzz](https://github.com/epi052/feroxfuzz/) library.
</div><div>

Fuzzing involve taking values from a wordlist, and testing one by one these values in the request. On Kali, you can use these two commands to find where wordlists are stored:

* `wordlists`
* `seclists` (may have to be installed, wordlists from [SecLists](https://github.com/danielmiessler/SecLists))
</div></div>

<hr class="sl">

## Bruteforce using wfuzz

<div class="row row-cols-md-2"><div>

Nothing aside from this [wfuzz](https://github.com/xmendez/wfuzz) GitHub link.
</div><div>
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