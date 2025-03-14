# Webpack

[![javascript_webpack](../../../../cybersecurity/_badges/rootme/web_client/javascript_webpack.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Webpack)

<div class="row row-cols-lg-2"><div>

[webpack](https://github.com/webpack/webpack) <small>(65.1k ⭐)</small> is a popular tool to merge javascript code into a single file called bundle. It's not specific to JavaScript.

Refer to the [Official Documentation](https://webpack.js.org/) for details.

Webpack generates a file called **xxx.js.map** for debugging purposes during non-production builds. This file should not be uploaded in production as it contains code comments and commented out code.
</div><div>

You can try [webcrack](https://github.com/j4k0xb/webcrack) <small>(1.3k ⭐)</small> to unpack a bundle.

```shell!
$ npm install -g webcrack
```

You can try [shuji](https://github.com/paazmaya/shuji) <small>(1.0k ⭐)</small> to unpack a bundle.

```shell!
$ npm install --global shuji
$ shuji example.js.map -o output
```

You can also try [WebDumper](https://github.com/EllyMandliel/WebDumper) <small>(0.2k ⭐, 2021 🪦)</small>.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Plugins

* [Obsolete Webpack Plugin](https://github.com/ElemeFE/obsolete-webpack-plugin)

Samples

```js!
$ webpack --config webpack/webpack.prod.js
```
</div><div>

</div></div>