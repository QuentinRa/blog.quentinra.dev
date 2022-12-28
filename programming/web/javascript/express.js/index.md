# 📟 Express.js 📟

<div class="row row-cols-md-2"><div>

Express can be used to create websites or APIs.

* [Express.js documentation](https://expressjs.com/) and [examples](https://expressjs.com/en/starter/examples.html)
* [expressjs/generator](https://github.com/expressjs/generator)

```powershell
$ npx --yes --package express-generator express --force --no-view
$ npm install
$ npm audit fix --force
```

➡️ Don't forget to add a [.gitignore](/it/dev/git-project/index.md#-gitignore), and maybe a linter too.
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

In **app.js** you should see a lot of `app.use(xxx)`. These are called middleware. A middleware is a function that will prepare the request (**req**) or the response (**res**) for usage in routes later.

```javascript
app.use(function (req, res, next) {
    // ... do something ...
    next()
});
```

> ➡️ It's useful to know if there is some code you want to execute for every/some requests.

</div><div>

* ✨ Example: cookie parser

For instance, `app.use(cookieParser())` is a middleware that will parse cookies in the request, and store them in `req.cookies`.

* ✨ Example: adding headers

<details class="details-n">
<summary>CORS headers</summary>

See also [Express.js/cors middleware](https://github.com/expressjs/cors).

```javascript
const cors = require('cors');
app.use(
    cors({
        origin: 'http://localhost', // ex: allow localhost
        methods: ["GET", "POST", "PATCH", "PUT", "OPTIONS", "HEAD"],
        allowedHeaders: ['X-Requested-With', 'content-type']
    })
);
```

Allowing browsers to fetch cookies

```diff
methods: [...],
+ credentials: true,
```

If you want to use `origin: '*'` (any) with credentials

```diff
- origin: '*',
+ origin: [ /.*/ ],
...
credentials: true,
```

Allowing multiple origins <small>(you can use regexes...)</small>

```diff
- origin: 'URL',
+ origin: ['http://localhost', 'http://127.0.0.1' ],
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

## Routers

<div class="row row-cols-md-2"><div>

In **app.js**, you will also define routes. To make things cleaner, we are moving routes to "local" routers in `./routes`. In **app.js**, we are importing (require) local routers, and associating them with an API endpoint.

```bash
const usersRouter = require('./routes/users');
app.use('/users', usersRouter);
```

In the scenario above, any requests to the endpoint `/users` will be handled by `usersRouter`. 

⚠️It's important to note that inside a "local" router, routes will be declared relatively to this endpoint. For instance, `/` would be `/users/`.

> Routing should be done **AFTER** every calling every middleware.
</div><div>

A "local" router is something like this.

```javascript
// ./routes/users
const express = require('express');
const router = express.Router();

// router.get => GET
// / => /users/
// req => the request
// res => the response
router.get('/', (req, res) => {
    // ... code ...
    // send a response
});
// add more routes

module.exports = router;
```
</div></div>

<hr class="sep-both">

## Routing

<div class="row row-cols-md-2"><div>

You can use every HTTP methods

```javascript
router.get('/', (req, res) => {});
router.post('/', (req, res) => {});
router.put('/', (req, res) => {});
router.patch('/', (req, res) => {});
router.delete('/', (req, res) => {});
```

You can also declare "dynamic" routes. For instance, a route `/:id` will take any value after the `/` and store it inside `id`.

```javascript
router.delete('/:id', (req, res) => {
    const id = req.params.id
    // ...
})
// extracting params
router.delete('/:x1/:x2', (req, res) => {
  const {x1, x2} = req.params;
  // or use req.params.x1 / req.params.x2
})
```

> You can use regexes inside your dynamic routes! See [Route Paths](https://expressjs.com/en/guide/routing.html#route-paths).

</div><div>

Useful methods on **req**.

```javascript
// get headers
req.get('header-name')
req.headers['header-name']

// get GET/POST params
req.query.key // GET param named "key"
req.body.key // POST param named "key"
```

Useful methods on **res**.

```javascript
// send something to the requester
res.send(something); // HTML, JSON, XML...
res.status(404).send(something); // ex: 404 HTTP code
res.render('index', { title: 'Title' }); // public/index.html

// redirect
res.redirect('URL');
```
</div></div>

<hr class="sep-both">

## Express handle login

<div class="row row-cols-md-2"><div>

You may want to use cookies to store some data, such as the logged user. We use a special cookie called session for this purpose. A session is a file on the server in which we can store data.

The client will store and return us in every request the **session-id**, which will allow us to load the matching session data.

See [GitHub](https://github.com/expressjs/session) or [session](https://expressjs.com/en/resources/middleware/session.html).

```bash
$ npm i express-session
```

```javascript
const session = require('express-session');
/* ... */
app.use(session({
    resave: false,
    saveUninitialized: false,
    secret: 'something-random-and-secret'
}));
```
</div><div>

* **Create a session**

```javascript
await req.session.regenerate(() => {}); // generate session
```

* **Store data inside the session**

```javascript
req.session.key = 'value'; // store a value
```

* **Read data inside the session**

```javascript
const value = req.session.key
```

* **Delete a session**

```javascript
await req.session.destroy(() => {}) // destroy session
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Express
  * [Stripe](https://www.youtube.com/watch?v=rPR2aJ6XnAc)
  * Express for Websites
* `res.json()`
* `res.end()`
* [typescript+express](https://blog.logrocket.com/how-to-set-up-node-typescript-express/)
</div><div>
</div></div>