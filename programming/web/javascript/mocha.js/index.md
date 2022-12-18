# Testing with mocha.js

<div class="row row-cols-md-2"><div>

Mocha is a **testing-framework**. See [GitHub](https://github.com/mochajs/mocha) (21.8k ⭐).

```bash
$ npm i mocha
```

The two main components are

* 📦 **describe** which is a suite of tests <small>(it)</small>
* 🛠️ **it** which is a function making tests

To run your tests

```bash
# run every test file inside a folder
$ npx mocha folder
# run some specific tests
$ npx mocha folder --grep "Some tests" # Some tests
$ npx mocha folder --grep "test.*" # test1, test2
```

</div><div>

In a nutshell, the syntax you will use is something like that

```javascript
describe('Some tests', function() {
    // you can init variables here
    const x1 = {}
    
    it('test1', function () {
        // your test here
    });
    it('test2', function () {
        // your test here
    });
})
```

Inside your `it` blocs, you will use a testing framework

* [Assert.js](#assertions-with-assert)
* [Chai.js](https://github.com/chaijs/chai) (7.8k ⭐)
* [Should.js](https://github.com/shouldjs/should.js) (1.9k ⭐, archived)

</div></div>

<hr class="sep-both">

## Basics

Some additional notes about features mocha has to offer.

<div class="row row-cols-md-2"><div>

#### General notes

```javascript
describe('Some tests', function() {
    // you can nest another describe
    describe('Another bunch', function() {
    })

    // you can add pending test (=to do)
    it('name')
})
```

#### Hooks

These are functions that are run before/after one/every test.

```javascript
describe('name', function() {
    // before all tests
    before('name', function () {});
    // before each test
    beforeEach('name', function () {});
    // after all tests
    after('name', function () {});
    // after each test
    afterEach('name', function () {});
})
```
</div><div>

#### Skip a test

It's a better practice than to comment out code.

```javascript
describe.skip('name', function () {});
it.skip('name', function () {});
it('name', function () {
    // ex: call based on a condition... 
    this.skip();
});
```

#### Async tests

Use this to test Promises/async code.

```javascript
describe('name', function() {
    it('name', function (done) {
        asyncCode().then(() => {
            done(); // test done
        });
    });
    // or
    it('name', async () => {
        await asyncCode()
    });

    // you can set a custom timeout for one test
    it('name', async () => {
        await asyncCode()
    }).timeout(5000); // 5 seconds
})
```
</div></div>

<hr class="sep-both">

## Assertions with assert

<div class="row row-cols-md-2"><div>

Node.js provide an assertion library called [assert.js](https://nodejs.org/api/assert.html).

```javascript
let assert = require('assert');
```

> You can use [better-assert](https://github.com/tj/better-assert) for c-style asserts.
</div><div>

```javascript
it('name', function () {
    // examples
    assert.equal(actuel, expected);
    assert.ok(boolean);
    assert.fail();
});
```
</div></div>

<hr class="sep-both">

## Testing requests with chai-http

<div class="row row-cols-md-2"><div>

This is an extension of chai to deal with HTTP requests.

See [GitHub](https://github.com/chaijs/chai-http) (0.7k ⭐).

```javascript
const chai = require('chai');
const chaiHttp = require('chai-http');
const app = require('../app');
chai.use(chaiHttp);
```

For reference, in express, `app.js` is something like that

```javascript
const app = express();
module.exports = app;
```

Then, you can run a test like this

```javascript
it('name', (done) => {
    chai.request(app).get('/').end((err, res) => {
        // yor tests here
        done()
    });
});

// for other requests
xxx.post('URI').send(body) // post
xxx.patch('URI').send(body) // patch
xxx.delete('URI') // delete
```

It's worth noting that if you do this, then for EVERY test, chai will create an HTTP server, run the request, and close it. You may want to keep the server open for all your tests.

<details class="details-e">
<summary>Keep the client open</summary>

```javascript
describe('name', function() {
    // open connection
    const requester = chai.request(app).keepOpen();

    it('name', async () => {
        const res = await requester.post('/').send({});
        // your tests here
    });

    after('name', async function () {
        await requester.close()
    });
});
```
</details>

<details class="details-e">
<summary>Login cookie</summary>

This is a follow-up of the dropdown to keep the client open.

```javascript
// get it back and save it
const cookies = res.headers['set-cookie'];

// in every following request
requester.get('/').set('Cookie', cookies[0]);
```
</details>

</div><div>

#### Should.js

Chai support should.js BDD assertions.

```javascript
// at the top
chai.should();

// inside a test
res.should.have.status(200);
res.body.should.be.a('array');
res.body.should.be.a('object');
res.body.length.should.be.eql(0);
res.body.should.have.a.lengthOf.at.least(2);
res.body.should.have.property('xxx');
res.should.have.header('yyy');
res.body.should.be.eql('zzz')
```

#### Expect.js

Chai support expect.js BDD assertions. See [expect.js](https://github.com/Automattic/expect.js) (2.1k ⭐).

```javascript
// at the top
chai.expect();

// inside a test
expect(res).to.have.status(200);
expect(res).to.be.json;
expect(res).to.redirectTo("xxx");
expect(res).to.have.header('yyy');
expect(req).to.have.cookie('zzz');
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [unexpected.js](https://unexpected.js.org/) (0.4k ⭐)
</div><div>

* Node Mocha Chai
  * [ezekielekunola.com](https://www.blog.ezekielekunola.com/testing-node-api-with-mocha-and-chai)
  * [buddy.works](https://buddy.works/guides/how-automate-nodejs-unit-tests-with-mocha-chai)
</div></div>