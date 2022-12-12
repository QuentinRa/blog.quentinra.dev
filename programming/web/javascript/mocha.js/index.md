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

[Assert](https://nodejs.org/api/assert.html).

> You can also use [better-assert](https://github.com/tj/better-assert).
</div><div>

...
</div></div>

<hr class="sep-both">

## Testing requests with chai-http

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## To delete

<div class="row row-cols-md-2 mt-4"><div>

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

</div></div>