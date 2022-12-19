# Introduction

<hr class="sr">

## Installation

You must install Node and a package manager. I'm using
**npm**.

* [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
* `npm -v`

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

## Sources

* <https://nodejs.org/en/download/>
* <https://docs.npmjs.com/downloading-and-installing-node-js-and-npm>
* <https://nodejs.dev/learn/the-package-json-guide>
* <https://nodejs.dev/learn/semantic-versioning-using-npm>