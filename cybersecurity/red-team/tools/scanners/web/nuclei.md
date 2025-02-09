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

<hr class="sep-both">

## Nuclei Overview

<div class="row row-cols-lg-2"><div>

#### Nuclei — Template Scopes

Nuclei has multiple template scopes:

*  🗺️ request `[default]` — make a request to the URL
* 🧪 fuzz `[-dast/-fuzz]` — make a request or load a request
* 🤖 code `[-code]` — enable dangerous templates <small>(python, etc.)</small>
* ☠️ headless `[-headless]` — enable templates using chromium
* 📚 workflows `[-w workflows/]` — invoke multiple template

Enable a scope such as `-fuzz` disables every other template.

#### Nuclei — Input Modes

Nuclei supports multiple input modes, but when using another input mode aside from `-u`/`-list`, nuclei automatically uses the `fuzz` mode.

* `-u https://example.com`: URL to scan
* `-list targets.txt`: URLs to scan
* `-im burp -list dummy.req`: Burp "Saved Item" request
* `-im openapi -list dummy.yaml`: OpenAPI specification

⚠️ Most templates were written with `method: GET` which **override any method** you would want to use <small>(e.g. POST in OpenAPI specification)</small>.
</div><div>
</div></div>