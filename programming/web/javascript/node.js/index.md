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

You can download Node.js [here](https://nodejs.org/en/download/). On Windows, you will get an installer, so you can get started in seconds. To check that you installation was successful, use

```powershell
# see Node version
$ node -v
# run a JavaScript
$ node index
$ node index.js
```

> 🚀 To easily manage multiple version of Node, see [nvm](https://github.com/nvm-sh/nvm) (64k ⭐), [nvm-windows](https://github.com/coreybutler/nvm-windows) (25k ⭐), or [n](https://github.com/tj/n) (17k ⭐). Alternatively, there are [nvs](https://github.com/jasongin/nvs), [nave](https://github.com/isaacs/nave), [volta](https://github.com/volta-cli/volta) (7.3k ⭐), [nodenv](https://github.com/nodenv/nodenv), [fnm](https://github.com/Schniz/fnm) (9.8k ⭐), and [nodist](https://github.com/nullivex/nodist).
</div></div>

<hr class="sep-both">

## Node.js basics

<div class="row row-cols-md-2"><div>

#### Packages

You will usually need to use external libraries such as a library to test your code, or stuff like that. They are referred to as package, and you will need a **package manager** to install them.

➡️ One package worth mentioning is [nodemon](https://www.npmjs.com/package/nodemon) ("node-mon", 25k ⭐) which is automatically restarting the node client (ex: `node index.js`) when a file in your project changed.

<br>

#### In a nutshell

Node.js includes everything you know about JavaScript, aside from the DOM <small>(document, window...)</small> as Node.js is NOT replicating an environment similar to a web browser.
</div><div>

#### What's new?

* Import a packages with **require**

```javascript
// pre-installed, see https://nodejs.org/api/fs.html
const FileSystem = require('fs');
```

Access another script A from a script B

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

## 👉 npm package manager 👈

<div class="row row-cols-md-2"><div>

[npm](https://github.com/npm/cli) (~17k ⭐) is the most well-known package manager for Node.js, as it comes bundled with Node.js in most distributions.

```powershell
$ npm install -g npm
$ npm -v
```

* See the [documentation here](https://docs.npmjs.com/).
* Use [npmjs](https://www.npmjs.com/) to find packages ([Registry API](https://registry.npmjs.org/nodemon/2.0.20)).

npm use a file called `package.json` to known which packages to import in your project. As the version are usually based on a rule, the exact version of the package can be found in `package-lock.json`.

#### New Project

Create an empty project with an empty `package.json`.

```powershell
$ npm init
```

All installed packages are stored in the folder `node_modules`. Add it to your `.gitignore`, because it's heavy+useless. ⚠️

Instead, commit `package-lock.json`. Someone else will be able to generate back the exact same `node_modules` with a command.

➡️ Commit `package.json` too, so that devs can add packages...

#### Existing Project

Install packages from an existing project (`package-lock.json`).

```powershell
$ npm ci
```

</div><div>

#### Update dependencies

Add packages in `package.json/dependencies` and install them.

```powershell
# add in package.json/dependencies + install it
$ npm i express
$ npm install express
# generate package-lock.json from package.json
$ npm i
$ npm install
# Update package-lock.json
$ npm update
```

<details class="details-e">
<summary>Define which versions are allowed</summary>

Either when installing or by editing the `package.json`, you can select which version of a library you want to use.

```powershell
# when used with "i", use "@" followed by the "version"
$ npm i express@latest
```

* **^1.2.3**: same major version (1), can change (2.3)
* **~1.2.3**: same major+minor version (1.2), can change (3)
* **>=version**: version greater or equals <small>(see also `>,<,<=`)</small>
* **=version**: this exact version
* **a-b**: a range of versions
* **a||b**: either a or b
* **latest**: use the latest
</details>

➡️ If you see an example with `require('xxx')`, then it's rather safe to assume that you can use `npm i xxx`.

#### Add scripts

Usually, we store the commands to run/test... a project in `package.json/scripts`. To run "start" below, use `npm start`.

```json
{
  "scripts": {
    // "npm start" will run "node index.js"
    "start": "node index.js"
  }
}
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

</div><div>

npm

* devDependencies
* npx
* `--save` / `-S` / `-g` (+not recommended)
</div></div>