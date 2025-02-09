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
$ nuclei -update -update-templates
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

⚠️ Use `-update-template-dir` if your workflows are in a custom folder.

#### Nuclei — Input Modes

Nuclei supports multiple input modes, but when using another input mode aside from `-u`/`-list`, nuclei automatically uses the `fuzz` mode.

* `-u https://example.com`: URL to scan
* `-list targets.txt`: URLs to scan
* `-im burp -list dummy.req`: Burp "Saved Item" request
* `-im openapi -list dummy.yaml`: OpenAPI specification
* `-im jsonl -list dummy.txt`: JSON Lines

⚠️ Most templates were written with `method: GET` which override any method you would want to use <small>(e.g. POST in OpenAPI specification)</small>.
</div><div>

#### Nuclei — Common Options

By default, nuclei will run every template according to the scope. They may target other ports even if you used `-u https://example.com:443`.

* `-t folder/`: only execute templates in this folder
* `-etags abc,def`: exclude templates matching these tags
* `-ni`/`-no-interactsh`: disable template using OOB payloads
* `.nuclei-ignore`: define which template/tags to ignore

⚠️ Nuclei often stops with no results due to the following:

* `-mhe 10`: when there are too many errors, nuclei stops.
* `-no-mhe`: during pentests, you would want to disable `mhe`
* `-fuzz-param-frequency n`: when the last `n` fuzzing responses where the same, fuzzing stops. You should use `100+` during pentests.

Output options:

* `-j`: show output as JSON
* `-jsonl-export file`: store results as JSON in a file

Other handy options:

* `-p http://127.0.0.1:8080`: proxy
</div></div>

<hr class="sep-both">

## Nuclei Templates

<div class="row row-cols-lg-2"><div>

#### Nuclei Templates — Basics

The documentation is available [here](https://docs.projectdiscovery.io/templates/introduction). A basic template starts with:

```yaml!
id: your-template-id

info:
  name: Your Template Name
  author: anonymous
  severity: info
  tags: tag1,tag2
```
</div><div>

#### Nuclei Templates — Protocols

Nuclei supports multiple protocols which are different ways to write your template. They can be chained using flows.

```yaml!
# ✍️ Run the "http" protocol then the "javascript" protocol
# 📚 Flow are not specified when there is no sequencing
flow: |
    http()
    javascript()

# From the documentation
flow: http(1) && http(2)
```

* `http`: can be used for fuzzing or to HTTP make requests.
* `javascript`: can be used to execute JavaScript such as when the HTTP protocol is not enough to perform complex operations.
* `code`: execute native code in any language, such as python. It only works if the template is signed for security reasons.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```yaml!
id: simple-workflow-example

info:
  name: Simple Workflow Example
  author: anonymous

workflows:
  - template: dummy1.yaml
    subtemplates:
      - template: dummy2.yaml
```
</div><div>
</div></div>