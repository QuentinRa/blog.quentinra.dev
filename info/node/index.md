# Introduction

This course will introduce **Node.js**,

* creating an API using **Node.js**
* using **WebSockets** with **socket.io**
* using **electron** to write **applications**
* and maybe using **discord.js**

Also, you may use **Node.js** with PHP or instead
of PHP to handle the server-side logic. I think the
main difference is that after sending the page to the
client, you can continue interacting with the page
in Node. This won't be covered for now.

<hr class="sr">

## Installation

You must install Node and a package manager. I'm using
**npm**.

* [Node](https://nodejs.org/en/download/)
* [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
* you may look at [nvm](https://github.com/nvm-sh/nvm)
  to install both like
  [nvm for windows](https://github.com/coreybutler/nvm-windows/releases)
  but I'm personally not using nvm on Windows

Run ``node -v`` and `npm -v` if you want to check if
your installation is successful.

<hr class="sl">

## package.json

Starting a new project in Node means calling
``npm init``. It will ask you some information to
generate a ``package.json``. This file will be used
to declare the library that you will use for your
project and so on.

Some notes

* [Example](node/example.md)
* [Dependencies](node/deps.md)
* [Scripts](node/scripts.md)

Once you defined your package.json, you need to generate
the ``package-lock.json`` by installing the dependencies.

* ``npm install`` or ``npm i``
* run ``npm ci`` if you already got a ``package-lock.json``,
* ``npm update`` will update dependencies

<hr class="sr">

## Start using Node

Well to be honest, you got almost everything you needed
to know. You will then have to write either **JavaScript**
or **TypeScript** (a sort of improved JavaScript, creating
a .js file when compiled).

You run a script using ``node my_script.js``. Inside
the script

* [require](node/require.md) (import)
* [Using multiples files](node/exports.md)
* [Promises](node/promises.md)
* You might check [validator](https://www.geeksforgeeks.org/how-to-validate-data-using-validator-module-in-node-js/)
  to verify the submitted data
* check [nodemon](https://www.npmjs.com/package/nodemon),
  an utility restarting your program when you changed
  the code inside or it crashed.

Other notes

* [mongoDB](node/db/mongo.md)

<hr class="sl">

## electron

electron is a js framework allowing you to write a desktop
app in html/css/js (even typescript, react, boostrap, ...).
In fact, electron is loading your code in a
chromium browser so you can use features like
``CTRL-SHIFT-I`` to open the console.

Applications like discord or MongoDBCompass were
made using electron.

There are a lot of release so electron is changing
quite a lot, when I made my app I was in electron
12 but I didn't use any of the latest security practices.
You should check these before you start

* [my project](https://github.com/lgs-games/prim/tree/master/version_js), I may not
  be secure and I'm using a lot of deprecated things but the project is not intended
  to be secure (for now at least) and the code is quite easy to understand
  if you are starting learning electron
* [secure electron template](https://github.com/reZach/secure-electron-template)
* [simple electron template](https://github.com/electron/electron-quick-start)
* [examples](https://github.com/hokein/electron-sample-apps)
* [4 examples](https://github.com/akabekobeko/examples-electron)

If i were to do something clean, I would start using
the secure electron template, removing everything
that I won't use (such as react because I'm a boostrap
enjoyer for now). Once I'm done, then I would actually
start coding, starting with making 
[this](https://github.com/binaryfunt/electron-seamless-titlebar-tutorial)
working in the template.

* [My notes about electron](electron/notes.md)
* [electron reference](electron/ref.md)

<hr class="sr">

## API

You can make an api easily, simply create an
``express`` app and listen to the requests (get/post).

Simply write 

```js
const app = require("express")();
const API_PORT = process.env.PORT || 8080
app.set('port', API_PORT);
server.listen(API_PORT, () => console.log(`Server running on port ${API_PORT}`));
```

Then the code before the listen is your API code,
calls like these

```js
// example: code for http://localhost/
app.get("/", (req, res) => {
  // 200 = OK
  let code = 2020;
  // body
  // a json object (for instance) or a string / xml / ...
  let body = {}
  res.status(code).send(body);
});

// example: code for http://localhost/endpoint?param=value
app.get("/endpoint", async (req, res) => {
    if ( req.query.param !== undefined ) {
        let param = req.query.param;
        // ... code ...
        // sending a file
        // 200: OK implicit
        res.sendFile("./index.html")
    } else {
        // ... code ...
      res.status(404).sendFile("./error.html")
    }
});

// you can do post requets too
app.post('/setting/:part1/:part2', (request, reply) => {
  const {part1, part2} = request.params;
  // ...
}
```

<hr class="sl">

## socket.io

If you are planning to make a real-time application like
a tchat, then you should use WebSockets. [socket.io](https://socket.io/)
is a library helping you handling those. It's like Sockets
in other application, you would rather create a connection
and send only data rather than both sending header + data
each time you want to send something.

````js
// in the server
const app = require("express")();
const port = process.env.PORT || 3000;
// http only
const server = require("http").createServer(app);
const io = require('socket.io')(server);

server.listen(port, () => { console.log('Server listening at port %d', port); });

io.on('connect', (socket) => {
  console.log(`new connection ${socket.id}`);

  socket.on('command', (arg, cb) => {})
  
  // other "on" for other commands
}
````

In the client, you are gonna create a socket with
the server. Then each time you can to trigger a "on"
on the server, then call ``socket.emit("event", args)``
with args the argument. The last one is usually a function
called ``callback`` that the server will call with the
result.

You may also add listeners ("on") in the client
just in case the server emit something.

Well the [examples](https://github.com/socketio/socket.io/tree/master/examples)
will be more helpful and you should also
check the [documentation](https://socket.io/get-started/).

<hr class="sr">

## Sources

* <https://nodejs.org/en/download/>
* <https://docs.npmjs.com/downloading-and-installing-node-js-and-npm>
* <https://nodejs.dev/learn/the-package-json-guide>
* <https://nodejs.dev/learn/semantic-versioning-using-npm>