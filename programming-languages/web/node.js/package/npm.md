# npm package manager 🤖

<div class="row row-cols-md-2"><div>

[npm](https://github.com/npm/cli) (~17k ⭐) is the most well-known package manager for Node.js, as it comes bundled with Node.js in most distributions.

```powershell
$ npm install -g npm
$ npm -v
```

* See the [documentation here](https://docs.npmjs.com/).
* Use [npmjs](https://www.npmjs.com/) to find packages ([Registry API](https://registry.npmjs.org/nodemon/2.0.20)).

npm uses a file called `package.json` to know which packages to import into your project. As versions are usually based on a rule, the exact version of the package can be found in `package-lock.json`.

#### New Project

Create an empty project with an empty `package.json`.

```powershell
$ npm init
```

All installed packages are stored in the folder `node_modules`. Add it to your `.gitignore`, because it's heavy and useless. ⚠️

Instead, commit `package-lock.json`. Someone else will be able to generate back the same `node_modules` with a command.

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