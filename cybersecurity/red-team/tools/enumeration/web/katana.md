# Katana

<div class="row row-cols-lg-2"><div>

[Katana](https://github.com/projectdiscovery/katana) <small>(13.2k ⭐)</small> is a web crawler written in go that leverage [jsluice](https://github.com/BishopFox/jsluice) for JavaScript crawling. It is maintained by Project Discovery.

* [Documentation](https://docs.projectdiscovery.io/tools/katana/overview) <small>(⛪)</small>
* [katana-ng](https://github.com/oneaudit/katana-ng) <small>(0.1k ⭐)</small> — Fork with useful changes

Make sure to have a supported version of GO <small>(look inside `/go.mod`, [ref](/programming-languages/high-level/others/golang/index.md))</small>.

```ps
$ CGO_ENABLED=1 go install "github.com/oneaudit/katana-ng/cmd/katana-ng@latest"
```
</div><div>

Katana has two crawling modes. You can swap with `-headless`.

1. **Standard** 🐐: Common fast crawling using HTTP responses. It may miss endpoints has static analysis has its limits.

2. **Headless** 🧪: Crawl by rendering pages in a Chromium browser. It could discover more URLs, but proxy support doesn't work much.

Finally, you can use it as a library in another project.
</div></div>

<hr class="sep-both">

## Katana Overview 🗺️

<div class="row row-cols-lg-2"><div>

#### Katana — Crawler Scope

A few options to configure the scope of the crawler:

* `-u "https://example.com"`: comma-separated list of URLs
* `-H headers.txt`: file with headers
* `-known-files all`: inspect and crawl `robots.txt` and `sitemap.xml`

#### Katana — Crawler Behavior

A few options to configure the crawler behaviors:

* `-depth 3`: crawling depth
* `-disable-redirects`: do not follow redirects
* `-display-out-scope`: add out of scope URLs to the output
* `-investigate-directories` <small>(katana-ng)</small>: investigate forced browsing
* `-disable-default-extension-filter` <small>(katana-ng)</small>: the default extension filter is removing a large number of crawled URLs from the output and can be disabled with this option.

#### Katana — Crawling Speed

A few options impacting performance:

* `-rate-limit 150`: requests per second
* `-timeout 10`: timeout before aborting
* `-retry 1`: number of retries
</div><div>

#### Katana — Extra Crawling

A few options to attempt to discover more endpoints:

* `-automatic-form-fill`: automatically fill forms and submit them
* `-js-crawl`: investigate `<script>` and JavaScript files
* `-jsluice`: investigate `<script>` and JavaScript files using `jsluice`
* `-xhr-extraction`: in headless mode, extract XHR endpoints

⚠️ JSLuice cannot be compiled and is disabled on Windows.

#### Katana — Output Options

A few options related to the output of the tool:

* `-proxy http://xxx:8080` or `-headless-options ...,proxy-server=http://xxx:8080`: use a proxy <small>(may not work on Windows)</small>
* `-output file.txt`: write results to a file
* `-jsonl`: write results are JSON Lines <small>(one JSON object per line)</small>

#### Katana — Additional Options

A few additional options:

* `-disable-update-check`: do not check for updates
* `-silent`: do not show logs
</div></div>