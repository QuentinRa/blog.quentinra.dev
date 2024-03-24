# AV Evasion

<div class="row row-cols-lg-2"><div>

...
</div><div>
</div></div>

<hr class="sep-both">

## Code Obfuscation

[![javascriptdeobfuscation](../../_badges/htb/javascriptdeobfuscation.svg)](https://academy.hackthebox.com/course/preview/javascript-deobfuscation)
[![javascript_obfuscation_1](../../_badges/rootme/web_client/javascript_obfuscation_1.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Obfuscation-1)
[![javascript_obfuscation_2](../../_badges/rootme/web_client/javascript_obfuscation_2.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Obfuscation-2)
[![javascript_obfuscation_3](../../_badges/rootme/web_client/javascript_obfuscation_3.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Obfuscation-3)
[![javascript_native_code](../../_badges/rootme/web_client/javascript_native_code.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Native-code)
[![ast_deobfuscation](../../_badges/rootme/web_client/ast_deobfuscation.svg)](https://www.root-me.org/en/Challenges/Web-Client/AST-Deobfuscation)

<div class="row row-cols-lg-2"><div>

Code obfuscation is an automated process to make the code less-readable for humans. A simple example would be by replacing variables names with less readable names such as `_0x565`.

Code obfuscation doesn't impact the program functionality, but it may impact its performance: obfuscated code is usually slower.

#### UPX-packed Malware

Ultimate Packer for eXecutables (UPX) is a popular packer for malware.

```ps
$ upx -d -o unpacked_xxx.exe xxx.exe
```

#### PHP Obfuscation

You can un-obfuscate PHP code with [unphp](https://www.unphp.net/).
</div><div>

#### Javascript Obfuscation

A few obfuscators for JavaScript:

* [beautifytools](http://beautifytools.com/javascript-obfuscator.php)
* [obfuscator.io](https://obfuscator.io/)
* [jjencode](https://utf-8.jp/public/jjencode.html)
* [aaencode](https://utf-8.jp/public/aaencode.html)

You may try [unpacker](https://matthewfl.com/unPacker.html) to unpack code while you can try [relative.im](https://deobfuscate.relative.im/) or [deobfuscate.io](https://deobfuscate.io/)/[obf-io](https://obf-io.deobfuscate.io/) to undo simple obfuscation.

Native code or using a [abstract syntax tree](https://astexplorer.net/) are also possible. You can decode an AST using [escodegen](https://github.com/estools/escodegen) <small>(2.6k ⭐)</small>.

```js!
const { generate } = require('escodegen');
const ast = {}; // add the JSON AST here
const generatedCode = generate(ast);
console.log(generatedCode);
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [DOSfuscation](https://github.com/danielbohannon/Invoke-DOSfuscation)

```ps
Invoke-DOSfuscation> SET COMMAND type <path>
Invoke-DOSfuscation> encoding
Invoke-DOSfuscation\Encoding> 1
```
</div><div>
</div></div>