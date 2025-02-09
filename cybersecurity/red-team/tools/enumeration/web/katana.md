# Katana

<div class="row row-cols-lg-2"><div>

[Katana](https://github.com/projectdiscovery/katana) <small>(13.0k ⭐)</small> is a web crawler written in go that leverage [jsluice](https://github.com/BishopFox/jsluice) for JavaScript crawling. It is maintained by Project Discovery.

* [Documentation](https://docs.projectdiscovery.io/tools/katana/overview) <small>(⛪)</small>
* [katana-ng](https://github.com/oneaudit/katana-ng) <small>(0.1k ⭐)</small> — Fork with useful changes

Make sure to have a supported version of GO <small>(look inside `/go.mod`, [ref](/programming-languages/high-level/others/golang/index.md))</small>.

```ps
$ CGO_ENABLED=1 go install "github.com/oneaudit/katana-ng/cmd/katana-ng@latest"
```
</div><div>

Katana has two crawling modes.

1. **Standard** 🐐: Common fast crawling using HTTP responses. It may miss endpoints has static analysis has its limits.

2. **Headless** 🧪: Crawl by rendering pages in a Chromium browser. It could discover more URLs, but it doesn't support proxy much.

Finally, you can use it as a library in another project.
</div></div>

<hr class="sep-both">

## Katana Overview 🗺️

<div class="row row-cols-lg-2"><div>

...
</div><div>
</div></div>