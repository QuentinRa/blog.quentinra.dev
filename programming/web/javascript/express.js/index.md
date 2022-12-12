# 📟 Express.js 📟

<div class="row row-cols-md-2"><div>

Express can be used to create websites or APIs.

* [Express.js documentation](https://expressjs.com/) and [examples](https://expressjs.com/en/starter/examples.html)
* [expressjs/generator](https://github.com/expressjs/generator)

```powershell
$ npx --yes --package express-generator express --force --no-view
$ npm audit fix --force
```
</div><div>

**Understand your generated project**

* ✨ Your server is created inside `/bin/www`. <small>You will most likely never have to edit this file.</small>
* 🍹 It will load routes your application `/app.js`. <small>You will add "routes" and "middlewares" here.</small>
* 🔥 Your routes are stored inside `/routes`.
* 💐 Your public files are stored inside `/public`.

If you are not familiar with routes, HTTP methods/responses codes... Then you should learn that first. [See HTTP protocol](/it/networking/protocols/index.md#-http---80-tcp).

</div></div>

<hr class="sep-both">

## Middlewares

<div class="row row-cols-md-2"><div>

In your **app.js** you should see a lot of `app.use(xxx)`. These are called middleware. A middleware is a function that will prepare the request (**req**)/response (**res**) for usage in routes later.

```javascript
app.use(function (req, res, next) {
    // ... do something ...
    next()
});
```

</div><div>

* ✨ Example: cookie parser

For instance, `app.use(cookieParser())` is a middleware that will parse cookies in the request, and store them in `req.cookies`.

* ✨ Example: adding headers

<details class="details-n">
<summary>CORS headers</summary>

```javascript
app.use(function (req, res, next) {
    // Allow any website (*) to use the API
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    next()
});
```
</details>

<details class="details-n">
<summary>Custom headers</summary>

```javascript
app.use(function (req, res, next) {
    res.setHeader('Access-Control-Expose-Headers', 'Custom-header');
    res.setHeader('Custom-header', 'value');
    next()
});
```
</details>

</div></div>

<hr class="sep-both">

## Routing

<div class="row row-cols-md-2"><div>

Then, we are adding "local" routers for each API route.

```bash
const usersRouter = require('./routes/users');
app.use('/users', usersRouter);
```

A "local" router is something like this.

```javascript
// ./routes/users
const express = require('express');
const router = express.Router();

// API Routes "/" matches "/users/"
// req = requester, res = response
router.get('/', (req, res) => {});
router.post('/', (req, res) => {});
// use can use dynamic routes with params
router.put('/:id', (req, res) => {});
router.patch('/:id', (req, res) => {});
router.delete('/:id', (req, res) => {});
// extracting params
router.delete('/:x1/:x2', (req, res) => {
  const {x1, x2} = req.params;
  // or use req.params.x1 / req.params.x2
})

module.exports = router;
```
</div><div>

Useful methods

```javascript
// get headers
req.get('header-name')
req.headers['header-name']

// get GET/POST params
req.query.key // GET param named "key"
req.body.key // POST param named "key"

// send something to the requester
res.send(something); // HTML, JSON, XML...
res.status(404).send(something); // ex: 404 HTTP code
res.render('index', { title: 'Title' }); // public/index.html

// redirect
res.redirect('URL');
```
</div></div>


<hr class="sep-both">

## Persistence

<div class="row row-cols-md-2"><div>

Adding a session (see [GitHub](https://github.com/expressjs/session))

```javascript
// add a middleware
const session = require('express-session');
app.use(session({
    resave: false,
    saveUninitialized: false,
    secret: 'something-random-and-secret'
}));

// later in the code
await req.session.regenerate(() => {}); // generate session
req.session.key = 'value'; // store a value
if (req.session.key) { /* ... */ } // use it
await req.session.destroy(() => {}) // destroy session
```
</div></div>