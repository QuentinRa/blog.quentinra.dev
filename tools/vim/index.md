# vim

vim is a console editor, at least in the basic
version of it.

You may find extensions like
* GVim
* neovim

# Installation

You can install it using ``sudo apt-get install vim``
or whatever command you use to install packages
such as ``sudo aptitude install vim``.

Then you can configure your editor by creating
a file ``~/.virmrc``, here an example of mine

```bash
set fileencodings=UTF-8,utf-8,default,latin1 "file encoding
syntax enable "enable syntax
highlight Cursor guifg=white guibg=black "cursor color
filetype plugin indent on "indentations
set cursorline "show cursor
set tabstop=4 "tabulation size
```

# Surviving in vim ...

Here a really short summary of vim.

You have two mode (at least for now),
check at the bottom left of your screen

* `INSERTION` : you are editing
* `<nothing>` : called command mode

And here are commands, so in **command mode**

* ``i`` (or `a`): switch to `INSERTION`, you can now modify the file
* ``:wq`` : save and exit
* ``:q!`` : exit without saving
* ``u`` : undo
* ``h, j, l, k`` : move cursor to left, top, right, bottom

**NOTE** : use ``echap`` (one/twice) to
go back to command mode, for instance to save and
exit.

# ... and now mastering it

Here some details about basic commands

* [insert](commands/insert.md)
* [move](commands/move.md)
* [delete](commands/delete.md)
* [copy](commands/copy.md)
* [useful commands](commands/save-exit.md)
* [search](commands/search.md)
* [replace](commands/replace.md)
* [others](commands/others.md)

You can use powerful commands and some regex/patterns
using the ``cqi`` syntax.

* ``c`` : a command
* ``q`` : a quantity
* ``i`` : an indicator

in a sentence, for exemple, we could say
``delete (=c) 10 (=q) lines (=i)``. Indicators would be 

* ``$`` : command from cursor until the end of the line
* ``e`` : ???
* ``.`` : under cursor
* ``c`` : a line
* ``^`` : from cursor until the start of the line

You may use that in previous commands.

## Sources

* Quentin RAMSAMY–AGEORGES (ENSIIE Student)

References
* <https://en.wikipedia.org/wiki/Vim_(text_editor)>
* <https://neovim.io/doc/>