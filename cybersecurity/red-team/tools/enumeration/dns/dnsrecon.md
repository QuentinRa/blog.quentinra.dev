# DNSRecon

<div class="row row-cols-lg-2"><div>

[DNSRecon](https://github.com/darkoperator/dnsrecon) <small>(2.7k ⭐)</small> is a Python script that can be used to brute force vhosts, and do OSINT checks <small>(std, bing, yandex, and crt)</small>.

```ps
$ dnsrecon -d URL -D wordlist -t a_type
```

And for OSINT:

```ps
$ dnsrecon -d URL -t a_type
```
</div><div>

The type could be

* `brt`: brute force using a dictionary
* `std`: NS, A/AAAA, MX...
* `bing`: test bing
* `yand`: test Yandex
* `rvl`: reverse lookup
* `crt`: test [crt.sh](https://crt.sh/)
* ...
</div></div>