# Vim text editor

[![toolboxvim](../../../../cybersecurity/_badges/thm/toolboxvim.svg)](https://tryhackme.com/room/toolboxvim)

<div class="row row-cols-lg-2"><div>

Vim <small>(vi improved)</small> is a terminal text editor that is often used along nano mostly when there is no graphical interface 🐉.

```bash
# create or open a file
$ vim filename
```

👉 Some are using an unofficial "modern vim": [neovim](https://neovim.io/).
</div><div>

Install vim 🗃️

```bash
$ sudo apt-get install vim
```

Learn vim 📚

* `vimtutor`: a command-line course <small>(~30 minutes)</small>
* [vimsheet](https://vimsheet.com/) or [rtorr](https://vim.rtorr.com/): some vim cheat sheets
</div></div>

<hr class="sep-both">

## Get started

<div class="row row-cols-lg-2"><div>

The current one is shown at the bottom left of the screen.

* `<nothing>` : the command/normal mode
* `INSERTION` : the insert/edit mode
* `VISUAL` : [...]
</div><div>

To exit VIM, you need to be in command mode. Press <kbd>ESC</kbd> <small>(at least once)</small> to go back to it. Then, press `:` followed by the exit without saving command: `q!`. 👉 See the command section.

🦄 Not panicking is the key to success. Being trapped in VIM is a popular gag/meme, see these trolls: [how-to-exit-vim](https://github.com/hakluke/how-to-exit-vim) and [VimKiller](https://github.com/caseykneale/VIMKiller).
</div></div>

<hr class="sep-both">

## Configuration

<div class="row row-cols-lg-2"><div>

You can configure your editor by creating a file `~/.virmrc`. You can find useful configurations online. Look for `dotfiles vim`.

You can also add plugins to Vim such as [ale](https://github.com/dense-analysis/ale) for IDE-like features.

<details class="details-n">
<summary>Add ALE to VIM</summary>

```bash
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
```

* [viniciusgerevini](https://github.com/viniciusgerevini/dotfiles/blob/master/vim/.vimrc) dotfile
* `sudo apt-get install vim-runtime`
* `sudo apt-get install vim-gui-common`

Using CTRL+P, you now have autocompletion.
</details>
</div><div>

A basic configuration <small>(syntax highlighting, cursor, tab size, and file encoding)</small>

```text
set fileencodings=UTF-8,utf-8,default,latin1 "file encoding
syntax enable "enable syntax
highlight Cursor guifg=white guibg=black "cursor color
filetype plugin indent on "indentations
set cursorline "show cursor
set tabstop=4 "tabulation size
```
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-lg-2"><div>

#### Start editing

To switch to the INSERTION mode in which you can edit the file:

* `i`/`a`: insert before/after the cursor
* `I`/`A`: insert at the beginning/end of the line
* `o`/`O`: insert at the line under/above ours

#### Move the cursor

🎯 You must be in command mode.

<div class="row row-cols-lg-2"><div>

* `h`: move left ⬅️
* `j`: move down ⬇️
* `k`: move up ⬆️
* `l`: move right ➡️
</div><div>

* `0` or `CTRL-^`/`$` : move the beginning/end of the line
* `gg`/`G`: start/end of the file
* `w`/`e`: start/end of a word
</div></div>

You can jump to a line with: `xG` <small>(ex: "5G")</small> or `:x` <small>(ex: ":5")</small>. See `CTRL-G`.

You can use `CTRL-F`/`CTRL-B` to go down/up one screen.
</div><div>

#### Commands

<div class="row row-cols-lg-2"><div>

* `:w`: save
* `:wq`: save and exit
* `:q!`: exit and discard changes
* `:q`: exit
</div><div>

* `u`: undo
* `U` : undo all actions of a line
* `CTRL-R` : redo
</div></div>

#### Copy

* `yy`: copy the current line
* `:yx`: copy x lines from the cursor line
* `:n,my`: copy lines from `n` (>=1) to `m`
* `p`/`P`: paste copy after/before the cursor

#### Delete

* `nx`/`nX`: `n` characters under/before the cursor
* `d^`: every character of the line until the cursor
* `D` or `d$`: every character until the end of the line
* `dd`/`ndd`: delete the current line
* `:n,md`: delete lines starting from the line `n` until the line `m`

</div></div>

<hr class="sep-both">

## Intermediate

<div class="row row-cols-lg-2"><div>

#### Search

* `/mot`: search (descending)
* `?mot`: search (ascending)
* `n`: next occurrence
* `N`: previous occurrence
* `%symbol`: return the matching symbol

#### Utils

* `<<`/`>>`: dedent/indent
* `~`: toggle lowercase/uppercase

</div><div>

#### Replace

* `:s/old/new`: replace `old` with `new`
* `:s/old/new/g`: same, for all lines
* `:s/old/new/gc`: same but ask for confirmation before
* `:n,ms/old/new/g`: same but only n to m lines

Apply an operation before switching to the INSERTION mode:

* `s`: delete the character under the cursor
* `cc`: delete the current line
* `cw`: delete characters starting from the cursor position until the end of the word

Can only be used in command mode:

* `r`: replace the character under the cursor
* `R`: replace characters while ESC is not pressed
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `:w !sudo tee %`
* investigate the `.` (current line?)
* `$`: from the cursor until the end of the line
* `e`: end of the word
* `.`: under the cursor
* `c`: a line
* `^`: from the cursor until the start of the line
</div><div>

* `:!`: execute a command
* `:f nom`: rename a file
* `:e fichier`: open another file
* `:r fichier`: print and insert file
* `:!gcc`:  compile inside vim
</div></div>