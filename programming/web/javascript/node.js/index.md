# 🚀 Node.js 🚀

<div class="row row-cols-md-2 mt-4"><div>

[Node.js](https://nodejs.org/) is a modern JavaScript environment that can be used

* 🗃️ To write websites <small>(express handlebars...)</small>
* 📦 To write desktop/mobile apps <small>(electron...)</small>
* 🍹 To create APIs <small>(express...)</small>
* 🔥️ To write Typescript <small>(a typed JavaScript)</small>
* ✨ To write LESS/SASS/Stylus/... <small>(improved CSS)</small>
* ... and many more
</div><div>

You can download Node.js [here](https://nodejs.org/en/download/). On Windows, you will get an installer, so you can get started in seconds. To check that you installation was successful, use

```powershell
# see Node version
$ node -v
# run a JavaScript
$ node index
$ node index.js
```

> To easily manage multiple version of Node, see [nvm](https://github.com/nvm-sh/nvm) (64k ⭐), [nvm-windows](https://github.com/coreybutler/nvm-windows) (25k ⭐), or [n](https://github.com/tj/n) (17k ⭐).
</div></div>

You will usually need to use external libraries such as a library to test your code, or stuff like that. They are referred to as package, and you will need a **package manager** to install them.

<hr class="sep-both">

## npm package manager

<div class="row row-cols-md-2"><div>

[npm](https://github.com/npm/cli) (~17k ⭐) is the most well-known package manager for Node.js, as it comes bundled with Node.js in most distributions.

```powershell
$ npm install -g npm
$ npm -v
```

* See the [documentation here](https://docs.npmjs.com/).
* Use [npmjs](https://www.npmjs.com/) to find packages.

npm use a file called `package.json` to known which packages to import in your project. As the version are usually based on a rule, the exact version of the package can be found in `package-lock.json`.

All packages are stored in `/node_modules/`.

* Create an empty project with an empty `package.json`

```powershell
$ npm init
```

* Init an existing project from a package-lock.json

```powershell
$ npm ci
```

</div><div>

* Add packages in `package.json/dependencies` and install them.

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

* Run a task: usually, we store the commands to run/... a project in `package.json/scripts`. To run "start" below, use `npm start`.

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* .env
* [yarn](https://github.com/yarnpkg/yarn) and [berry](https://github.com/yarnpkg/berry) (41k ⭐)
* [pnpm](https://github.com/pnpm/pnpm) (21k ⭐)
* update node
* [nvs](https://github.com/jasongin/nvs) / [nave](https://github.com/isaacs/nave) / [volta](https://github.com/volta-cli/volta) / [nodenv](https://github.com/nodenv/nodenv) / [fnm](https://github.com/Schniz/fnm) / [nodist](https://github.com/nullivex/nodist)

</div><div>

* [emojione](https://github.com/joypixels/emojione) and [emoji-toolkit](https://github.com/joypixels/emoji-toolkit)
* [jestjs](https://jestjs.io/docs/getting-started)
* [connect](https://www.npmjs.com/package/connect)
* [node-config](https://github.com/node-config/node-config)
* [http2 server-push](https://blog.risingstack.com/node-js-http-2-push/)

npm

* devDependencies
* npx
</div></div>