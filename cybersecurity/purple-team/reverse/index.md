# Reverse Engineering

<div class="row row-cols-lg-2"><div>

Reverse engineering is the process of analyzing a program, or system to understand its structure, function, and behavior.

It often means getting back the original code/system using disassembling, decompiling, or similar methods.

It can be used to understand how a malware works 🛡️ or to find vulnerabilities in a program/system in a black-box assessment 💥.

**Practice**

* [crackmes](https://crackmes.one/) <small>(binaries to crack, 👻)</small>
</div><div>

For simple programs, we might be able to get the information we need using [tracers](#linux-tracers) such as:

* `strace`: see every system call
* `strings`: extract every readable string, may not be installed

For a preliminary analysis of your executable:

* Using the `file` command on Linux

```shell!
$ file some_executable
```

* Using [Detect-It-Easy](https://github.com/horsicq/Detect-It-Easy) on Windows
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

If you plan to edit the JAR, you may have to remove every checksum from the MANIFEST.MF along with `.RSA/.SF` to bypass integrity checks. ⚠️ Note that MANIFEST.MF must ends with a blank line.

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

You can use [jd-gui](https://github.com/java-decompiler/jd-gui) <small>(13.4k ⭐)</small> to reverse a Java application. Run `jd-gui`, and oad the JAR in it. You can then either:

* Explore the reversed sources from `jd-gui`
* Use `File> Save all sources` and read/modify them in your editor

#### Java - Other Decompilers

Other well-known decompilers:

* [Recaf](https://github.com/Col-E/Recaf) <small>(5.5k ⭐)</small>
* [JetBrains IntelliJ](https://github.com/JetBrains/intellij-community) <small>(16.4k ⭐)</small>
</div></div>

<hr class="sep-both">

## .NET Reverse Engineering

[![adventofcyber2](../../_badges/thm/adventofcyber2/day18.svg)](https://tryhackme.com/room/adventofcyber2)
[![chrome](../../_badges/thm-p/chrome.svg)](https://tryhackme.com/room/chrome)
[![ctfcollectionvol1](../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)
[![pe_dotnet_0_protection](../../_badges/rootme/cracking/pe_dotnet_0_protection.svg)](https://www.root-me.org/en/Challenges/Cracking/PE-DotNet-0-protection)
[![pe_dotnet_basic_anti_debug](../../_badges/rootme/cracking/pe_dotnet_basic_anti_debug.svg)](https://www.root-me.org/en/Challenges/Cracking/PE-DotNet-Basic-Anti-Debug)
[![godot_0_protection](../../_badges/rootme/cracking/godot_mono.svg)](https://www.root-me.org/en/Challenges/Cracking/Godot-Mono)

You can work on reversing .NET executable and DLL files using the following tools...

<div class="row row-cols-lg-2"><div>

#### De4Dot - .NET Decompiler

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [de4dot](https://github.com/de4dot/de4dot) <small>(6.7k ⭐, 2020 🪦)</small> to reverse your binary. On Windows, drag and drop your binary onto the de4dot executable.

<br>

#### dnSpy - .NET Debug/Editor

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [dnSpy](https://github.com/dnSpy/dnSpy) <small>(25.2k ⭐, 2020 🪦)</small> to explore .NET source code.

<br>

#### dotPeek - .NET Decompiler/Editor

[![adventofcyber2](../../_badges/thm/adventofcyber2/day18.svg)](https://tryhackme.com/room/adventofcyber2)

You can use [JetBrains dotPeek](https://www.jetbrains.com/decompiler/) <small>(free 🐲)</small> on Windows to reverse your binary and explore the source code. Opening the file will automatically load the .NET solutions contained in the executable.
</div><div>

#### ILSpy - .NET Decompiler/Editor

[![adventofcyber2](../../_badges/thm/adventofcyber2/day18.svg)](https://tryhackme.com/room/adventofcyber2)

[ILSpy](https://github.com/icsharpcode/ILSpy) <small>(19.9k ⭐)</small> is the most popular open-source .NET decompiler. It can be integrated in editors such as [VSCode](https://code.visualstudio.com/) or standalone editors.

On Linux, you can use the [AvaloniaILSpy](https://github.com/icsharpcode/AvaloniaILSpy) <small>(1.4k ⭐)</small> port.

```shell!
$ cd /tmp
$ # download a release at https://github.com/icsharpcode/AvaloniaILSpy/releases
$ unzip Linux.x64.Release.zip && unzip ILSpy-linux-x64-Release.zip
$ mkdir -p $HOME/tools/ && mv artifacts/linux-x64/ $HOME/tools/AvaloniaILSpy
$ rm -rf Linux.x64.Release.zip ILSpy-linux-x64-Release.zip artifacts # cleanup
$ ln -s $HOME/tools/AvaloniaILSpy/ILSpy $HOME/.local/bin/ILSpy
$ ILSpy # run
```

Opening the executable will automatically load its .NET solutions. You can save an entire reversed solution or specific files by right-clicking on the target you want to save and selecting 'Save Code.'
</div></div>

<hr class="sep-both">

## Python Reverse Engineering

[![pyc_bytecode](../../_badges/rootme/cracking/pyc_bytecode.svg)](https://www.root-me.org/en/Challenges/Cracking/PYC-ByteCode)

<div class="row row-cols-lg-2"><div>

Python bytecode files `.pyc` or `.pyo` for optimized bytecode are compiled cross-platform code that `python` can execute.

For `Python <= 3.11`, you can use [pycdc](https://github.com/zrax/pycdc) <small>(2.6k ⭐)</small>.

```ps
$ git clone https://github.com/zrax/pycdc.git && cd pycdc
$ mkdir build && cd build && cmake .. && make -j $(nproc)
$ ./pycdc ./xxx.pyc
```

For `Python <= 3.8`, you can use [uncompyle6](https://github.com/rocky/python-uncompyle6) <small>(3.5k ⭐)</small>:

```ps
$ pipx install git+https://github.com/rocky/python-uncompyle6
$ uncompyle6 xxx.pyc
```
</div><div>

If your python version and the target python version is the same, you can use the builtin [dis](https://docs.python.org/3/library/dis.html) module:

```py
import dis
import marshal
dis.dis(marshal.load(open('xxx.pyc', 'rb')))
```
Alternatively, python code can be bundled in a executable that doesn't require the `python` engine using [PyInstaller](https://pyinstaller.org/en/stable/).

You can extract its contents using [pyinstxtractor](https://github.com/extremecoders-re/pyinstxtractor) <small>(2.3k ⭐)</small>.
</div></div>

<hr class="sep-both">

## Android Reverse Engineering

[![apk_introduction](../../_badges/rootme/cracking/apk_introduction.svg)](https://www.root-me.org/en/Challenges/Cracking/APK-Introduction)
[![apk_introduction](../../_badges/rootme/cracking/apk_anti_debug.svg)](https://www.root-me.org/en/Challenges/Cracking/APK-Anti-debug)

<div class="row row-cols-lg-2"><div>

APK files contains multiple files such as `classes.dex` and other `.dex` files, resources, the manifest and certificate files, etc.

It's possible for code to exist within a DEX file but not detected nor reversed by tools such as JADX.

#### JADX — APK+Dex Decompiler/Disassembler

You can use [jadx](https://github.com/skylot/jadx) <small>(38.5k ⭐)</small> to decompile APK and DEX files to Java.

```ps
$ sudo apt install -y jadx
```

You can use either the CLI or the GUI:

```shell!
$ jadx $(pwd)/basic_rev.apk -d $(pwd)/out
$ jadx-gui # and open your file
```

#### Android Studio For Reversed Code

You may open decompiled files in [Android Studio](/programming-languages/mobile/android/tools/and/index.md). Create a new project, put your files inside <small>(in java/ and res/)</small>, apply fixes if prompted, remove the automatically generated `R.java`, and run the app.

🐲 Android Studio has a DexViewer which you can use to see if your Dex file contains hidden methods.

#### Android Boot Image Unpacker

You can use [mkbootimg](https://android.googlesource.com/platform/system/tools/mkbootimg/) developed by Google ([unpack_bootimg.py](https://android.googlesource.com/platform/system/tools/mkbootimg/+/refs/heads/master/unpack_bootimg.py)):

```ps
$ sudo apt install -y mkbootimg
$ unpack_bootimg --boot_img boot.img
$ cd out && gunzip -c ramdisk | cpio -idmv
```

Additional tools: [unpackbootimg](https://github.com/anestisb/android-unpackbootimg/) <small>(0.2k ⭐)</small>, [mkbootimg_tools](https://github.com/xiaolu/mkbootimg_tools) <small>(0.5k ⭐, 2016 🪦)</small> or [abootimg](https://github.com/ggrandou/abootimg) <small>(0.1k ⭐, 2012 🪦)</small>.

#### Additional Notes

* The [dexdump](https://packages.debian.org/stable/dexdump) list methods/classes in a DEX file
* The [010editor](https://www.sweetscape.com/download/010editor/) hex editor is a paid tool to analyze a DEX file 
* [bytecode-viewer](https://github.com/Konloch/bytecode-viewer) <small>(14.3k ⭐, 👻)</small>
* [Apktool](https://github.com/iBotPeaches/Apktool) <small>(18.6k ⭐, 👻)</small>
* [dex2jar](https://github.com/pxb1988/dex2jar) <small>(11.8k ⭐, 👻)</small>
</div><div>

#### androguard — APK+Dex Explorer/Disassembler

[androguard](https://github.com/androguard/androguard) <small>(4.9k ⭐)</small> is a powerful Python tool to explore APK/Dex files, but there is almost no documentation.

```ps
$ sudo apt install -y androguard
```

```shell!
$ androguard analyze ./example.apk # or directly classes.dex
$ androguard analyze
prompt> from androguard.misc import AnalyzeAPK
prompt> a, d, dx = AnalyzeAPK("./example.apk")
prompt> d = DalvikVMFormat(a) # If 'd' is "empty"...
```

List every class in the DEX:

```py
classes = [c for c in dx.get_classes() if not c.external] ; classes
```

List every method <small>(look for methods not found by JADX)</small>:

```py
for i, m in enumerate(d.methods.methods):
  print(m.get_class_name()+m.get_name(), 'has method idx=', i, '; hex=', hex(i))
```

You can detect code not associated with a method using:

```py
known_offsets = [m.get_code().offset for m in d.get_methods() if m.get_code()]
for c in d.get_codes_item().code:
    if c.offset not in known_offsets:
        print("No method associated with code offset:", c.offset, "; hex=", hex(c.offset))

# View The ByteCode Given A Suspicous Offset
d.get_codes_item().get_code(0xffff).show()
```

We can declare the hidden method as a virtual method, rebuilt the DEX, and decompile it again using another tool.

* Increase the number of virtual methods by 1
* Write the method IDX, `0x1` for public, and the code offset to the file. All values are in hexadecimal and uleb128 formatted.
* Compute the sha1 of `file_size - 32` and write it at index 12
* Compute the adler32 checksum of `file[12:]` and write it at index 8

<details class="details-n">
<summary>Missing Additional Notes FixMePlease</summary>

A few more parameters are required to declare a virtual method. Assuming you have access to a class object <small>(cf. classes)</small>, you need to find where is the number of virtual methods stored.

```py
virtual_methods_index = hex(aClass.get_class().class_data_item.get_off() + 3) 
```

The `class_data_item` contains four values. The last one <small>(notice the +3)</small> is the number of virtual methods.

The second step is to find where we can add virtual method reference, e.g. `virtual_methods_block_index`. I don't know how to do that programmatically.
</details>

<details class="details-n">
<summary>Python Code Samples</summary>

```py
def update_sha1(input_file):
    import hashlib
    with open(input_file, 'rb+') as f:
        f.seek(0, 2)
        file_size = f.tell()
        f.seek(32)
        sha1 = hashlib.sha1(f.read(file_size - 32)).hexdigest()
        f.seek(12)
        f.write(bytes.fromhex(sha1))
        print("SHA1:", sha1)
```
```py
def update_checksum(input_file):
    import zlib
    with open(input_file, 'rb+') as f:
        f.seek(12)
        checksum = '{:08x}'.format(zlib.adler32(f.read()) & 0xFFFFFFFF)
        f.seek(8)
        f.write(int(checksum, 16).to_bytes(4, byteorder='little'))
        print("Checksum: ", int(checksum, 16))
```
```py
def encode_uleb128(value):
    encoded_bytes = bytearray()
    while True:
        byte = value & 0x7F
        value >>= 7
        if value != 0:
            byte |= 0x80
        encoded_bytes.append(byte)
        if value == 0:
            break
    return int.from_bytes(encoded_bytes, byteorder='little')


def modify_virtual_methods_size(input_file):
    virtual_methods_index = 0x3988
    virtual_methods_block_index = 0x39b1
    method_idx = 0x22
    method_access = 0x1
    method_offset = 0x1fcc

    with open(input_file, 'rb+') as f:
        # Determine The Current Value
        f.seek(virtual_methods_index)
        virtual_methods_size = int.from_bytes(f.read(1), 'little')

        # Add One
        f.seek(virtual_methods_index)
        virtual_methods_size += 1
        f.write(virtual_methods_size.to_bytes(1, 'little'))
        print("Virtual Methods Size:", virtual_methods_size)

        # Add The Given Method
        f.seek(virtual_methods_block_index)
        f.write(encode_uleb128(method_idx).to_bytes(1, 'little'))
        f.write(encode_uleb128(method_access).to_bytes(1, 'little'))
        f.write(encode_uleb128(method_offset).to_bytes(2, 'little'))
```
</details>
</div></div>

<hr class="sep-both">

## Reversing Binaries On Linux

[![getting_started](../../_badges/htb-c/getting_started.svg)](https://app.hackthebox.com/challenges/getting-started)
[![questionnaire](../../_badges/htb-c/questionnaire.svg)](https://app.hackthebox.com/challenges/Questionnaire)
[![reg](../../_badges/htb-c/reg.svg)](https://app.hackthebox.com/challenges/Reg)
[![elf_x86_0_protection](../../_badges/rootme/cracking/elf_x86_0_protection.svg)](https://www.root-me.org/en/Challenges/Cracking/ELF-x86-0-protection)
[![elf_x86_basic](../../_badges/rootme/cracking/elf_x86_basic.svg)](https://www.root-me.org/en/Challenges/Cracking/ELF-x86-Basic)

<div class="row row-cols-lg-2"><div>

#### Linux ObjDump Disassembly

The most basic disassembler:

```ps
$ objdump -D xxx.bin -M intel
```

<br>

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

<br>

#### Linux Tracers

[![mustacchio](../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)

Linux commands [strace](https://www.man7.org/linux/man-pages/man1/strace.1.html) and [ltrace](https://www.man7.org/linux/man-pages/man1/ltrace.1.html) are very helpful to identify system and library calls in a program, which is helpful to reverse it.

```shell!
$ strace xxx.bin # -f | -e open/... | -s 1000 | -y
syscall(args) = return_code
...
$ ltrace xxx.bin
```

<br>

#### Boomerang

[boomerang](https://github.com/BoomerangDecompiler/boomerang) <small>(0.4k ⭐)</small> that is somewhat able to reverse x86 binaries in an unreadable uncompilable C file.

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
</div><div>

#### Linux Radare Disassembly

[![adventofcyber2](../../_badges/thm/adventofcyber2/day17.svg)](https://tryhackme.com/room/adventofcyber2)

[Radare](https://github.com/radareorg/radare2) <small>(19.4k ⭐)</small> is similar to GDB, but it somewhat easier to use if we only need to disassemble the code.

```shell!
$ rabin2 -I xxx.bin # get information
$ rabin2 -z xxx.bin # list strings
$ r2 -d xxx.bin     # Open in debug mode (if applicable)
$ r2 -A xxx.bin     # Open and analyze (aaa)
$ r2 -qcizz xxx.bin
```

```ps
(r2) a?             # help for analyze
(r2) aaa            # analyze
```

```ps
(r2) vv             # view disassembly, symbols, etc.
(r2) VV             # view the program flow
```

```ps
(r2) afl            # list function, can grep
(r2) pdf @main      # disassemble 'main' (@sym.main)
(r2) oo             # reload executable
```

```ps
(r2) db 0xAABBCCDD  # breakpoint
(r2) dc             # run the program, stop before breakpoint
(r2) ds             # run one instruction
```

```ps
(r2) px @ address   # display the memory at address
(r2) dr             # display registry values
```

📚 When using `pdf` such as `pdf @main`, we can see a list of variables and their addresses. We can pass these addresses to `px`.

</div></div>

<hr class="sep-both">

## Reversing Binaries On Windows

<div class="row row-cols-lg-2"><div>

#### Windows x64dbg debugger

[![attacking_common_applications](../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![introduction_to_malware_analysis](../../_badges/htb/introduction_to_malware_analysis.svg)](https://academy.hackthebox.com/course/preview/introduction-to-malware-analysis)

You can use [x64dbg](https://github.com/x64dbg/x64dbg) <small>(42.9k ⭐)</small> to debug binaries.

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

#### Additional Tools

* [CFF Explorer](https://ntcore.com/?page_id=388) <small>(PE, 👻)</small>
* [WinDBG](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/) <small>( 👻)</small>
</div></div>

<hr class="sep-both">

## Reversing Binaries On Any Platform

<div class="row row-cols-lg-2"><div>

#### dogbolt Online Decompiler Explorer

[dogbolt](https://dogbolt.org/) <small>(1.8k ⭐)</small> quickly test your code against many decompilers. It's quite handy during CTFs, but has some [an implicit binary sharing policy and legal restrictions](https://dogbolt.org/faq) on private instances.


#### IDA Decompiler & Disassembler

[IDA Pro](https://hex-rays.com/ida-pro/) is the most used and well-known compiler while it is paid. You can use the limited free version:

```shell!
$ wget https://out7.hex-rays.com/files/idafree84_linux.run
$ chmod +x idafree84_linux.run
$ ./idafree84_linux.run
$ # assuming you installed it in $HOME/tools/ 
$ ln -s $HOME/tools/idafree-8.4/ida64 $HOME/.local/bin/ida
$ ida xxx.bin
```

Additional Notes

* Press <kbd>F5</kbd> to use the third-party x64 free cloud decompiler.
</div><div>

#### Binary Ninja

[Binary Ninja](https://binary.ninja/) is a paid decompiler and disassembler. You can use the limited free version:

```shell!
$ mkdir -p $HOME/tools/ && cd $HOME/tools/
$ wget https://cdn.binary.ninja/installers/BinaryNinja-free.zip
$ unzip BinaryNinja-free.zip && rm BinaryNinja-free.zip
$ cd && ln -s $HOME/tools/binaryninja/binaryninja $HOME/.local/bin/binaryninja
```

#### Additional Tools

* [Immunity Debugger](https://www.immunityinc.com/products/debugger/) + [mona](https://github.com/corelan/mona)
</div></div>

<hr class="sep-both">

## Code Obfuscation

<div class="row row-cols-lg-2"><div>

Moved to [code obfuscation](/cybersecurity/purple-team/av_evasion/index.md#code-obfuscation).
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Where to learn?

* [begin.re](https://www.begin.re/)
* [reverse.zip](https://reverse.zip/)
* [tmpout](https://tmpout.sh/)
* [awesome](https://github.com/wtsxDev/reverse-engineering)

Tools

* [xiosec list of tools](https://github.com/xiosec/Reverse-engineering)
* [frida](https://frida.re/): dynamic instrumentation
* [angr](https://github.com/angr/angr): python CTF tool
* [Rizin](https://github.com/rizinorg/rizin) and [cutter](https://github.com/rizinorg/cutter)
* [Hopper](https://www.hopperapp.com/) disassembler
</div><div>

Note

* A program creating a file then deleting it => `Disable inheritance, Convert to explicit, Select user > Edit > Show advanced permissions, uncheck both 'delete'` to prevent them from removing the file and allow us to read it.
* [Ghidra](https://www.ghidra-sre.org/)

```text!
sudo apt install ghidra -y
ghidra
> new project
> import file
> analyze
Windows
> Decompile: Main
> Functions
> Defined Strings
StackView
> Double-click on a variable to open
```
</div></div>