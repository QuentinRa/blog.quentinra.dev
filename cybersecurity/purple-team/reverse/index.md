# Reverse Engineering

<div class="row row-cols-lg-2"><div>

Reverse engineering is the process of analyzing a program, or system to understand its structure, function, and behavior.

It often means getting back the original code/system using disassembling, decompiling, or similar methods.

It can be used to understand how a malware works 🛡️ or to find vulnerabilities in a program/system in a black-box assessment 💥.
</div><div>

[![mustacchio](../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)

For simple programs, we might be able to get the information we need using the commands below:

* `strace`: see every system call
* `strings`: extract every readable string, may not be installed
</div></div>

<hr class="sep-both">

## Java Reverse Engineering

<div class="row row-cols-lg-2"><div>

#### JAR application

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can extract a JAR archive using archive tools or:

```shell!
$ jar xf xxx.jar
```

You can also create a JAR archive using archive tools or:

```shell!
$ jar -cvf ../xxx.war *
$ jar -cmf ./META-INF/MANIFEST.MF ../xxx.jar *
```

If you plan to edit the JAR, you may have to remove every checksum from the MANIFEST.MF along with `.RSA/.SF` to by-pass integrity checks. ⚠️ Note that MANIFEST.MF must ends with a blank line.
</div><div>

#### Java Decompiler

You can use [jd-gui](https://github.com/java-decompiler/jd-gui) <small>(13.2k ⭐)</small> to reverse a Java application. Run `jd-gui`, and oad the JAR in it. You can then either:

* Explore the reversed sources from `jd-gui`
* Use `File> Save all sources` and read/modify them in your editor

Before you modify a file, you need to create a raw copy in which you will inject `.class` before bundling them back to a JAR:

```shell!
$ mkdir raw && cd raw
$ jar xvf ../xxx.jar && cd ..
```

Now, you can edit a file and transfer its compiled `.class` to "raw": 

```shell!
$ javac -cp xxx.jar source_code/path/to/file.java
$ cp -r source_code/path/to/*.class raw/path/to/file
```

Once you are done, pack "raw" back to a JAR:

```shell!
$ jar -cmf raw/META-INF/MANIFEST.MF xxx.jar raw
```
</div></div>

<hr class="sep-both">

## .NET Reverse Engineering

<div class="row row-cols-lg-2"><div>

#### .NET De4Dot - Reverse

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [de4dot](https://github.com/de4dot/de4dot) <small>(6.6k ⭐, 2020 🪦)</small> to reverse your binary. On Windows, drag and drop your binary onto the de4dot executable.

<br>

#### .NET dnSpy - Debug/Editor

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [dnSpy](https://github.com/dnSpy/dnSpy) <small>(24.8k ⭐, 2020 🪦)</small> to explore .NET source code.
</div><div>
</div></div>

<hr class="sep-both">

## Debugging Analysis

<div class="row row-cols-lg-2"><div>

#### Windows x64dbg debugger

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [x64dbg](https://github.com/x64dbg/x64dbg) <small>(42.5k ⭐)</small> to debug binaries.

* You can navigate to options to define the breakpoints. For instance, uncheck everything except Exit Breakpoint.
* The memory map tab can be used to find stuff like [memory-mapped files](https://en.wikipedia.org/wiki/Memory-mapped_file) <small>(a file mapped to a memory region like a buffer)</small>.
  * Double-click on an entry to see its bytes
  * You may recognize a file from the magic code bytes
  * Right-click on an address to dump its contents to a file

➡️ See also: [x64dbg unpack malware](https://www.varonis.com/blog/x64dbg-unpack-malware).
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
</div><div>

#### Javascript Obfuscation

A few obfuscators for JavaScript:

* [beautifytools](http://beautifytools.com/javascript-obfuscator.php)
* [obfuscator.io](https://obfuscator.io/)
* [jjencode](https://utf-8.jp/public/jjencode.html)
* [aaencode](https://utf-8.jp/public/aaencode.html)

You may try [unpacker](https://matthewfl.com/unPacker.html) to unpack code while you can try [relative.im](https://deobfuscate.relative.im/) or [deobfuscate.io](https://deobfuscate.io/) to undo simple obfuscation.

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

* Minify code to make it less readable
* Use of encoding
* `Get-FileMetaData xxx.dll`
* `strace/strings` [link](https://jvns.ca/strace-zine-v3.pdf)
* [scoding.de](https://scoding.de/uploads/r2_cs.pdf)
* [DOSfuscation](https://github.com/danielbohannon/Invoke-DOSfuscation)

```ps
Invoke-DOSfuscation> SET COMMAND type <path>
Invoke-DOSfuscation> encoding
Invoke-DOSfuscation\Encoding> 1
```
</div><div>

* [Bashfuscator](https://github.com/Bashfuscator/Bashfuscator)

```ps
$ bashfuscator -c 'cat /etc/passwd'
$ bashfuscator -c 'cat /etc/passwd' -s 1 -t 1 --no-mangling --layers 1
```
</div></div>