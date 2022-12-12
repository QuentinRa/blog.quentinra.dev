# 🌟 Testing with mocha.js 🌟

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