# wfuzz

[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day3.svg)](https://tryhackme.com/room/adventofcyber2)

<div class="row row-cols-lg-2"><div>

[wfuzz](https://github.com/xmendez/wfuzz) (5.4k ⭐) is a [Fuzzing](/cybersecurity/red-team/s2.discovery/techniques/websites/fuzzing.md) tool in Python. There are new modern alternatives, and it has not been updated since 2020.

Examples

```ps
$ wfuzz -w wordlist URL/account?id=FUZZZ        # GET
$ wfuzz -w wordlist -d "xxx=FUZZ" URL/login.php # POST
# ...
```

You can add some verbose with `-v`

```ps
$ wfuzz [...] -v
```
</div><div>

You can filter responses by code. `-h` will hide a response based on a criterion... And, `-s`, which is working the same, will do the opposite, and only show a response matching a criterion.

* `c code`: show/hide responses with this return code
* `l n`: show/hide responses with this $n$ number of lines
* `w n`: show/hide responses with this $n$ number of words
* `c n`: show/hide responses with this $n$ number of characters
* `s regex`: show/hide responses containing the regex

```ps
# ignore 404,500
$ wfuzz -w wordlist --hc 404,500 xxx.tld/account?id=FUZZ
# show only 200
$ wfuzz -w wordlist --sc 200 xxx.tld/account?id=FUZZ
```
</div></div>

<hr class="sep-both">

## Special uses

<div class="row row-cols-lg-2"><div>

#### Forced Browsing

For [forced browsing](/cybersecurity/red-team/s2.discovery/techniques/websites/forced_browsing.md), you can use:

```ps
$ wfuzz -w wordlist -u URL/FUZZ # Forced browsing
```
</div><div>
</div></div>