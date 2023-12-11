# Fuzzing

[![attacking_with_ffuf](../../../../cybersecurity/_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)

<div class="row row-cols-md-2"><div>

Fuzzing refers to injecting data into something to study how it reacts. A keyword "FUZZ" is replaced with a word from a wordlist. It can be used to easily inject words in a URL, a form, or basically anything 💥.

* Guessing a [subdomain](/cybersecurity/red-team/s2.discovery/techniques/subdomains.md)? `FUZZ.example.com`
* [Forced browsing](/cybersecurity/red-team/s2.discovery/techniques/forced_browsing.md)? `example.com/FUZZ`
* Find [Insecure Direct Object References](/cybersecurity/red-team/s2.discovery/techniques/idor.md)? `example.com?id=FUZZ`
* Find [Query Parameters](#parameter-fuzzing)? `example.com?FUZZ=xxx`
* ...

FUZZ will be replaced with the values in the wordlist, one by one.
</div><div>

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

You can use Fuzzing to find query parameters, for instance, using the URL ``example.com?FUZZ=value``. Common [wordlists](/cybersecurity/red-team/_knowledge/index.md#wordlists-) are:

```text!
/usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt
```
</div><div>
</div></div>