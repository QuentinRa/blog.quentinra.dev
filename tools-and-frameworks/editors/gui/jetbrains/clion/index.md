# CLion

<div class="row row-cols-lg-2"><div>

[CLion](https://www.jetbrains.com/clion/) is a **C and C++** IDE powered by JetBrains and exclusively available in a **paid** version.

<p class="text-center">
<img src="_images/logo.png" width="150"/>
</p>

👉 JetBrains IDEs share many features [explained here](../_general/index.md).
</div><div>

**Features**

* 🌱 Makefile and CMake support
* 🚀 Suggest STD functions when detecting common patterns
* ⏳ can generate common code snippets <small>(equals, getters, functions...)</small>
* ...
</div></div>

<hr class="sep-both">

## Product-specific features

<div class="row row-cols-lg-2"><div>

#### Set Up The Compiler

Press `CTRL+ALT+S` or `⚙️ > Settings`. Navigate to `Build...` then `Toolchains`. From there, create or update a toolchain.

A toolchain defines the environment and the compiler used to run your build tool, compile files, and debug executables.

<br>

#### CMake Configurations

Press `CTRL+ALT+S` or `⚙️ > Settings`. Navigate to `Build...` then `CMake`. From there, create or update a configuration.

Information such as the type of build, the toolchain used, or the arguments passed to the build command can be set from there.
</div><div>

#### Build

Inside the dropdown with all targets, you can use `CTRL+F` and search for a target <small>(targets will be filtered as you type)</small>.

Inside the `Build` menu, you can build all targets or run clean.
</div></div>