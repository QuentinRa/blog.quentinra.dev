# Webpack

[![javascript_webpack](../../../../cybersecurity/_badges/rootme/web_client/javascript_webpack.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Webpack)

<div class="row row-cols-lg-2"><div>

[webpack](https://github.com/webpack/webpack) <small>(65.1k ⭐)</small> is a popular tool to merge javascript code into a single "bundle" file often called `<scriptname>.js.map`.

* The `[.map]` file contains code comments and commented out code
* The `[.map]` file should not be exposed on production instances
* The bundled `[.js]` expose the `[.map]` filename with the comment `sourceMappingURL=` at the end of the file.

⚠️ Webpack optimize and minify the code. If it's not used, it's removed. Functions may be inlined if they are only used once.
</div><div>

To compile a bundle using webpack, you can use:

```ps
$ webpack --config webpack/webpack.prod.js
```

Refer to the [Official Documentation](https://webpack.js.org/) for details.
</div></div>

<hr class="sep-both">

## WebPack — Overview

<div class="row row-cols-lg-2"><div>

A production configuration should not include `devtool`.

```ps
$ cat webpack.prod.js
```

```js!
module.exports = {
  entry: './main.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'assets/js/'),
    sourceMapFilename: '[file].map',
  },
  devtool: 'source-map', // ⚠️ vulnerable
  mode: 'production',
};
```
</div><div>
</div></div>

<hr class="sep-both">

## WebPack — Website Exploitation

<div class="row row-cols-lg-2"><div>

#### WebPack Exploitation — Exposed SourceMap

You can try [webcrack](https://github.com/denandz/sourcemapper) <small>(1.1k ⭐)</small> to unpack a bundle.

```
$ sourcemapper -output sources -url example.js.map
```

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
</div><div>
</div></div>