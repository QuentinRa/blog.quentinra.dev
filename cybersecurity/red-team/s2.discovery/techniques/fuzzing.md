# Fuzzing

[![attacking_with_ffuf](../../../_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)

<div class="row row-cols-lg-2"><div>

Fuzzing refers to injecting data into something to study how it reacts. A keyword "FUZZ" is replaced with a word from a wordlist. It can be used to easily inject words in a URL, a form, or basically anything 💥.

* Guessing a [subdomain](/cybersecurity/red-team/s2.discovery/techniques/subdomains.md)? `FUZZ.example.com`
* [Forced browsing](/cybersecurity/red-team/s2.discovery/techniques/forced_browsing.md)? `example.com/FUZZ`
* Find [Insecure Direct Object References](/cybersecurity/red-team/s2.discovery/techniques/idor.md)? `example.com?id=FUZZ`
* Find [Query Parameters](#parameter-fuzzing)? `example.com?FUZZ=xxx`
* Find [Virtual Hosts](/cybersecurity/red-team/s2.discovery/techniques/vhosts.md) `example.com` and `Host: FUZZ.example.com`
* ...

FUZZ will be replaced with the values in the wordlist, one by one.
</div><div>

⚠️ Note that `example.com/FUZZ.php` and `example.com/FUZZ --xxx .php` are different. The later will look for both `FUZZ` and `FUZZ.php`.

Common fuzzing tools are:

* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md)
* [wfuzz](/cybersecurity/red-team/tools/enumeration/web/wfuzz.md)
* [gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md#fuzzing)
* [feroxfuzz](https://github.com/epi052/feroxfuzz/) (0.2k ⭐) for ferox buster users

To be fair, gobuster is not a fuzzing tool, but it supports fuzzing.
</div></div>

<hr class="sep-both">

## Other Use Cases

<div class="row row-cols-lg-2"><div>

Use cases below don't have their own page unlike others. 

#### Parameter Fuzzing

[![attacking_with_ffuf](../../../_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)

You can use Fuzzing to find query parameters, for instance, using the URL ``example.com?FUZZ=value``. Common [wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md) are:

```text!
/usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt
```
</div><div>

#### Extension Fuzzing

[![attacking_with_ffuf](../../../_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)

We may want to find which extension the server uses, to fine tune our fuzzing. We may guess it based on the webserver <small>(PHP for Apache, ASPX OR ASP for ISS)</small>, but this is unreliable.

Most websites have a file called `index` which can be used for fuzzing. For example, the URL `example.com/indexFUZZ`. Common [wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md) are:

```text!
/usr/share/seclists/Discovery/Web-Content/web-extensions.txt
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [fuzzingbook](https://www.fuzzingbook.org/) (software testing)
</div><div>
</div></div>