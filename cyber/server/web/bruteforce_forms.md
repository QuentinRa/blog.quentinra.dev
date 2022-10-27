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