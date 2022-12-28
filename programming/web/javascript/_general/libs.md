# 🪨 JavaScript Libraries 🪨

This page is both about Node, and JavaScript libraries. If a library isn't available for both, it will be removed from this page.

<hr class="sep-both">

## Read YAML files in Node

*Only tested in Node.js*

<div class="row row-cols-md-2"><div>

#### js-yaml

[js-yaml](https://www.npmjs.com/package/js-yaml) (5.8k ⭐) is frequently updated.

```javascript
const yaml = require('js-yaml');
const fs   = require('fs');

const xxx = yaml.load(fs.readFileSync('test.yaml', 'utf8'));
console.log(xxx);
```
</div><div>

#### yamljs

[yamljs](https://www.npmjs.com/package/yamljs) (0.9k ⭐) was not updated for years.

```javascript
const YAML = require('yamljs');
const fs   = require('fs');

const xxx = YAML.parse(fs.readFileSync('test.yaml', 'utf8'));
console.log(xxx)
```
</div></div>