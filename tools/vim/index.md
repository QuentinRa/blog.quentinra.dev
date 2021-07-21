# vim

*vim*, for *vi improved* is a text editor, 
at least in the basic version of it.

You may find extensions like

* GVim
* neovim

<hr class="sl">

## How to install and run vim?

You can install it using ``sudo apt-get install vim``
or whatever command you use to install packages
such as ``sudo aptitude install vim``.

Then you can run it with `vim` or `vi`. You can give
a file to open with ``vim file``. The file is
created if it's don't exists.

**HELP, I'm can't exit vim.**

If you are trapped in vim, keep calm, 
and press `esc` (escape key), then `:q!`.

* `esc` will bring (back) vim to its **normal mode** 
 (if we could call it normal...).
* `:q!` is the command to force to quit vim, that is to say,
  to exit vim without saving.

**Basic configuration**

Then you can configure your editor by creating
a file ``~/.virmrc``, here is an example of mine

```bash
set fileencodings=UTF-8,utf-8,default,latin1 "file encoding
syntax enable "enable syntax
highlight Cursor guifg=white guibg=black "cursor color
filetype plugin indent on "indentations
set cursorline "show cursor
set tabstop=4 "tabulation size
```

<hr class="sr">

# Surviving in vim ...

Here is a summary of vim.

You have two modes (at least for now),
check at the bottom left of your screen

* `INSERTION` : called insert/edit mode
* `<nothing>` : called command/normal mode

More generally, the **normal mode** (or command mode)
of vim is the state where the user's input served to do some
special action (move the cursor, copy, paste, erase...).

`:` is used to run a command. E.g, `q` is the command to exit vim.
`q!` to exit without saving and `wq` to save and exit...

In normal mode, press `i` to enter in **insert mode**,
which is the mode where you can write some text such as every
other text editor. Press `esc` to exit this mode and return to
the normal one.

Here are a summary commands (so in **command mode**)
that you will most likely need to know

* ``i`` (or `a`): switch to `INSERTION`, you can now modify the file
* ``:wq`` : save and exit
* ``:q!`` : exit without saving
* ``:q`` : exit
* ``u`` : undo
* ``h, j, l, k`` : move cursor to left, top, right, bottom

<hr class="sl">

# ... and now mastering it

The best way to learn how to use vim is... to use it.
However, and thankfully, you can open a terminal and write
`vimtutor`, which will teach you the basics command 
to use vim peacefully, in exchange for around 30 minutes of your
life and brain attention.

Here are some details about basic commands

* [insert](commands/insert.md)
* [move](commands/move.md)
* [delete](commands/delete.md)
* [copy](commands/copy.md)
* [search](commands/search.md)
* [replace](commands/replace.md)
* [others commands](commands/others.md)
* [cgi syntax](commands/cgi.md)
* [mystic commands](commands/special.md)

<hr class="sr">

## Cheatsheet / Reference

Because now that you learned a bit about vim, you need
a cheat to remember a lot of things you learned, check
these

* [our summary](summary.md)
* [vim-cheatsheet.pdf](https://www.cs.cmu.edu/~15131/f17/topics/vim/vim-cheatsheet.pdf)
* [vim-cheatsheet.pdf](download:vim-cheatsheet.pdf) (same as above, locally stored)
* <https://vim.rtorr.com/>
* [Vim-commands-cheat-sheet-by-PhoenixNAP-1.pdf](download:Vim-commands-cheat-sheet-by-PhoenixNAP-1.pdf)
* [vi_vim_cheat_sheet.pdf](https://www.shell-tips.com/cheat-sheets/vim-quick-references/vi_vim_cheat_sheet.pdf)
* [vimqrc.pdf](http://tnerual.eriogerg.free.fr/vimqrc.pdf)

<hr class="sl">

## Code completion

This is something that is only discovered recently,
but vim supports code completion!

These commands using 
[ale](https://github.com/dense-analysis/ale)
will give you hints about mistakes (like; missing)
when going back to command mode.

```bash
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
```

But since you will want more, I tested this configuration,
and using ``CTRL-P``, VIM is showing a list of autocompletion choices

* <https://github.com/viniciusgerevini/dotfiles/blob/master/vim/.vimrc>
* ``sudo apt-get install vim-runtime``
* ``sudo apt-get install vim-gui-common``

I'm not using VIM singe ages but I stumbled upon ALE so
I wanted to add it here.

<hr class="sr">

## Sources

* <https://en.wikipedia.org/wiki/Vim_(text_editor)>
* <https://neovim.io/doc/>
* <https://vimsheet.com/>
* <https://vimsheet.com/advanced.html>
* <https://vim.rtorr.com/>