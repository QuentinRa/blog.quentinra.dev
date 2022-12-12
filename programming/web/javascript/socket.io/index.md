# socket.io

<div class="row row-cols-md-2"><div>

[Socket.io](https://socket.io/) is a library that allow a server to do server-pull and server-push. **Server Push** means the server can send something to the client without the client being the one requesting it. It's useful to

* 💐 Push a notification to the client
* ✨ Push a events to the client <small>(instead of querying the API periodically for updates, just listen for events=updates)</small>
* 🍹 Making chat applications
* Or more generally, making real-time applications

See the [examples](https://github.com/socketio/socket.io/tree/main/examples) and the [documentation](https://socket.io/get-started/).

> Socket.io relies on websockets for Web Applications.

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

And in `app.js`, you must add a middleware

```
app.use((req,res,next) => {
    req.io = () => (app.io);
    next();
});
```
</div><div>

You could create a socket.io client to test your code

```bash
$ npm i socket.io-client
```

```javascript
const io = require("socket.io-client");
const client = io("http://localhost:3000");
client.on('connect', () => {
    console.log("Connected");
});
```

Socket.io is really easy to use.

* **Listen to an event**: `on("eventName", callback)`
* **Stop listening to an event**: `off("eventName")`
* **Stop listening**: `off()`
* **Emit an event**: `emit("eventName", JSON_DATA)`

Example on your express server

```javascript
router.post('/message', (req, res) => {
    req.io().emit('new-message', res.body)
});
```
</div></div>