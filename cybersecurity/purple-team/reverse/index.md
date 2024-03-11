# Reverse Engineering

<div class="row row-cols-lg-2"><div>

Reverse engineering is the process of analyzing a program, or system to understand its structure, function, and behavior.

It often means getting back the original code/system using disassembling, decompiling, or similar methods.

It can be used to understand how a malware works 🛡️ or to find vulnerabilities in a program/system in a black-box assessment 💥.
</div><div>

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

</div><div>

#### Java jd - Decompiler

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![blocky](../../_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)

You can use [jd-gui](https://github.com/java-decompiler/jd-gui) <small>(13.2k ⭐)</small> to reverse a Java application. Run `jd-gui`, and oad the JAR in it. You can then either:

* Explore the reversed sources from `jd-gui`
* Use `File> Save all sources` and read/modify them in your editor

#### Java - Other Decompilers

Other well-known decompilers:

* [Recaf](https://github.com/Col-E/Recaf) <small>(5.4k ⭐)</small>
* [JetBrains IntelliJ](https://github.com/JetBrains/intellij-community) <small>(16.2k ⭐)</small>
</div></div>

<hr class="sep-both">

## .NET Reverse Engineering

[![chrome](../../_badges/thm-p/chrome.svg)](https://tryhackme.com/room/chrome)
[![ctfcollectionvol1](../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)
[![pe_dotnet_0_protection](../../_badges/rootme/cracking/pe_dotnet_0_protection.svg)](https://www.root-me.org/en/Challenges/Cracking/PE-DotNet-0-protection)
[![pe_dotnet_basic_anti_debug](../../_badges/rootme/cracking/pe_dotnet_basic_anti_debug.svg)](https://www.root-me.org/en/Challenges/Cracking/PE-DotNet-Basic-Anti-Debug)

<div class="row row-cols-lg-2"><div>

#### De4Dot - .NET Decompiler

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [de4dot](https://github.com/de4dot/de4dot) <small>(6.6k ⭐, 2020 🪦)</small> to reverse your binary. On Windows, drag and drop your binary onto the de4dot executable.

<br>

#### dnSpy - .NET Debug/Editor

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [dnSpy](https://github.com/dnSpy/dnSpy) <small>(24.8k ⭐, 2020 🪦)</small> to explore .NET source code.

<br>

#### dotPeek - .NET Decompiler/Editor

You can use [JetBrains dotPeek](https://www.jetbrains.com/decompiler/) <small>(paid 💵)</small> to reverse your binary and explore the source code. Opening the file will automatically load the .NET solutions contained in the executable.
</div><div>

#### ILSpy - .NET Decompiler/Editor

[ILSpy](https://github.com/icsharpcode/ILSpy) <small>(19.8k ⭐)</small> is the most popular open-source .NET decompiler. It can be integrated in editors such as [VSCode](https://code.visualstudio.com/) or standalone editors.

On Linux, you can use the [AvaloniaILSpy](https://github.com/icsharpcode/AvaloniaILSpy) <small>(1.4k ⭐)</small> port.

```shell!
$ cd /tmp
$ # download a release at https://github.com/icsharpcode/AvaloniaILSpy/releases
$ unzip Linux.x64.Release.zip && unzip ILSpy-linux-x64-Release.zip
$ sudo mv artifacts/linux-x64/ /opt/AvaloniaILSpy
$ rm -rf Linux.x64.Release.zip ILSpy-linux-x64-Release.zip artifacts # cleanup
$ sudo ln -s /opt/AvaloniaILSpy/ILSpy /usr/local/bin/ILSpy
$ ILSpy # run
```

Opening the executable will automatically load its .NET solutions. You can save an entire reversed solution or specific files by right-clicking on the target you want to save and selecting 'Save Code.'
</div></div>

<hr class="sep-both">

## Windows Binaries

<div class="row row-cols-lg-2"><div>

#### Windows x64dbg debugger

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![introduction_to_malware_analysis](../../_badges/htb/introduction_to_malware_analysis.svg)](https://academy.hackthebox.com/course/preview/introduction-to-malware-analysis)

You can use [x64dbg](https://github.com/x64dbg/x64dbg) <small>(42.5k ⭐)</small> to debug binaries.

* You can navigate to options to define the breakpoints. For instance, uncheck everything except Exit Breakpoint.
* The memory map tab can be used to find stuff like [memory-mapped files](https://en.wikipedia.org/wiki/Memory-mapped_file) <small>(a file mapped to a memory region like a buffer)</small>.
  * Double-click on an entry to see its bytes
  * You may recognize a file from the magic code bytes
  * Right-click on an address to dump its contents to a file
* Use 'Search for > Current Module > String references' to see strings and their address. You can double-click on an address to navigate to it <small>(see also: Right-click > 'Toggle Breakpoint.')</small>
* Place the cursor on an instruction, and press 'Spacebar' to edit it.
* Use CTRL+P to save the patched instructions.

➡️ See also: [x64dbg unpack malware](https://www.varonis.com/blog/x64dbg-unpack-malware) and [OllyDbg](https://github.com/x64dbg/OllyDbg).
</div><div>
</div></div>

<hr class="sep-both">

## Linux Binaries

[![getting_started](../../_badges/htb-c/getting_started.svg)](https://app.hackthebox.com/challenges/getting-started)
[![questionnaire](../../_badges/htb-c/questionnaire.svg)](https://app.hackthebox.com/challenges/Questionnaire)
[![reg](../../_badges/htb-c/reg.svg)](https://app.hackthebox.com/challenges/Reg)
[![elf_x86_0_protection](../../_badges/rootme/cracking/elf_x86_0_protection.svg)](https://www.root-me.org/en/Challenges/Cracking/ELF-x86-0-protection)
[![elf_x86_basic](../../_badges/rootme/cracking/elf_x86_basic.svg)](https://www.root-me.org/en/Challenges/Cracking/ELF-x86-Basic)

<div class="row row-cols-lg-2"><div>

#### Linux GDB Disassembly

[![stack_based_buffer_overflows_linux_x86](../../_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)
[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [peda](https://github.com/longld/peda) and [GDB](/programming-languages/low-level/compilers/gnu/gdb.md).

```shell!
$ git clone https://github.com/longld/peda.git ~/peda
$ echo "source ~/peda/peda.py" >> ~/.gdbinit
$ echo "set disassembly-flavor intel" >> ~/.gdbinit
$ gdb -q xxx.bin
(gdb) disas main
(gdb) # refer to GDB documentation
(gdb) run
```

#### Linux Tracers

[![mustacchio](../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)

Linux commands [strace](https://www.man7.org/linux/man-pages/man1/strace.1.html) and [ltrace](https://www.man7.org/linux/man-pages/man1/ltrace.1.html) are very helpful to identify system and library calls in a program, which is helpful to reverse it.

```shell!
$ strace xxx.bin
$ ltrace xxx.bin
```
</div><div>

#### Linux Radare Disassembly

[Radare](https://github.com/radareorg/radare2) <small>(19.2k ⭐)</small> is similar to GDB, but it somewhat easier to use if we only need to disassemble the code.

```shell!
$ rabin2 -I xxx.bin # get information
$ rabin2 -z xxx.bin # list strings
$ r2 -A xxx.bin     # disassemble
(r2) pdf @main
```

#### Boomerang

[boomerang](https://github.com/BoomerangDecompiler/boomerang) <small>(0.3k ⭐)</small> that is somewhat able to reverse x86 binaries in an unreadable uncompilable C file.

<details class="details-n">
<summary>Docker Installation</summary>

Save the code below in a dockerfile and run `docker build -t boomrangcli:latest .` to build the docker image.

```dockerfile!
FROM ubuntu:22.04

# From https://github.com/BoomerangDecompiler/boomerang#building-on-linux
# [CHANGE] qt5-default => libqt5core5a libqt5gui5 libqt5widgets5 qtbase5-dev
RUN apt-get update && \
    apt-get install -y git build-essential cmake \
    qtbase5-dev libqt5core5a libqt5gui5 libqt5widgets5 \
    libcapstone-dev flex bison

# [CHANGE] Used /opt
WORKDIR /opt
RUN git clone https://github.com/BoomerangDecompiler/boomerang.git
WORKDIR /opt/boomerang/build

RUN cmake .. && make -j$(nproc) && make install

# Remove the build folder
RUN rm -rf /opt/boomerang

# Don't run the tool as root
RUN useradd -ms /usr/sbin/nologin boomerang
WORKDIR /builds/
RUN chown -R boomerang:boomerang /builds/
USER boomerang

ENTRYPOINT ["/usr/local/bin/boomerang-cli"]
```

For instance to decompile `ch1.bin`:

```shell!
$ docker run -it -v $(pwd):/builds boomrangcli:latest ch1.bin
```
</details>
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

Analysis

* [Detect-It-Easy](https://github.com/horsicq/Detect-It-Easy) (target insight)
* [CFF explorer](https://ntcore.com/?page_id=388)
* Debug: [mona](https://github.com/corelan/mona)
</div><div>

* [Bashfuscator](https://github.com/Bashfuscator/Bashfuscator)

```ps
$ bashfuscator -c 'cat /etc/passwd'
$ bashfuscator -c 'cat /etc/passwd' -s 1 -t 1 --no-mangling --layers 1
```

Common tools

* [Ghidra](https://www.ghidra-sre.org/)
* [IDA](https://hex-rays.com/ida-pro/) (ex: Linux disassembly)
* [boomerang](https://github.com/BoomerangDecompiler/boomerang) (Linux X86 Binary Decompiler)
* [jadx](https://github.com/skylot/jadx) (DEX/APK to Java)
* [frida](https://frida.re/)
* [Rizin](https://github.com/rizinorg/rizin) and [cutter](https://github.com/rizinorg/cutter)
</div></div>