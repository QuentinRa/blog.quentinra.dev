# Introduction

**[Updates notes](index.md)**

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

* [Example](base/example.md)
* [Dependencies](base/deps.md)
* [Scripts](base/scripts.md)

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

* [require](base/require.md) (import)
* [Using multiples files](base/exports.md)
* [Promises](base/promises.md)
* You might check [validator](https://www.geeksforgeeks.org/how-to-validate-data-using-validator-module-in-node-js/)
  to verify the submitted data
* check [nodemon](https://www.npmjs.com/package/nodemon),
  an utility restarting your program when you changed
  the code inside or it crashed.

Other notes

* [mongoDB](base/db/mongo.md)

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

<hr class="sl">

## Sources

* <https://nodejs.org/en/download/>
* <https://docs.npmjs.com/downloading-and-installing-node-js-and-npm>
* <https://nodejs.dev/learn/the-package-json-guide>
* <https://nodejs.dev/learn/semantic-versioning-using-npm>