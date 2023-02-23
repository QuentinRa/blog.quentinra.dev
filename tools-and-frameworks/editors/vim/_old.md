# Surviving in vim ...

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