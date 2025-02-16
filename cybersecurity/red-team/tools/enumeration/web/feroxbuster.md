# feroxbuster

<div class="row row-cols-lg-2"><div>

[feroxbuster](https://github.com/epi052/feroxbuster) <small>(6.2k ⭐)</small> is a powerful forced browsing tool with web crawler capabilities written in Rust.

```ps
$ feroxbuster -u https://example.com
```

* `-t 150`: maximum number of threads per directory
* `-x pdf,zip`: append these extensions
* `-H "Header: value"`: add one or multiple headers
* `-b cookie_name=value`: alias for `-H Cookie:`
* `--extract-links`: enable crawler, enabled by default
* `--filter-similar-to`: exclude soft 404 pages
* `--random-agent`: use a random user agent

</div><div>

* `--insecure --proxy http://127.0.0.1:8080`: for use with Burp
* `--scan-dir-listings`: scan directory listings
* `--replay-proxy http://localhost:8080 --replay-codes 200 302`: replay the request matching the given status codes
* `--scan-limit 1`: number of hosts scanned at a time
* `--rate-limit 100`: number of requests per second per host
* `--collect-backups`: collect backup extensions

You can also create a `ferox-config.toml`. The template is [here](https://github.com/epi052/feroxbuster/blob/main/ferox-config.toml.example)
</div></div>