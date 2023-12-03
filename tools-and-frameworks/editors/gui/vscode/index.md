# Visual Studio Code

<div class="row row-cols-lg-2"><div>

[Visual Studio Code](https://code.visualstudio.com/) <small>(a.k.a. VSCode, VSC)</small> is a free 💸 **text-editor** which can become as powerful as an IDE by adding extensions to it 🌟.

On StackOverflow surveys, 70% of polled developers use VSC, mainly because it's free and supports many languages.

One inconvenience is that support for many languages is added through extensions. It may not be very smooth to use, or the programmer may still have a lot to do manually.
</div><div>

➡️ My notes to [install JavaFX](/programming-languages/high-level/oo/java/ui/javafx/_sub/install.md).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

To use VSCode with OCaml on Linux, you need to install a few opam packages and the OCaml Platform extension. Ensure your VSCode version is compatible with the installed LSP server <small>(after installation, from VSCode, read OCaml Server Logs to see if you have an error).</small>.

```shell!
$ sudo apt-get install opam
$ opam init
$ opam switch create 4.14.0
$ opam switch 4.14.0
$ opam install ocaml-lsp-server ocamlformat
```
</div><div>

* `File>Add folder to workspace`
* `CTRL+SHIFT+P`: open command palette
* `CTRL (hold) K then C`: comment line
* Outline View at the bottom left
</div></div>