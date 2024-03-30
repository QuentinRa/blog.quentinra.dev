# OneCTF

<div class="row row-cols-lg-2"><div>

[OneCTF](https://github.com/QuentinRa/onectf/) <small>(0.01k ⭐)</small> is a simple Python suite of tool that I created to automate multiple tasks while using multi-threading.

```ps
$ pipx install git+https://github.com/QuentinRa/onectf.git
$ onectf -h
```

All modules support multi-threading using `-t <nb_threads>`.
</div><div>

The documentation for each module:

* [AXFR](https://github.com/QuentinRa/onectf/blob/main/docs/axfr.md): find hidden subdomains vulnerable to zone transfer
* [Crawl](https://github.com/QuentinRa/onectf/blob/main/docs/crawl.md): HTML web crawler
* [Hosts](https://github.com/QuentinRa/onectf/blob/main/docs/hosts.md): host file management utility
* [Request](https://github.com/QuentinRa/onectf/blob/main/docs/request.md): request encoder
* [uffuf](https://github.com/QuentinRa/onectf/blob/main/docs/uffuf.md): file upload fuzzer
</div></div>

<hr class="sep-both">

## Modules Overview

<div class="row row-cols-lg-2"><div>

#### OneCTF Request Module

The [request](https://github.com/QuentinRa/onectf/blob/main/docs/request.md) module is handy when we want to manually test a payload that needs to be tampered <small>(base64, php octal, etc.)</small>

```ps
$ onectf request -u 'URL' -v -X POST -p 'xxx' -i 'x;ls / <er>' --tamper aliases,space2tab
$ onectf request -u 'URL' -v -X POST -p 'xxx' -i 'phpinfo()' --tamper php_octal
```

<br>

#### OneCTF Crawl Module

The [crawl](https://github.com/QuentinRa/onectf/blob/main/docs/crawl.md) module is handy when we need to crawl a website, but we don't care about external links <small>(e.g., to other websites)</small> and we don't want to waste time waiting for tools such as ZAProxy.

```ps
$ onectf crawl -u URL -o /tmp/links.txt
$ onectf craw [...] --comments -L gobuster_output.txt
```

📚 You can pass the output of [gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md)  or a list of endpoints using `-L endpoints.txt`. You can display HTML comments using `--comments`.
</div><div>

#### OneCTF AXFR Module

The [AXFR](https://github.com/QuentinRa/onectf/blob/main/docs/axfr.md) module is handy when we want to test AXFR on a wordlist of subdomains using multi-threading for faster results.

Assuming `IP` is the IP address of the DNS server, `xxx.yyy` is the domain, and `wordlist.txt` is a list of subdomains:

```ps
$ head wordlist.txt
aaa
...
$ onectf axfr -D xxx.yyy -r IP -w wordlist.txt -t 64
# try AXFR on aaa.xxx.yyy
# ...
```

#### OneCTF Hosts Module

The [Hosts](https://github.com/QuentinRa/onectf/blob/main/docs/hosts.md) module is handy when we often need to edit `/etc/hosts`.

```shell!
$ sudo onectf hosts IPA example.com aaa.example.com
IPA example.com aaa.example.com
$ sudo onectf hosts IPB example.com
IPA aaa.example.com
IPB example.com
```

* 🛣️ It automatically associates the domains to the IP
* 🧼 It automatically merges entries by IP
* 🧹 It automatically removes IPs with no domains
</div></div>