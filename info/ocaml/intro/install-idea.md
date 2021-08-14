# OCaml in Intellij

[Go back](..)

**You should not try to do this unless you are crazy
(use VSCode or sublime text or the online version).**
There is maybe a cleaner and easier way, check notes.

* Download and install OCaml using the graphical 
installer [here](https://fdopen.github.io/opam-repository-mingw/installation/)
* open IntelliJ and install ``ReasonML`` plugin
* then create a new OCaml project
* in Project structure, set the SDK as ``C:\OCaml64\home\YOUR_NAME_HERE\.opam\4.11.1+mingw64c``
but nowadays IntelliJ seems to find it by himself.
* in the same menu, in ``SDK``
  * check `use cygwin`
  * set path as `C:\OCaml64\bin\bash.exe`
* go to ``Modules``, click on your project, then `+` and `dune`.

Then create a file ``dune-project`` (at the root folder)

```java
(lang dune 2.8)
(name test) ; project name
```

And in your folder, a ``dune`` file.

```java
(executable
  (name test) ; build test.ml
)
```

with `test`, the name of your .ml file so ``test.ml`` for me.

Then my ``test.ml`` file (in src folder with dune file)

```ocaml
(* in a .ml file, use Printf.printf *)
Printf.printf "%s" "Hello world"
```

Simply write some code and save it, the code is compiled each
time you save and you made some changes. Right next to ``profiler``
tab, you can see your errors in the dune tab.

<hr class="sl">

## Create a configuration

* click on ``add configuration``
* ``+``
* shell script
* and set in script path ``/_build/default/src/test.exe``
with ``/`` your project root and `test` in `test.exe`
  the name of your ``.ml``.

<hr class="sr">
  
## Notes

It seems that we don't have any of IntelliJ features such
as refactor as of now but we should have them. Seems like
a configuration problem but I won't search.

* <https://esy.sh/>
* <https://github.com/idkjs/coding-ocaml-js-node>
* <https://plugins.jetbrains.com/plugin/9440-reasonml>
* <https://github.com/giraud/reasonml-idea-plugin>
* <https://giraud.github.io/reasonml-idea-plugin/>

That may or not help. Seems like we could also use Node.