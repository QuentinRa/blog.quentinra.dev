# Installing OCaml on Windows

[Go back](..)

This page is quite long, as I had a hard time, and as they were a lot of tutorials that finally worked for me, yet none of them were enough so that I could fully enjoy OCaml in my editor.

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

But this won't work. You need to install [XMing](http://www.straightrunning.com/XmingNotes/), and [XMing fonts](http://www.straightrunning.com/XmingNotes/) first (links in "public domain"). Then, everytime you need to use `-c` (graphical version), start XMing.
</details>

<details class="details-e">
<summary>OCaml from "sources"<br>
👍: easy, VSCode+tuareg<br> 👎: you need someone to zip their working OCaml for you</summary>

The original tutorial is [made by my teacher is here](http://web4.ensiie.fr/~christophe.mouilleron/Teaching/IPF-S2/install.html), but just in case, here is a copy.

1. Download [the zip ffor ocaml 4.08](https://chadok.info/~cmouille/ocaml_4-08.zip)
2. extract in `C:/`,
3. open a terminal
4. write `C:\ocaml\bin\ocamlc.exe -v` (expected: ocaml version)
5. write `PATH` in the Windows search bar (bottom left)
6. "edit environment variables" then  "Environment variables" button
8. In the first panel, click on `Path` then modify (right bellow)
10. add this entry: `C:\ocaml\bin\`
11. open a **new** terminal and write `ocamlc -v`
12. same output as `4.`

Then you can use it in any terminal, like in VSCode, using the tuareg mode plugin (as my teacher is explaining).
</details>

<details class="details-e">
<summary>OCaml in IntelliJ<br>
👍: easy setup, basic autocompletion, some hints<br> 👎: a cheat 😶😬, npm required</summary>

Before explaining, this is a **cheat**, and if my teacher heard of this, I could bet that he would say that is an **aberration**. Basically, we are converting OCaml to JavaScript, and we are running the JavaScript.

Everything is **hidden for you** 😶, so you will simply have to press run and see the result <small>(or you can show the new result each time you are changing a file if you want)</small>. This is a cheat because we are not even installing OCaml, but we are using some tool that do not seems to be related to OCaml (🙄 what?!).

Well, my school project from last year is compiling without errors nor warnings, as it did when I used `ocamlc` to compile it, so it seems fine.

I this wasn't enough to make you run away 👀, then the [tutorial for OCaml in IntelliJ/PHPStorm/... is here](https://github.com/memorize-code/jetbrains-ocaml-template).
</details>

> To best honest, you the online editor is enough for what we did during my first year. You can use the first and the second solution to make a proper install of OCaml, they are both good. As for the last solution, this is literally not a solution, but this is working an my school project is running as expected with it, so I'm planning to use it.

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