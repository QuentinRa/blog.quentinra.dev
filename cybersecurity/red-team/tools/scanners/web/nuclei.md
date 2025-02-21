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

<br>

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

<br>

#### Nuclei Templates — Variables

You can declare variables to use them across your template file:

```yaml!
variables:
  my_variable:
    - "a-im"
    - "accept"
    - "accept-charset"
```

To use this variable, use `my_variable` with HTTP and `template.my_variable` with JavaScript.

There are quite a few variables by default. A variable is created for each header <small>(e.g. user_agent for User-Agent)</small> or when using `name:`.

* `query`: HTTP request query
* `path`: HTTP request path
* `method`: HTTP request method
* `request`: raw HTTP request
* `response`: raw HTTP response
* `header`: HTTP response headers
* `all_headers`: HTTP unique response headers
* `body`: HTTP response body
* `status_code`: HTTP response status code

</div><div>

<br>

#### Nuclei Templates — Expressions

Expressions are used by matchers and extractors. We can use `word`, `regex`, `status` and `dsl` which encompasses all of them.

```yaml!
# Condition: OR or AND
# Part: [body, header, query, path]
# Name: store the result in a variable
# Internal: do not print on stdout the result
# Case-insensitive: default to false
# Negative: negate the result, default to false

    - type: dsl
      dsl:
        - 'method != "HEAD"'
        - 'method != "OPTIONS"'
      condition: and

    - type: word
      part: body
      name: variable_name
      internal: false
      case-insensitive: true
      negative: true
      words:
        - "Password"

    - type: regex
      part: body
      group: 1
      regex:
        - '(.+)'
```

✍️ Variables created using `name` are shared between templates and protocols. Their type is often: `nil`, `string`, `[]string`. Make sure to check the type as when there is one value, it's interpolated as a string.

<br>

#### Nuclei Templates — Matchers

Matchers (refer to the [documentation](https://docs.projectdiscovery.io/templates/reference/matchers)) are set of instructions to determine if a request or a response matches their expected value. They must

```yaml!
# Stop At First Match: default to false
# Matchers Condition: default to "or"

    stop-at-first-match: false
    matchers-condition: and
    matchers:
      - some_expression
```

✍️ Matchers are optional. You can have name on your matcher, the output will look like `[template-id:matcher-name]`. 

<br>

#### Nuclei Templates — Extractors

Extractors can be used to extract values from the request or response and display it in the output. Unlike matches, they are not limited to booleans.

```yaml!
    extractors:
      - some_expression
```

✍️ Extractors are optional. Regexes can only match one line. The output looks like `[...] example.com [value1, value2, etc.]`.
</div></div>

<hr class="sep-both">

## Nuclei DSL Language

<div class="row row-cols-lg-2"><div>

You can list the available DSL functions using:

```shell!
$ nuclei -ldf
```

The available common DSL functions are:

```js!
contains(arg1, arg2 interface{}) interface{}
count(str, substr string) int
ends_with(str string, suffix ...string) bool
len(arg1 interface{}) interface{}
line_ends_with(str string, suffix ...string) bool
line_starts_with(str string, prefix ...string) bool
md5(arg1 interface{}) interface{}
print_debug(args ...interface{})
rand_int(optionalMin, optionalMax uint) int
regex(arg1, arg2 interface{}) interface{}
replace(arg1, arg2, arg3 interface{}) interface{}
split(input string, n int)
starts_with(str string, prefix ...string) bool
substr(str string, start int, optionalEnd int)
to_lower(arg1 interface{}) interface{}
to_upper(arg1 interface{}) interface{}
trim(arg1, arg2 interface{}) interface{}
uniq(elements ...interface{})
contains_all(body interface{}, substrs ...string) bool
contains_any(body interface{}, substrs ...string) bool
```

The available uncommon DSL functions are:

```js!
base64(arg1 interface{}) interface{}
base64_decode(arg1 interface{}) interface{}
concat(args ...interface{}) string
html_escape(arg1 interface{}) interface{}
html_unescape(arg1 interface{}) interface{}
join(separator string, elements ...interface{}) string
remove_bad_chars(arg1, arg2 interface{}) interface{}
reverse(arg1 interface{}) interface{}
sha1(arg1 interface{}) interface{}
sort(elements ...interface{})
split(input string, separator string,  optionalChunkSize)
url_decode(arg1 interface{}) interface{}
url_encode(arg1 interface{}) interface{}
wait_for(seconds uint)
```
</div><div>

Common code samples:

```yaml!
- 'md5(body) == "..."'
- 'status_code == 200'
- 'contains(content_type, "image/")'
- 'line_ends_with(path, ".js")'
- "!regex('(?i)strict-transport-security', header)"
```

You can declare variables and reuse them in the next DSL statements.

```
    - type: dsl
      internal: true
      name: _loc
      dsl:
        - http_location
        - path

    - type: dsl
      dsl:
        - _loc == ""
```
</div></div>

<hr class="sep-both">
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
      - type: dsl
        dsl:
          - "sha256(body) == 'value'"
          - "contains(body, 'packages')"
          - "contains(tolower(header), 'application/octet-stream')"
          - "!regex('(?i)strict-transport-security', header)"
          - "status_code != 301"
          - 'contains(path, "ico")'
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