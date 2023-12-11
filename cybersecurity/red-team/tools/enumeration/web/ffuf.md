# ffuf

<div class="row row-cols-md-2"><div>

[ffuf](https://github.com/ffuf/ffuf) <small>(**f**uzz **f**aster **u** **f**ool)</small> (9.2k ⭐) is a [Fuzzing](/cybersecurity/red-team/s2.discovery/techniques/fuzzing.md) tool in Go. It's written to be a faster, modern, version of wfuzz.

Common examples are:

```ps
$ ffuf -w wordlist -u URL/FUZZ # Forced browsing
$ ffuf -w wordlist -u URL?FUZZ=value # GET
$ ffuf -w wordlist -u URL?key=FUZZ # GET
$ ffuf -w wordlist -u URL/FUZZ -H "Header: value" # Header
$ ffuf -w wordlist -u URL -X POST -d "xxx=FUZZ" # POST
```

* `-w wordlist`: FUZZ will be replaced with each entry in the wordlist
* `-u URL`: URL/endpoint where the request is made
* `-H header_value`: a header, or a list of headers comma separated
* `-X method`: the method used (GET/POST..;). Default: GET.
* `-d payload`: POST payload

You can use multiple wordlists, in such cases, you won't use FUZZ, but your own keyword, such as W1/W2.

```ps
$ ffuf -w wordlist1:W1,wordlist2:W2 -u URL?w1=W1&w2=W2 [...]
```
</div><div>

You will most likely want to only show some answers, or filter=hide some answers, based on a criterion. A filter switch is starting with `-f`, while a show switch is starting with `-m`.

* `c code`: show/hide response with this code
* `l n`: show/hide responses with this $n$ number of lines
* `w n`: show/hide responses with this $n$ number of words
* `s size`: show/hide responses with a size equal to $s$
* `r regex`: show/hide responses matching the regex

```shell!
$ ffuf -fc 404,500 [...] # hides 404,500
$ ffuf -fc 400-404 [...] # hides 400 to 404
$ ffuf -mc 200 [...] # show only 200
$ ffuf -mc 200,301 [...] # show only 200,301
$ ffuf -fs 5230 [...] # hides responses with size=5230
```

➡️ In theory, the repository [ffuf-scripts](https://github.com/ffuf/ffuf-scripts) should have a list of scripts useful with ffuf.
</div></div>

<hr class="sep-both">

## Special uses

<div class="row row-cols-md-2"><div>

#### vhost brute force

For [vhosts brute force](/cybersecurity/red-team/s2.discovery/techniques/vhosts.md), you can use:

```ps
$ ffuf -w wordlist -H "Host: FUZZ.example.com" -u example.com
```

⚠️ Similar responses are most likely the same answer (failure).
</div><div>

#### subdomains brute force

For [subdomains brute force](/cybersecurity/red-team/s2.discovery/techniques/subdomains.md), you can use:

```ps
$ ffuf -w wordlist -u FUZZ.example.com
```

⚠️ Similar responses are most likely the same answer (failure).
</div></div>