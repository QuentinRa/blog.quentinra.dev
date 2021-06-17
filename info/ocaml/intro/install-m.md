# Install OCaml + use in VSCode

[Go back](..)

The original tutorial is [here](http://web4.ensiie.fr/~christophe.mouilleron/Teaching/IPF-S2/install.html)
but just in case, here is a copy.

**OCaml version that will be installed is 4.08**.

1. Download ocaml 4.08 [here](https://lgs-games.com/assets/file/ocaml_4-08.zip)
2. extract in ``C:/``
3. open a terminal
4. write ``C:\ocaml\bin\ocamlc.exe -v`` (should print version)
5. write ``PATH`` in the Windows search bar (bottom left)
6. edit environment variables menu
7. Environment variables button
8. first panel, click on ``Path``
9. modify (right bellow)
10. add entry: ``C:\ocaml\bin\``
11. open a **new** terminal and write ``ocamlc -v``
12. same output as ``4.``

Then you can use it in any terminal, like in VSCode,
using Tuareg mode plugin.