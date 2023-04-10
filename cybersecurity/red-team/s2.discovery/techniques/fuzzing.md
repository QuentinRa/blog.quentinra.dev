# Fuzzing

<div class="row row-cols-md-2"><div>

Fuzzing is a technique in which a keyword "FUZZ" is replaced with a word from a wordlist. It can be used to easily inject words in a URL, a form, or basically anything.

* Guessing a subdomain? `FUZZ.example.com`
* Forced browsing? `example.com/FUZZ`
* Find Insecure Direct Object References? `example.com?id=FUZZ`
* ...

FUZZ will be replaced with the values in the wordlist, one by one.
</div><div>

Common fuzzing tools are

* [ffuf](../tools/ffuf.md)
* [wfuzz](../tools/wfuzz.md)
* [gobuster](../tools/gobuster.md#fuzzing)
* [feroxfuzz](https://github.com/epi052/feroxfuzz/) (0.1k ⭐) for ferox buster users

To be fair, gobuster is not a fuzzing tool, but it supports fuzzing.
</div></div>