# Vim text editor

<div class="row row-cols-md-2"><div>

Vim <small>(vi improved)</small> is a terminal text editor that is often used along nano mostly when there is no graphical interface 🐉.

```bash
# create or open a file
$ vim file
```

👉 Some are using an unofficial "modern vim": [neovim](https://neovim.io/).
</div><div>

Install vim 🗃️

```bash
$ sudo apt-get install vim
```

Learn vim 📚

* `vimtutor`: a command-line course <small>(~30 minutes)</small>
* [vimsheet](https://vimsheet.com/) or [rtorr](https://vim.rtorr.com/): some vim cheatsheets
</div></div>

<hr class="sep-both">

## Get started

<div class="row row-cols-md-2"><div>

The current one is shown at the bottom left of the screen.

* `<nothing>` : the command/normal mode
* `INSERTION` : the insert/edit mode
* `VISUAL` : [...]
</div><div>

To exit VIM, you need to be in the command mode. Press <kbd>ESC</kbd> <small>(at least once)</small> to go back to it. Then, press `:` followed by the exit without saving command: `q!`. 👉 See the command section.

🦄 Not panicking in the key to success. Being trapped in VIM is a popular gag/meme, see these trolls: [how-to-exit-vim](https://github.com/hakluke/how-to-exit-vim) and [VimKiller](https://github.com/caseykneale/VIMKiller).
</div></div>

<hr class="sep-both">

## Configuration

<div class="row row-cols-md-2"><div>

You can configure your editor by creating a file `~/.virmrc`. You can find useful configurations online. Look for `dotfiles vim`.

You can also add plugins to vim such as [ale](https://github.com/dense-analysis/ale) for IDE-like features.

<details class="details-n">
<summary>Add ALE to VIM</summary>

```bash
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
```

* [viniciusgerevini](https://github.com/viniciusgerevini/dotfiles/blob/master/vim/.vimrc) dotfile
* `sudo apt-get install vim-runtime`
* `sudo apt-get install vim-gui-common`

Using CTRL+P, you got autocompletion.
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

<div class="row row-cols-md-2"><div>

#### Start editing

To switch to the INSERTION mode in which you can edit the file:

* `i`/`a`: insert before/after the cursor
* `I`/`A`: insert at the beginning/end of the line
* `o`/`O`: insert at the line under/above ours

#### Move the cursor

🎯 You must be in the command mode.

<div class="row row-cols-md-2"><div>

* `h`: move left ⬅️
* `j`: move down ⬇️
* `k`: move up ⬆️
* `l`: move right ➡️
</div><div>

* `0` or `CTRL-^`/`$` : move the beginning/end of the line
* `gg`/`G`: start/end of the file
* `w`/`e`: start/end of a word
</div></div>

You can jump to a line with: `xG` <small>(ex: "5G")</small> or `:x` <small>(ex: ":5")</small>.
</div><div>

#### Commands

<div class="row row-cols-md-2"><div>

* `:wq`: save and exit
* `:q!`: exit without saving
* `:q`: exit
</div><div>

* `u`: undo
</div></div>

#### Delete

* `nx`/`nX`: `n` characters under/before the cursor
* `d^`: every character of the line until the cursor
* `D` or `d$`: every character until the end of the line
* `dd`/`ndd`: delete the current line
* `:n,md`: delete lines starting from the line `n` until the line `m`

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `:w !sudo tee %`
* investigate the `.` (current line?)
</div><div>


</div></div>