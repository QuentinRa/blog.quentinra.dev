# Introduction

*vim*, for *vi improved*, is a console text editor, at least in the basic version of it. This tutorial won't cover the two famous extensions of vim

* neovim
* gVim Portable

<hr class="sl">

# How to install and run vim?

You can install it using `sudo apt-get install vim` or whatever command you are using to install packages, such as `sudo aptitude install vim`.

* `vim`: open vim
* `vim file`: open a file in vim (and create it, if it didn't exist)

**HELP, I can't exit vim.** (😂 [how-to-exit-vim](https://github.com/hakluke/how-to-exit-vim) & [VimKiller](https://github.com/caseykneale/VIMKiller))

If you are trapped in vim, keep calm, and press `esc` (escape key), then `:q!`.

* `esc` will bring back vim to its **normal mode**
* `:q!` is the command to exit vim without saving.

**Basic configuration**

You can configure your editor by creating a file `~/.virmrc`, here is an example of a basic configuration

```bash
set fileencodings=UTF-8,utf-8,default,latin1 "file encoding
syntax enable "enable syntax
highlight Cursor guifg=white guibg=black "cursor color
filetype plugin indent on "indentations
set cursorline "show cursor
set tabstop=4 "tabulation size
```

You should look on GitHub or the web for "dotfiles vim" if you want to find an advanced configuration.

<hr class="sr">

# Surviving in vim ...

You have two modes (at least for now), check at the bottom left of your screen

* `INSERTION` : called insert/edit mode
* `<nothing>` : called command/normal mode

More generally, the **normal mode** is used to do special actions (move the cursor, copy, paste, erase...).

`:` is used to run a command. E.g, `q` is the command to exit vim.
`q!` to exit without saving and `wq` to save and exit...

In normal mode, press `i` to enter in **insert mode**, which is the mode where you can write some text such as every other text editor. Press `esc` to exit this mode and return to the normal one.

Here is a short summary of the commands (so in **normal mode**) that you will most likely need to know

* `i` (or `a`): switch to `INSERTION`, you can now modify the file
* `:wq` : save and exit
* `:q!` : exit without saving
* `:q` : exit
* `u` : undo
* `h, j, l, k` : move cursor to left, top, right, bottom

<hr class="sl">

# ... and now mastering it

The best way to learn how to use vim is... to use it. However, and thankfully, you can open a terminal and write `vimtutor`, which will teach you the basic commands to use vim peacefully (in exchange for around 30 minutes of your life and brain attention).

Here are some details about basic commands

* [insert](commands/insert.md)
* [move](commands/move.md)
* [delete](commands/delete.md)
* [copy](commands/copy.md)
* [search](commands/search.md)
* [replace](commands/replace.md)
* [other commands](commands/others.md)
* [cqi syntax](commands/cqi.md)

> One little trick: `:w !sudo tee %` allows us to save a file in a vim session that wasn't started as root.

<hr class="sr">

## Cheatsheet

Because now that you learned a lot about vim, you may need a cheat sheet to remember these or to learn more. Check these

* [our summary](summary.md)
* [vim-cheatsheet.pdf](https://www.cs.cmu.edu/~15131/f17/topics/vim/vim-cheatsheet.pdf)
* <https://vim.rtorr.com/>
* [Vim-commands-cheat-sheet-by-PhoenixNAP-1.pdf](https://github.com/memorize-code/memorize-references/raw/main/tools/vim/Vim-commands-cheat-sheet-by-PhoenixNAP-1.pdf)
* [vi_vim_cheat_sheet.pdf](https://www.shell-tips.com/cheat-sheets/vim-quick-references/vi_vim_cheat_sheet.pdf)
* [vimqrc.pdf](http://tnerual.eriogerg.free.fr/vimqrc.pdf)

<hr class="sl">

## Code completion

This is something that I only discovered recently, but vim supports code completion! This is available using [ale](https://github.com/dense-analysis/ale), which will give you hints about mistakes (like ';' missing) when going back to command mode.

```bash
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
```

But since you will want more, I tested this configuration, and using `CTRL-P`, VIM is showing a list of autocompletion choices

* <https://github.com/viniciusgerevini/dotfiles/blob/master/vim/.vimrc>
* `sudo apt-get install vim-runtime`
* `sudo apt-get install vim-gui-common`

I'm not using VIM singe ages, but I stumbled upon ALE, and I wanted to add it here.

<hr class="sr">

## Sources

* <https://en.wikipedia.org/wiki/Vim_(text_editor)>
* <https://neovim.io/doc/general/>
* <https://vimsheet.com/>
* <https://vimsheet.com/advanced.html>
* <https://vim.rtorr.com/>