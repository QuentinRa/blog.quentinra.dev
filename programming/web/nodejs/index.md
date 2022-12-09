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

**Middlewares**: they are functions that will be executed for each request. For instance, `express.json()` is adding the header `application/json` to the response.

```javascript
// example: adding headers
app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Expose-Headers', 'Custom-header');
    res.setHeader('Custom-header', 'value');
    next(); // pass to the next middleware
});
```
</div><div>

Then, we are adding "local" routers for each API route.

```bash
const usersRouter = require('./routes/usersRouter');
app.use('/users', usersRouter);
```

A "local" router is something like this.

```javascript
const express = require('express');
const router = express.Router();

// API Routes "/" matches "/users/"
router.get('/', (req, res) => {});
router.post('/:id', (req, res) => {});
router.patch('/delete/:id', (req, res) => {});
router.delete('/:id', (req, res) => {});

module.exports = router;
```

Useful methods

```javascript
// get headers
req.get('header-name')
req.headers['header-name']

// send something to the requester
res.send(something); // HTML, JSON...
res.render('index', { title: 'Title' }); // public/index.html
```
</div></div>

<hr class="sep-both">

## 🌟 Testing with mocha.js 🌟

<div class="row row-cols-md-2 mt-4"><div>

Mocha is a **testing-framework**. See [GitHub](https://github.com/mochajs/mocha) (21.8k ⭐).

```bash
$ npm i mocha
$ npx mocha folder
```

The two main components are:

* **describe** 📦: a suite of tests
* **it** 🔨: a test

As for the code of your test, there are many libraries.

<details class="details-e">
<summary>Assert</summary>

```javascript
let assert = require('assert');

describe('name', function() {
    it('name', function () {
        // examples
        assert.equal(actuel, expected);
        assert.ok(boolean);
        assert.fail();
        // ...
    });
})
```
</details>

<details class="details-e">
<summary>Chai.js (plugin HTTP)</summary>

See [GitHub](https://github.com/chaijs/chai-http) (0.7k ⭐).

```javascript
const chai = require('chai');
const chaiHttp = require('chai-http');
const app = require('../app');

// setup
chai.use(chaiHttp);
chai.should();

chai.request(app)
    .get('URL') // get
    .post('URL').send(body) // post
    .patch('URL').send(body) // patch
    .delete('URL') // delete
/*
res.should.have.status(200);
res.body.should.be.a('array');
res.body.should.be.a('object');
res.body.length.should.be.eql(0);
res.body.should.have.a.lengthOf.at.least(2);
res.body.should.have.property('xxx');
res.should.have.header('yyy');
res.body.should.be.eql('zzz')
 */
```
</details>
</div><div>

```javascript
describe('name', function() {
    // before: before all tests
    // beforeEach: before eacht est
    // ...

    it('name', function () {
        // your test here
    });

    // if working with promises
    it('name', function (done) {
        asyncCode().then(() => {
            done(); // test done
        });
    });
    // same
    it('name', async () => { await asyncCode() });
})
```
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
* Node Mocha Chai
  * [ezekielekunola.com](https://www.blog.ezekielekunola.com/testing-node-api-with-mocha-and-chai)
  * [buddy.works](https://buddy.works/guides/how-automate-nodejs-unit-tests-with-mocha-chai)
</div></div>