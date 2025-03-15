# YAML

<div class="row row-cols-lg-2"><div>

YAML is way more complex than JSON. In fact, JSON syntax is included in YAML. YAML is quite human-readable 🚀, so in some cases, it may be better to use YAML rather than JSON.

* **List**

```yaml
# all are the same
list1:
  - a
  - b
  - c
list2: [a, b, c]
list3: ['a', 'b', 'c']
```
</div><div>

* **Keys**

```yaml
key1: value
key2: {}
key3:
  - true
  - 5
  - "toto"
```

* **Texts** (inline and multiline texts)

```yaml
inline: This is an inline text
multiline_text1: This is a really really really
  long long text. 
  And this is still part of the text 🚀.
multiline_text2: >
  Same.
code: |+
  preserve newlines and indents
```
</div></div>

<hr class="sep-both">

## Read YAML files in Node.js

<div class="row row-cols-lg-2"><div>

#### js-yaml

[js-yaml](https://www.npmjs.com/package/js-yaml) <small>(6.1k ⭐)</small> is frequently updated.

```js!
const yaml = require('js-yaml');
const fs   = require('fs');

const xxx = yaml.load(fs.readFileSync('test.yaml', 'utf8'));
console.log(xxx);
```

In TypeScript, you may use the following import:

```ts!
// @ts-ignore
import { load } from 'js-yaml';
```
</div><div>

#### yamljs

[yamljs](https://www.npmjs.com/package/yamljs) <small>(0.9k ⭐)</small> was not updated for years.

```js!
const YAML = require('yamljs');
const fs   = require('fs');

const xxx = YAML.parse(fs.readFileSync('test.yaml', 'utf8'));
console.log(xxx)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [circleci](https://circleci.com/docs/introduction-to-yaml-configurations/)
</div><div>

* [references](https://stackoverflow.com/questions/2063616/how-to-reference-a-yaml-setting-from-elsewhere-in-the-same-yaml-file)

```
tags:
  - xxx: &xxx "XXX"

entries:
  yyy: *xxx
```
</div></div>