# Socket.io

<div class="row row-cols-md-2"><div>

[Socket.io](https://socket.io/) is a library that allow a server to do server-pull and server-push. **Server Push** means the server can send something to the client without the client being the one requesting it.

* [Documentation](https://socket.io/get-started/)
* [Examples](https://github.com/socketio/socket.io/tree/main/examples)

> Socket.io relies on websockets for Web Applications.
</div><div>

It's useful to

* 💐 Push a notification to the client
* ✨ Push a events to the client <small>(instead of querying the API periodically for updates, just listen for events=updates)</small>
* 🍹 Making chat applications

Or more generally, making real-time applications. The server can push data to the client without being requested (**server push**).
</div></div>

<hr class="sep-both">

## Basic usage

<div class="row row-cols-md-2"><div>

Socket.io is really easy to use.

* **Listen to an event**: `on("eventName", callback)`
* **Stop listening to an event**: `off("eventName")`
* **Stop listening to every event**: `off()`
* **Emit an event**: `emit("eventName", JSON_DATA)`
</div><div>

```javascript
// ex: node client listening to "event"
client.on("event", (data) => {
    // send a reply
    client.emit("event-ack", data)

    // stop listening to event
    client.off("event")
})
```
</div></div>

<hr class="sep-both">

## Express Node.js server

<div class="row row-cols-md-2 mt-4"><div>

This code is targeting Node.js applications running Express.js. You may use Socket.io with other libraries such as Angular...

```bash
$ npm i socket.io
```

In a project generated with express-generator, append to `bin/www`

```javascript
/**
* Create Socket.io listener
*/
app.io = require('socket.io')(server)
// you may remove this later
app.io.on('connection', () => {
    console.log('A new client connected to websockets')
})
```

<details class="details-e">
<summary>CORS</summary>

See [Handling CORS](https://socket.io/docs/v4/handling-cors/).

Example allowing any host to make requests.

```diff
- app.io = require('socket.io')(server)
+ app.io = require('socket.io')(server, {
+    cors: {
+        origin: "*"
+    }
+}
```
</details>
</div><div>

And in `app.js`, you must add a middleware

```javascript
app.use((req,res,next) => {
    req.io = () => (app.io);
    next();
});
```

Then, in any request, you can fetch `io` for `req`.

```javascript
router.post('/message', (req, res) => {
    req.io().emit('new-message', res.body)
});
```

There are many other alternatives, but I like this one because we are using a function, so we don't copy in every request the `io` object, and we can use it everywhere from the `req` object.
</div></div>

<hr class="sep-both">

## Node.js client

<div class="row row-cols-md-2"><div>

You could create a socket.io client to test your code

```bash
$ npm i socket.io-client
```
</div><div>

```javascript
const io = require("socket.io-client");
const client = io("http://localhost:3000");
client.on('connect', () => {
    console.log("Connected");
});
```
</div></div>