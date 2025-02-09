# Nuclei

<div class="row row-cols-lg-2"><div>

[Nuclei](https://github.com/projectdiscovery/nuclei) is probably the best website scanner. It is written in GO, pretty fast, and we can relatively easily add custom scans.

* [Documentation](https://docs.projectdiscovery.io/tools/nuclei/overview) <small>(⛪)</small>
* [Nuclei](https://github.com/projectdiscovery/nuclei) <small>(22.1k ⭐)</small>
* [Nuclei Template](https://github.com/projectdiscovery/nuclei-templates) <small>(9.7k ⭐)</small>

Nuclei can be used directly from Burp Suite. One downside is that most nuclei templates were written **to perform GET requests**.
</div><div>

You can install nuclei and nuclei templates using:

```ps
$ go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
$ nuclei -update
```

You can run a basic scan using <small>(on all ports, active attacks, etc.)</small>:

```ps
$ nuclei -u "https://example.com"
```
</div></div>