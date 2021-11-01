# Installing OCaml on Windows

[Go back](..)

This page is quite long, as I had a hard time, and as they were a lot of tutorials that finally worked for me, **yet none of them were enough so that I could fully enjoy OCaml in my editor** (so I'm making my own plugin for IntelliJ 🚀).

<details class="details-e">
<summary>You can use a WSL<br>👍: easy, you got a graphical version for emacs, sublime text, IntelliJ, etc.<br> 👎: not beautiful, a bit blurry</summary>

This is Linux on Windows. Here is the tutorial to install a [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Then you can install OCaml like you would on Linux.

```bash
sudo apt-get update && sudo apt-get install ocaml
# editor: sublime text
sudo apt-get install sublime-text
subl -c
# editor: emacs
sudo apt-get install emacs
emacs -c
# editor: IntelliJ
# ... get the tar.gz on their Website, tar xvf idea.tar.gz
# inside the bin folder, run the .sh
./idea.sh -c
```

But this won't work. You need to install [XMing](http://www.straightrunning.com/XmingNotes/), and [XMing fonts](http://www.straightrunning.com/XmingNotes/) first (links in "public domain"). Then, every time you need to use `-c` (graphical version), start XMing first.
</details>

<details class="details-e">
<summary>OCaml from "sources"<br>
👍: easy, VSCode+tuareg<br> 👎: you need someone to zip their working OCaml for you</summary>

The original tutorial is [made by my teacher is here](http://web4.ensiie.fr/~christophe.mouilleron/Teaching/IPF-S2/install.html), but just in case, here is a copy.

1. Download [the zip for ocaml 4.08](https://chadok.info/~cmouille/ocaml_4-08.zip)
2. extract in `C:/`,
3. open a terminal
4. write `C:\ocaml\bin\ocamlc.exe -v` (expected: ocaml version)
5. write `PATH` in the Windows search bar (bottom left)
6. "edit environment variables" then  "Environment variables" button
8. In the first panel, click on `Path` then modify (right below)
10. add this entry: `C:\ocaml\bin\`
11. open a **new** terminal and write `ocamlc -v`
12. same output as `4.`

Then you can use it in any terminal, like in VSCode, using the tuareg mode plugin (as my teacher is explaining).
</details>

<details class="details-e">
<summary>OCaml in IntelliJ (WSL)<br>👍: easy setup<br> 👎: no tuareg mode, the plugin do not have many features.</summary>

You can install [OCaml plugin on IntelliJ](https://github.com/giraud/reasonml-idea-plugin), and compile using a WSL.

<details class="details-border">
<summary>Install a WSL</summary>

This is the official tutorial to [install a WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10), but if this looks complicated to you, here is what I did
* open the Windows Store
* enter "Debian" (or "Ubuntu")
* install it
* start it, once the initialization is done, you are good
</details>

To compile, simply click on "Terminal" (the Bar at the bottom, with Git/TODO/...). Click on the small caret-down icon and select Debian. Then, simply write your commands 🚀.

```bash
# install OCaml, once
$ sudo apt-get install ocaml
# check installed
$ ocaml --version
# compile
$ ocamlc src/hello_word.ml 
# run
$ ./a.out
Hello, World!
```

</details>

<details class="details-e">
<summary>OCaml in IntelliJ (Cygwin)<br>
👍: easy setup, Makefile<br> 👎: same as WSL</summary>

Download [Cygwin](https://cygwin.com/install.html).

* Next
* Install from the internet, Next
* Next, Next, Next
* Pick a link in the list, Next
* In view, select full

Now, you have to pick the **commands** you want, which means replacing "Skip" (in the column "New") with a version of the command. You should use the search bar.
I picked **make**, **ocaml**, opam (not required), **vim** (just in case), **wget** and **curl**. If you are planning to use opam, add `libclang` and `mingw[...]clang`. 

* Then process with the installation

Now, you should open a new terminal on Windows (ex: Powershell, cmd, ...) and write a command 

```bash
$ make -v
# GNU Make 4.3
# ...
```

You may have to restart your IDE (if you are using one), or your computer. If this is still not working, check that `C:/cygwin64/bin` is in the PATH.

> Now you can write a Makefile in IntelliJ, and compile using Make.
</details>

<details class="details-e">
<summary>OCaml in IntelliJ (tricks, node.js)<br>
👍 and 👎: see the README.md</summary>

The [tutorial for OCaml in IntelliJ/PHPStorm/... is here](https://github.com/memorize-code/jetbrains-ocaml-template).
</details>

<hr class="sl">

## The unmentioned

Every setup before was easy, because I removed any setup complicated. But, if you want more, you need to dig more into it.

* check [esy](https://esy.sh/)
* or check [opam](https://opam.ocaml.org/) with maybe this [installer OCaml+Windows](https://fdopen.github.io/opam-repository-mingw/installation/) (**discontinued since August 2021**)
* or you could check [dune](https://dune.build/)

<hr class="sr">

## Do not look for the ghosts

They are still in the official documentation (or in some online tutorials), but they disappeared 👻.

* **WinCaml**: dead, the links are directing to the discontinued installer of the previous section
* **OCPWin**: it disappeared