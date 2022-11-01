# Bruteforce forms

<div class="row row-cols-md-2"><div>

There are two kinds of forms: **GET forms**, in which the parameters of the form are stored within the URL, and anyone opening the URL, will see the form filled with the same input. For instance, a search engine such as Google has a parameter `q` (query) in which the search I made `(hello world)` was stored in.

```
https://www.google.com/search?q=hello+world
https://www.google.com/search?q=hello%20world
```

Search are URL-encoded as a URL is a long suite of characters with no spaces, for instance, space would be either `%20`, or `+`.
</div><div>

Then, we have **POST forms**. They are mostly used for logins/... Once the user submit data, then its encoded, and sent to the server. Even if we have the same URL, the page will be empty for us.

```
https://example.com/login.php
```

The common point between the two are that the data transferred is looking like this: `username=toto&password=toto`, and in both, it's URL-encoded.
</div></div>

> **Note**: BurpSuite can be used too, see the Intruder tab.<br>

<hr class="sl">

## Wordlists

<div class="row row-cols-md-2"><div>

* package wordlist

```
/usr/share/wordlists/rockyou.txt
/usr/share/wordlists/fasttrack.txt
/usr/share/wordlists/dirb/others/best1050.txt
/usr/share/wordlists/dirb/others/best110.txt
/usr/share/wordlists/dirb/others/best15.txt
```

</div><div>

* package seclists 📌

```
$ ls /usr/share/seclists/Passwords/
2020-200_most_used_passwords.txt
darkc0de.txt
darkweb2017-top10000.txt
$ ls /usr/share/seclists/Passwords/Common-Credentials
10k-most-common.txt
10-million-password-list-top-1000000.txt
$ ls /usr/share/seclists/Usernames/
xato-net-10-million-usernames.txt
```
</div></div>

<hr class="sr">

## Bruteforce using ffuf

[See fuzzing/ffuf for more information](../fuzz/index.md#ffuf---fuzz-faster-u-fool)

<div class="row row-cols-md-2"><div>

Try to bruteforce a GET form.

```bash
$ wfuzz -w wordlist -u URL/account?id=FUZZ
```
</div><div>

Try to bruteforce a POST form.

```bash
$ wfuzz -w wordlist -X POST -d "username=admin&pass=FUZZ" URL/login.php
```
</div></div>

<hr class="sl">

## Bruteforce using wfuzz

[See fuzzing/wfuzz for more information](../fuzz/index.md#wfuzz---web-application-fuzzer)

<div class="row row-cols-md-2"><div>

Try to bruteforce a GET form.

```bash
$ wfuzz -w wordlist URL/account?id=FUZZ
```
</div><div>

Try to bruteforce a POST form.

```bash
$ wfuzz -w wordlist -d "username=admin&pass=FUZZ" URL/login.php
```
</div></div>

<hr class="sr">

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

You should check the [bruteforce services](../../../random/crack_password/services.md) page to learn more about Hydra.
</div></div>