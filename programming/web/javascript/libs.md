# 🪨 JavaScript Libraries 🪨

A list of libraries made by companies/users, that may be used both for websites (JavaScript), or servers (Node.js/...).

<hr class="sep-both">

## 🔎 General 🔎

<div class="row row-cols-md-2 mt-4"><div>

#### HTTP clients

* [axios](https://axios-http.com/)

#### Node servers

* [connect](https://www.npmjs.com/package/connect)
</div><div>

#### Package Managers

* [yarn](https://github.com/yarnpkg/yarn) (41k ⭐): Yarn V1
* [berry](https://github.com/yarnpkg/berry) (6k ⭐): Yarn V2
* [bower](https://github.com/bower/bower) (15k ⭐)
* [webpack](https://webpack.js.org/) <small>(see in-browser)</small>
* [parcel.js](https://parceljs.org/)
* [pnpm](https://github.com/pnpm/pnpm) (21k ⭐)
</div></div>

<hr class="sep-both">

## 🚀 Client-side 🚀

<div class="row row-cols-md-2 mt-4"><div>

#### Frameworks

* [preactjs](https://preactjs.com/)
* [lit](https://github.com/lit/lit)
</div><div>

#### Tools

* [vite](https://vitejs.dev/)
</div></div>

<hr class="sep-both">

<p class="text-center display-5">Unsorted libraries</p>

<hr class="sep-both">

## Read YAML files in Node

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