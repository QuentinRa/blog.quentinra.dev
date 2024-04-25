# Fuzzing

[![attacking_with_ffuf](../../../../_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)

<div class="row row-cols-lg-2"><div>

Fuzzing refers to injecting data into something to study how it reacts. A keyword "FUZZ" is replaced with a word from a wordlist. It can be used to easily inject words in a URL, a form, or basically anything 💥.

* Guessing a [subdomain](/cybersecurity/red-team/s2.discovery/techniques/websites/subdomains.md)? `FUZZ.example.com`
* [Forced browsing](/cybersecurity/red-team/s2.discovery/techniques/websites/forced_browsing.md)? `example.com/FUZZ`
* Find [Insecure Direct Object References](/cybersecurity/red-team/s2.discovery/techniques/websites/idor.md)? `example.com?id=FUZZ`
* Find [Hidden Parameters](/cybersecurity/red-team/s2.discovery/techniques/websites/hidden_parameters.md)? `example.com?FUZZ=xxx`
* Find [Virtual Hosts](/cybersecurity/red-team/s2.discovery/techniques/websites/vhosts.md) `example.com` and `Host: FUZZ.example.com`
* ...

FUZZ will be replaced with the values in the wordlist, one by one.
</div><div>

⚠️ Note that `example.com/FUZZ.php` and `example.com/FUZZ -e .php` are often different. The latter will look for both `FUZZ` and `FUZZ.php`.

Common fuzzing tools are:

* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md)
* [wfuzz](/cybersecurity/red-team/tools/enumeration/web/wfuzz.md)
* [gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md#fuzzing)
* [feroxfuzz](https://github.com/epi052/feroxfuzz/) <small>(0.2k ⭐, for ferox buster users)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [fuzzingbook](https://www.fuzzingbook.org/) (software testing)
</div><div>
</div></div>