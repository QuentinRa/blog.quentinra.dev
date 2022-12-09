# 🚀 Node.js 🚀

<div class="row row-cols-md-2 mt-4"><div>

Node.js is a modern JavaScript environment that can be used

* 🗃️ To write websites <small>(express handlebars...)</small>
* 📦 To write desktop/mobile apps <small>(electron...)</small>
* 🍹 To create APIs <small>(express, socket.io...)</small>
* 🔥️ To write Typescript <small>(a typed JavaScript)</small>
* ✨ To write LESS/SASS/Stylus/... <small>(improved CSS)</small>
* ... and many more
</div><div>

...
</div></div>

<hr class="sep-both">

## 📟 Express.js 📟

<div class="row row-cols-md-2"><div>

Express can be used to create websites or APIs.

* [Express.js documentation](https://expressjs.com/)
* [expressjs/generator](https://github.com/expressjs/generator)

```powershell
$ npx --yes --package express-generator express --force --no-view
$ npm audit fix --force
```
</div><div>

<details class="details-e">
<summary>Configuration</summary>

```javascript
const app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(function (req, res, next) {
    // res.setHeader('Access-Control-Allow-Origin', '*');
    // res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    // res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    // res.setHeader('Access-Control-Expose-Headers', 'Custom-header');
    // res.setHeader('Custom-header', 'value');
    next();
});

app.use('/', require('./routes/indexRouter'));
```
</details>

<details class="details-e">
<summary>Usage</summary>

```javascript
const express = require('express');
const router = express.Router();

// API Routes (GET/POST/PUT/DELETE/...)
router.get('/', (req, res, next) => {
    // get headers
    req.get('header-name')
    req.headers['header-name']
    // send something to the requester
    res.send(something); // HTML, JSON...
    res.render('index', { title: 'Title' }); // public/index.html
});

module.exports = router;
```
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Webpack
* [emojione](https://github.com/joypixels/emojione) and [emoji-toolkit](https://github.com/joypixels/emoji-toolkit)
</div><div>

Tutorials

* [logrocket](https://blog.logrocket.com/how-to-set-up-node-typescript-express/)
</div></div>