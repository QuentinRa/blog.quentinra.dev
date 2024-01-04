# Gobuster

[![webenumerationv2](../../../../_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)
[![web_information_gathering](../../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)

<div class="row row-cols-lg-2"><div>

[Gobuster](https://github.com/OJ/gobuster) (8.6k ⭐) is a popular web scanner. [wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md#forced-browsing).

```ps
$ gobuster dir -u URL -w wordlist
```

Add `-k` to scan a target with an expired HTTPS certificate.

```ps
$ gobuster [...] -k
```

You can append extensions to wordlist words

```ps
$ gobuster [...] -w php
$ gobuster [...] -w php,html
```
</div><div>

Gobuster is **slow by default**. Increase the number of threads to make it work faster using `-t n`, and $n$ the number of threads.

```ps
$ gobuster [...] -t 50 # usual
$ gobuster [...] -t 64 # common
$ gobuster [...] -t 100 # may be too much
```

Other options

* `-U`: username
* `-P`: password
* `-p`: proxy
* `-c`: a cookie <small>(for instance, to simulated that we are logged)</small>
* `-r NS`: use a custom nameserver
* `-H 'Name:value'`: a header
* `--exclude-length x`: exclude responses with this length
</div></div>

<hr class="sep-both">

## Special uses

<div class="row row-cols-lg-2"><div>

#### Fuzzing

Refer to [gobuster fuzz](https://github.com/OJ/gobuster#fuzz-mode) 👻.

<br>

#### subdomains brute force

For [subdomains brute force](/cybersecurity/red-team/s2.discovery/techniques/subdomains.md), you can use:

```ps
$ gobuster dns -d URL -w wordlist
$ gobuster dns -q -r NS -d URL -w wordlist
$ gobuster dns -d example.com -w wordlist # example
```
</div><div>

#### vhost brute force

For [vhosts brute force](/cybersecurity/red-team/s2.discovery/techniques/vhosts.md), you can use:

```ps
$ gobuster vhost -u URL -w wordlist --append-domain
```

In newer versions, you need to add `--append-domain` to check `xxx.example.com`, and not just `xxx`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `-p pattern_file` (with `{GOBUSTER}` inside)
</div><div>
</div></div>