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

## Basics

<div class="row row-cols-md-2"><div>

The current one is shown at the bottom left of the screen.

* `<nothing>` : the command/normal mode
* `INSERTION` : the insert/edit mode
* `VISUAL` : [...]
</div><div>

To exit VIM, you need to be in the command mode. Press <kbd>ESC</kbd> <small>(at least once)</small> to go back to it. Then, press `:` followed by the exit without saving command: `q!`. 👉 See the command section.

🦄 Not panicking in the key to success. Being trapped in VIM is a popular gag/meme, see these trolls: [how-to-exit-vim](https://github.com/hakluke/how-to-exit-vim) and [VimKiller](https://github.com/caseykneale/VIMKiller).
</div></div>