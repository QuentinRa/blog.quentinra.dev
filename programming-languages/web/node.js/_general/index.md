# 🚀 Node.js 🚀

<div class="row row-cols-md-2 mt-4"><div>

[Node.js](https://nodejs.org/) is a modern JavaScript environment that can be used

* 🗃️ To write websites <small>(express handlebars...)</small>
* 📦 To write desktop/mobile apps <small>(electron...)</small>
* 🍹 To create APIs <small>(express...)</small>
* 🔥️ To write Typescript <small>(a typed JavaScript)</small>
* ✨ To write LESS/SASS/Stylus/... <small>(improved CSS)</small>
* ... and many more

**Where to learn?**

* [Documentation](https://nodejs.org/api/) <small>(⛪)</small>
* [Tutorials](https://nodejs.dev/en/learn) <small>(🚀)</small> / [Knowledge](https://nodejs.org/en/knowledge/) <small>(old)</small>
* [Runkit](https://runkit.com/home) <small>(online playground)</small>
</div><div>

You can download Node.js [here](https://nodejs.org/en/download/). On Windows, you will get an installer, so you can get started in seconds. To check that your installation was successful, use

```powershell
# see Node version
$ node -v
# run a JavaScript
$ node index
$ node index.js
```

> 🚀 To easily manage multiple versions of Node, see [nvm](https://github.com/nvm-sh/nvm) (64k ⭐), [nvm-windows](https://github.com/coreybutler/nvm-windows) (25k ⭐), or [n](https://github.com/tj/n) (17k ⭐). Alternatively, there are [nvs](https://github.com/jasongin/nvs), [nave](https://github.com/isaacs/nave), [volta](https://github.com/volta-cli/volta) (7.3k ⭐), [nodenv](https://github.com/nodenv/nodenv), [fnm](https://github.com/Schniz/fnm) (9.8k ⭐), [asdf](https://github.com/asdf-vm/asdf) and [nodist](https://github.com/nullivex/nodist).
</div></div>

<hr class="sep-both">

## Node.js basics

<div class="row row-cols-md-2"><div>

#### Packages

You will usually need to use external libraries such as a library to test your code, or stuff like that. They are referred to as packages, and you will need a **package manager** to install them.

➡️ One package worth mentioning is [nodemon](https://www.npmjs.com/package/nodemon) ("node-mon", 25k ⭐) which automatically restarts the node client (ex: `node index.js`) when a file in your project changes.

<br>

#### In a nutshell

Node.js includes everything you know about JavaScript, aside from the DOM <small>(document, window...)</small> as Node.js is NOT replicating an environment similar to a web browser.
</div><div>

#### What's new?

* Import a package with **require**

```javascript
// pre-installed, see https://nodejs.org/api/fs.html
const FileSystem = require('fs');
```

Access another script A from another script B

```javascript
// in A.js, you need to export what you want to expose
module.exports = {}
module.exports.five = 5
// in B.js, use require
const A = require('./A.js')
console.log(A.five)
```
</div></div>

<hr class="sep-both">

## Node FileSystem (<code>fs</code>)

<div class="row row-cols-md-2"><div>

#### Import 'fs'

```javascript
const fs = require('fs')
```

For `async` functions, you may use `if (err) console.error(err);`.

#### Read

```javascript
const filedata = fs.readFileSync("path/to/file")
const filenames = fs.readdirSync("path/to/dir/")
// async
fs.readdir("data/wp/", (err, files) => { /* ... */ })
```

#### Write

```javascript
fs.writeFileSync("path/to/file",  fileData, 'utf8')
```
</div><div>

#### Read/Write JSON files

```javascript
// read
const json = JSON.parse(fs.readFileSync("path/to/xxx.json"))
// write
fs.writeFileSync("path/to/xxx.json", JSON.stringify(json, null, 2), 'utf8')
```

To be accurate, you should convert the Buffer to a string using `fs.readFileSync("...").toString('utf8')`.

#### Rename/Move

```javascript
// async
fs.rename(path, newPath, (err) => { /* ... */ });
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* .env / [nconf](https://nodejs.org/en/knowledge/file-system/how-to-store-local-config-data/) / [node-config](https://github.com/node-config/node-config)
* See JavaScript, what are modules/...?
* [bcrypt](https://attacomsian.com/blog/nodejs-password-hashing-with-bcrypt)
* [http2 server-push](https://blog.risingstack.com/node-js-http-2-push/)
* [nodebestpractices](https://github.com/goldbergyoni/nodebestpractices)
* [commander](https://github.com/tj/commander.js) (CLI interface)

</div><div>

npm

* devDependencies
* winston test-debug http logs
</div></div>