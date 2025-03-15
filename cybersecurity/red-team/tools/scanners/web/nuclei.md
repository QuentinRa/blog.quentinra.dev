# Nuclei

<div class="row row-cols-lg-2"><div>

[Nuclei](https://github.com/projectdiscovery/nuclei) is probably the best website scanner. It is written in GO, pretty fast, and we can relatively easily add custom scans.

* [Documentation](https://docs.projectdiscovery.io/tools/nuclei/overview) <small>(⛪)</small>
* [Nuclei](https://github.com/projectdiscovery/nuclei) <small>(22.5k ⭐)</small>
* [Nuclei Templates](https://github.com/projectdiscovery/nuclei-templates) <small>(9.8k ⭐)</small>

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
* `-tags abc,def`: only include templates matching one of these tags
* `-etags abc,def`: exclude templates matching one of these tags
* `-ni`/`-no-interactsh`: disable out-of-band templates
* `.nuclei-ignore`: define which template and tags to ignore

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

The documentation is available [here](https://docs.projectdiscovery.io/templates/introduction). The reference is available [here](https://github.com/projectdiscovery/nuclei/blob/dev/SYNTAX-REFERENCE.md).

<div class="row row-cols-lg-2"><div>

#### Nuclei Templates — Basics

A basic template starts with:

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

# Execute the 2nd request only if the 1st matched
flow: http(1) && http(2)

# Operators are lazy. If the first requested matched
# Then the second expression is not evaluated.
flow: http(1) || (http(2) && http(3))
```

* `http`: can be used for fuzzing or to HTTP make requests.
* `javascript`: can be used to execute JavaScript with/without nuclei internal libraries, to perform complex operations.
* `code`: execute native code in any language, such as python. For security reasons, it is not executed until the template is signed.

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

To use this variable, use:

* `my_variable` in the HTTP protocol block 
* `template.my_variable` in the JavaScript protocol block

There are quite a few variables by default. A variable is created both for each header <small>(e.g. user_agent for User-Agent)</small> and when using a `name`.

* `request` - Raw HTTP request made from the client
* `method` - HTTP request method from the client request
* `query` - HTTP request query from the client request
* `path` - HTTP request path from the client request
* `response` - Raw HTTP response received from server
* `status_code` - Status Code received from server
* `body` - HTTP response body received from server
* `header`, `all_headers` - HTTP response headers

There are some undocumented variables such as `Path`, `File`, etc.
</div><div>

<br>

#### Nuclei Templates — Expressions

Expressions are used by matchers and extractors. We can use `word`, `regex`, `status` and `dsl` which encompasses all of them.

```yaml!
# Condition: OR or AND
# Part: ANY variable (such as body, header, query, path, etc.)
# Name: store the result in a variable
# Internal: do not print on stdout the result
# Case-insensitive: default to false
# Negative: negate the result, default to false

    - type: dsl
      dsl:
        - 'method != "HEAD"'
        - 'method != "OPTIONS"'
      condition: and

    - name: variable_name
      type: word
      part: body
      words:
        - "Password"
      negative: true
      internal: false
      case-insensitive: true

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

Extractors can be used to extract values from the request or response and display them in the output.

```yaml!
    extractors:
      - some_expression
```

✍️ Extractors are optional. Regexes can only match one line. The output looks like `[xxx:yyy] example.com [extracted_value1, etc.]`.
</div></div>

<hr class="sep-both">

## Nuclei DSL Language

<div class="row row-cols-lg-2"><div>

You can list the available DSL functions using:

```shell!
$ nuclei -ldf
```

Useful and commonly used DSL functions are:

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
concat(args ...interface{}) string
contains_all(body interface{}, substrs ...string) bool
contains_any(body interface{}, substrs ...string) bool
join(separator string, elements ...interface{}) string
sort(elements ...interface{})
```
</div><div>

Common code samples:

```yaml!
# We can use logicial operators
# e.g. condition && condition || condition
- 'md5(body) == "..."'
- 'status_code == 200'
- 'contains(content_type, "image/")'
- "contains(tolower(all_headers), \"content-type: image/\")"
- 'line_ends_with(path, ".js")'
- "!regex('(?i)strict-transport-security', header)"
- 'line_ends_with(tolower(path), "/readme.md", "/readme.html")'
- "!contains_all(body, \"aaa\", \"bbb\")"
- to_string(content_length) + " bytes"
```

You can declare variables and reuse them in the next DSL statements.

```yaml!
    - type: dsl
      internal: true
      name: _loc
      dsl:
        - http_location
        - path
        - replace(concat(Path, "/", File), "//", "/")
        - replace(replace(matched, BaseURL, "/"), "//", "/")

    - type: dsl
      dsl:
        - _loc == "/"
```
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

A request contains matcher, extractors, and:

```yaml!
    host-redirects: true
    max-redirects: 3
    max-size: 5000
```

* Most templates (>95%) are using arbitrary requests

```yaml!
  - method: GET
    path:
      # Write down the URL to fetch
      # See also: {{RootURL}}, {{Path}}
      - "{{BaseURL}}"
```
</div><div>

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

    # only fuzz ?redirect= with values from "redirect" payload
    fuzzing:
      - part: query
        type: postfix
        mode: single
        keys:
          - redirect
        fuzz:
          - "{{redirect}}"
```
</div></div>

<hr class="sep-both">

## Nuclei JavaScript Protocol

<div class="row row-cols-lg-2"><div>

JavaScript templates are quite convenient as we can write complex code without having to use a language such as Python or GoLang that would require `-code` and code signing.

They added a few JavaScript helpers.

* `log(some_variable)`: list key/values when using debug mode
* `log(template.http_1_request)`: log the first HTTP request

📚 Any returned value will be cast to a string. You can return an array <small>(ex: `[].join('\n')`)</small> to have multiple value send to the extractor.
</div><div>

Example:

```yaml!
javascript:
  - code: |
      const loc = template._loc ? (Array.isArray(template._loc) ? template._loc : [template._loc]) : []
  
      const content = template.http_all_headers
      content.split(/\r\n/).join('\n')

    extractors:
      - type: regex
        regex:
          - '.+'
```
</div></div>

<hr class="sep-both">

## Nuclei Workflows

<div class="row row-cols-lg-2"><div>

A workflow is a logical execution of templates.

For instance, before running any WordPress template, we may first want to check if the target is a WordPress website.

```yaml!
id: wordpress-workflow

info:
  name: Wordpress Workflow
  author: anonymous

workflows:
  - template: web/technologies/wordpress/wordpress-detect.yaml
    subtemplates:
      - tags: wordpress
```

This template will run `wordpress-detect.yaml`, and if the template matches, then it will run templates tagged with `wordpress`.

⚠️ Use `-w` and do not use `-t` to avoid executing all templates.
</div><div>

We can go beyond this example and only run templates according to the matcher name. For instance:

```yaml!
    - template: web/technologies/wordpress/xmlrpc/wordpress-xmlrpc.yaml
      matchers:
      - name: _xmlrpc
        subtemplates:
          - tags: xmlrpc
```

For reference, the matcher in `wordpress-xmlrpc.yaml`:

```yaml!
    - type: dsl
      name: _xmlrpc
      dsl:
        - 'status_code == 405 && contains(tolower(all_headers), "content-type: text/plain")'
        - 'status_code == 200 && contains(tolower(all_headers), "content-type: text/xml")'
      condition: or
```

⚠️ It only works with `matchers-condition: or` <small>(bug)</small>.
</div></div>

<hr class="sep-both">

## Nuclei Template Anchors

<div class="row row-cols-lg-2"><div>

YAML support variables. It can be used to factorize code.

```yaml!
variables:
  fuzzing: &fuzzing
    - part: header
      type: postfix
      mode: single
      keys:
        - User-Agent
      fuzz:
        - ""

  matchers: &matchers
    - type: dsl
      name: _xmlrpc
      dsl:
        - 'status_code == 405 && contains(tolower(all_headers), "content-type: text/plain")'
        - 'status_code == 200 && contains(tolower(all_headers), "content-type: text/xml")'
      condition: or
```
</div><div>

We can use them pretty straightforwardly in the requests.

```yaml!
http:
  - pre-condition:
      - type: dsl
        dsl:
          - 'method != "HEAD"'
          - 'method != "OPTIONS"'
          - 'line_ends_with(tolower(path), "/xmlrpc", "/xmlrpc.php")'
        condition: and

    fuzzing: *fuzzing
    matchers: *matchers
```

📚 There is no official template using anchors. KISS?
</div></div>