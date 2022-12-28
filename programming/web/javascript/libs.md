# 🪨 JavaScript Libraries 🪨

A list of libraries made by companies/users, that may be used both for websites (JavaScript), or servers (Node.js/...).

<hr class="sep-both">

<p class="text-center display-5">👻 To-do 👻</p>

<hr class="sep-both">

## 🔎 General 🔎

<div class="row row-cols-md-2 mt-4"><div>

#### HTTP clients

* [axios](https://axios-http.com/) (97.9k ⭐, alternative to fetch)

#### Node servers

* [connect](https://github.com/senchalabs/connect) (9.6k ⭐, alternative to Express)
* [fastify](https://github.com/fastify/fastify) (26k ⭐, alternative to Express)
* [nest](https://github.com/nestjs/nest) (53.1k ⭐, relies on both fastify, and express)

#### Testing

**Note**: assert/chai/should/expect/unexpect are in mocha's notes.

* [Jasmine](https://github.com/jasmine/jasmine) (15.5k ⭐, alternative to Mocha)
* [QUnit](https://github.com/qunitjs/qunit) (4k ⭐, alternative to Mocha)
* [Karma](https://github.com/karma-runner)) (12k ⭐, alternative to Mocha)
* [jestjs](https://github.com/facebook/jest) (41k ⭐, alternative to Mocha, [frisby](https://github.com/vlucas/frisby))
</div><div>

#### JavaScript environment

* [Deno](https://deno.land/) (87k ⭐, alternative to Node)
* [neutralinojs](https://github.com/neutralinojs/neutralinojs) (6.3k ⭐, alternative to Electron)
* [tauri](https://github.com/tauri-apps/tauri) (56k ⭐, alternative to Electron)

#### Package Managers

* [yarn](https://github.com/yarnpkg/yarn) (41k ⭐): Yarn V1
* [berry](https://github.com/yarnpkg/berry) (6k ⭐): Yarn V2
* [bower](https://github.com/bower/bower) (15k ⭐)
* [pnpm](https://github.com/pnpm/pnpm) (21k ⭐)
* [atmospherejs](https://atmospherejs.com/) (meteor, seems dead+no Github)
</div></div>

<hr class="sep-both">

## 🚀 Client-side 🚀

<div class="row row-cols-md-2 mt-4"><div>

#### Frameworks

* [Riot.js](https://github.com/riot/riot) (15k ⭐)
* [preactjs](https://preactjs.com/) (33.5k ⭐)
* [lit](https://github.com/lit/lit) (13.4k ⭐)
* [Ionic](https://github.com/ionic-team/ionic-framework) (49k ⭐)
* [React](https://github.com/facebook/react) (200k ⭐)
  * [Next](https://github.com/vercel/next.js/) (98k ⭐)
  * [React Native](https://github.com/facebook/react-native)
  * [reactjsexample](https://reactjsexample.com/) (107k ⭐)
* [Angular](https://github.com/angular/angular) (86k ⭐)
* [gatsby](https://github.com/gatsbyjs/gatsby) (54k ⭐)

Random

* [Mosaic](https://github.com/Authman2/Mosaic) (0.4k ⭐)
</div><div>

#### Tools

* [vite](https://vitejs.dev/) (50.9k ⭐, +vitest)
* [Snowpack](https://www.snowpack.dev/) (19.7k ⭐, dropped)
* [WMR](https://github.com/preactjs/wmr) (4.7k ⭐)
* [parcel.js](https://github.com/parcel-bundler/parcel) (41.8k ⭐)

#### Bundles

* [nw.js](https://github.com/nwjs/nw.js/) (39.3k ⭐, <small>"call directly from the DOM"</small>)
* [rollupjs](https://github.com/rollup/rollup) (22.7k ⭐)
* [esbuild](https://github.com/evanw/esbuild) (34.2k ⭐)
* [webpack](https://webpack.js.org/) (62.2k ⭐) <small>(see in-browser)</small>
* [terser](https://github.com/terser/terser) (7.6k ⭐, minifier)
</div></div>

<hr class="sep-both">

<p class="text-center display-5">🔎 Unsorted libraries 🔎</p>

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