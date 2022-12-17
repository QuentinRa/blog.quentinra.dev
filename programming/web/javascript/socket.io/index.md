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

<hr class="sep-both">

## HTML client

<div class="row row-cols-md-2"><div>

You need to add the following script (version 4.5.3). See [cdnjs](https://cdnjs.com/libraries/socket.io).

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.3/socket.io.js" integrity="sha512-iWPnCISAd/J+ZacwV2mbNLCaPGRrRo5OS81lKTVPtRg1wGTC20Cfmp5Us5RcbLv42QLdbAWl0MI57yox5VecQg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
```
</div><div>

```javascript
const client = io("http://localhost:3000");
client.on('connect', () => {
    console.log("Connected");
});
```
</div></div>

<hr class="sep-both">

## Android client (kotlin)

<div class="row row-cols-md-2"><div>

You must add the library in `build.gradle`

```diff
dependencies {
    ...
+    implementation ('io.socket:socket.io-client:2.0.0') {
+        exclude group: 'org.json', module: 'json'
+    }
    ...
}
```

Then, let's create a handler for our Socket.io connection.

```kotlin
package xxx

import io.socket.client.IO
import io.socket.client.Socket
import java.net.URISyntaxException


object SocketIOHandler {
    private lateinit var _socket: Socket
    val socket: Socket
        get() = _socket

    fun init() {
        try {
            _socket = IO.socket("http://10.0.2.2:3000")
            _socket.connect()
        } catch (_: URISyntaxException) {}
    }

    fun dispose() {
        _socket.disconnect()
    }
}
```

</div><div>

In your Application, you will need to init and close socket.io client. If you don't have one, then create add it to the MANIFEST.

```diff
    <application
+        android:name=".MainApplication"
```

```kotlin
package xxx

import android.app.Application
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.ProcessLifecycleOwner
import xxx.SocketIOHandler

class MainApplication : Application(), DefaultLifecycleObserver {
override fun onCreate() {
        super<Application>.onCreate()
        ProcessLifecycleOwner.get().lifecycle.addObserver(this)
        SocketIOHandler.init()
    }

    override fun onDestroy(owner: LifecycleOwner) {
        super.onDestroy(owner)
        SocketIOHandler.dispose()
    }
}
```

Then, you're now ready. For instance, in your MainActivity.

```kotlin
SocketIOHandler.socket.on("event") {
    // fetch argument (use JSONArray for [])
    val json = it[0] as JSONObject
    // fetch values { key: value }
    val value = json.getString("key")
    val value = json.getJSONObject("key")
    // ...
}
```
</div></div>