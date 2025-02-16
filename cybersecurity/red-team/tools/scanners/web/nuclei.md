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
* `javascript`: can be used to execute JavaScript with/without nuclei internal libraries, to perform complex operations.
* `code`: execute native code in any language, such as python. It only works if the template is signed for security reasons.
</div></div>

<hr class="sep-both">

## Nuclei Variables

<div class="row row-cols-lg-2"><div>

You can declare variables to use them across your template file:

```yaml!
variables:
  http_headers:
    - "a-im"
    - "accept"
    - "accept-charset"
```

To use your variables:

* HTTP: `http_headers`
* JavaScript: `template.http_headers`
</div><div>
</div></div>

<hr class="sep-both">

## Nuclei HTTP Protocol

<div class="row row-cols-lg-2"><div>

The HTTP protocol can support multiple requests. There are two kind of requests: `arbitrary` or `fuzzing`, the former being the default. 

```yaml!
http:
    - request1
    # ...
    - request2
    # ...
```

* Most templates (>95%) are using arbitrary requests

```yaml!
  - method: GET
    path:
      # Write down the URL to fetch
      # See also: {{RootURL}}, {{Path}}
      - "{{BaseURL}}"
```

* Fuzzing requests are using the HTTP method/body from the input file. ⚠️ Fuzzing on a parameter <small>(header, query, etc.)</small> will stop when the threshold across all requests (`-fuzz-param-frequency`) is met.

```yaml!
  - pre-condition:
      - type: dsl
        dsl:
          - 'method != "HEAD"'
          - 'method != "OPTIONS"'
        condition: and

    payloads:
      redirect:
        - value1

    fuzzing:
      - part: query
        type: postfix
        mode: single
        keys:
          - You can use keys to limit which parameters names are fuzzed
        fuzz:
          - "" # this is a trick to mark a template as "fuzzable"
          - "{{redirect}}" # load values from a payload
```
</div><div>

We can then analyze the result using [matchers](https://docs.projectdiscovery.io/templates/reference/matchers).

```yaml!
    stop-at-first-match: false
    matchers-condition: and
    matchers:
      # Part can be: [body, header, ...]
      # "word"=>"words", "regex"=>"regex", "status"=>"status"
      - type: word
        part: body
        name: xxx              # optional name
        words:
          - "..."
        condition: or
        internal: true         # do not print
        case-insensitive: true
        negative: true

      - type: dsl
        dsl:
          - "sha256(body) == 'value'"
          - "contains(body, 'packages')"
          - "contains(tolower(header), 'application/octet-stream')"
          - "!regex('(?i)strict-transport-security', header)"
          - "status_code != 301"
          - 'contains(path, "ico")'
```

You can extract a specific element from a response using extractors.

```yaml!
    # Refer to matchers, the syntax/types are the same
    extractors:
      - type: regex
        part: body
        group: 1
        regex:
          - '([A-Za-z0-9]+)'
```
</div></div>

<hr class="sep-both">

## Nuclei JavaScript Protocol

<div class="row row-cols-lg-2"><div>

JavaScript templates are quite convenient as we can write complex code without having to use a language such as Python or GoLang that would require `-code` and code signing. Common variables we may use: 

* `template.http_request`: the last request
* `template.http_2_request`: the `nth` request body
* `template.http_body`: the last response body
* `template.http_all_headers`: the last response headers

✍️ You will need to use `.split(/\r\n/)` to extract headers.

📚 Any returned value will be cast to a string. You can return an array <small>(ex: `[].join('\n')`)</small> to have multiple value send to the extractor.
</div><div>

They added a few JavaScript helpers.

* `log(some_variable)`: list key/values when using debug mode

Example:

```yaml!
javascript:
  - code: |
      content = template.http_all_headers
      content.split(/\r\n/).join('\n')

    extractors:
      - type: regex
        regex:
          - '.+'
```
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