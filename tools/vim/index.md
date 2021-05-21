# vim

*vim*, for *vi improved* is a text editor, at least in the basic
version of it.

You may find extensions like

* GVim
* neovim

## How to install and run vim ?

You can install it using ``sudo apt-get install vim``
or whatever command you use to install packages
such as ``sudo aptitude install vim``.

Then you can run it with `vim` or `vi`, commands that could
take a file in argument such as ``vim file``. The file is created
if it's don't exists.

### HELP, I'm can't exit vim.

If you are trapped in vim, keep calm, 
and press `esc` (escape key), then `:q!`.

* `esc` will bring (back) vim to its **normal mode** 
 (if we could call it normal...).
* `:q!` is the command to force to quit vim, that is to say, to
to exit vim without saving.

### Basic configuration

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

* `INSERTION` : called insert/edit mode
* `<nothing>` : called command/normal mode

More generally, the **normal mode** (or command mode)
of vim is the state where user's input served to do some
special action (move the cursor, copy, paste, erase...).

`:` is use to run a command. E.g, `q` is the command to exit vim
if no edit have been done , `q!` to exit without saving and
`wq` to save and exit...

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

# ... and now mastering it

The best way to learn how to use vim is... to use it.
However, and thankfully, you can open a terminal and write
`vimtutor`, which will teach you the basics command 
to use vim peacefully, in exchange of ~30 minutes of your
life and brain attention.

Here some details about basic commands

* [insert](commands/insert.md)
* [move](commands/move.md)
* [delete](commands/delete.md)
* [copy](commands/copy.md)
* [search](commands/search.md)
* [replace](commands/replace.md)
* [others commands](commands/others.md)
* [cgi syntax](commands/cgi.md)
* [mystic commands](commands/special.md)

Here you have a summary

<table class="table table-bordered mb-3 table-striped">
	<tr>
		<th>Input</th>
		<th>Action </th>
	</tr>
	<tr>
		<th>a</th>
		<th>Append : Move the cursor right, then enter in insert mode. </th>
	</tr>
	<tr>
		<th>b</th>
		<th>Move to the beginning of the previous word.</th>
	</tr>
	<tr>
		<th>c [Space]</th>
		<th>Delete a character and enter in edit mode.</th>
	</tr>
	<tr>
		<th>ce</th>
		<th>Delete from the cursor to the end of the word and enter in edit mode.</th>
	</tr>
	<tr>
		<th>c$</th>
		<th>Delete from the cursor to the end of the line and enter in edit mode.</th>
	</tr>
	<tr>
		<th>d[Space]</th>
		<th>Delete one character. Same as "x".</th>
	</tr>
	<tr>
		<th>dd</th>
		<th>Delete one line.</th>
	</tr>
	<tr>
		<th>[number]dd</th>
		<th>Delete [number] lines.</th>
	</tr>
	<tr>
		<th>e, E</th>
		<th>Go to the end on the next word.</th>
	</tr>
	<tr>
		<th>f</th>
		<th>???.</th>
	</tr>
	<tr>
		<th>gg, G</th>
		<th>Go to the beginning/end on the file.</th>
	</tr>
	<tr>
		<th>h, j, k, l</th>
		<th>Go Left, Down, Up, Right. </th>
	</tr>
	<tr>
		<th>i</th>
		<th>Enter in  **edit mode**.</th>
	</tr>
	<tr>
		<th>m</th>
		<th>???</th>
	</tr>
	<tr>
		<th>n, N</th>
		<th>Search the next/previous occurrence (use it with the input "/" or "?")</th>
	</tr>
	<tr>
		<th>o</th>
		<th>Add a line, and then enter in edit mode.</th>
	</tr>
	<tr>
		<th>p</th>
		<th>Paste after the cursor. Paste the last copied content or the last deleted content.</th>
	</tr>
	<tr>
		<th>P</th>
		<th>Paste before the cursor.</th>
	</tr>
	<tr>
		<th>q</th>
		<th>???</th>
	</tr>
	<tr>
		<th>r[input]</th>
		<th>Replace the current character by the new one [Input].</th>
	</tr>
	<tr>
		<th>R</th>
		<th>Enter in "replace mode".</th>
	</tr>
	<tr>
		<th>s</th>
		<th>???</th>
	</tr>
	<tr>
		<th>t</th>
		<th>???</th>
	</tr>
	<tr>
		<th>u</th>
		<th>Undo. See also : "Ctrl + r".</th>
	</tr>
	<tr>
		<th>v</th>
		<th>Visual : Create a highlight areas of text.</th>
	</tr>
	<tr>
		<th>w</th>
		<th>Go to the beginning of the next word.</th>
	</tr>
	<tr>
		<th>x</th>
		<th>Delete one character. Same as "d[Space]".</th>
	</tr>
	<tr>
		<th>y</th>
		<th>In Visual mode (see "v"), copy the highlight text.</th>
	</tr>
	<tr>
		<th>yy</th>
		<th>Copy the line.</th>
	</tr>
	<tr>
		<th>z</th>
		<th>???</th>
	</tr>
	<tr>
		<th>~</th>
		<th>Change UPPERCASE to lowercase, and vice-versa.</th>
	</tr>
	<tr>
		<th>/[input]</th>
		<th>Search the [input] (ASC).</th>
	</tr>
	<tr>
		<th>?[input]</th>
		<th>Search the [input] (DESC).</th>
	</tr>
	<tr>
		<th>>></th>
		<th>Indent.</th>
	</tr>
	<tr>
		<th><<</th>
		<th>Dedent.</th>
	</tr>
	<tr>
		<th>0</th>
		<th>Move to the beginning of the line.</th>
	</tr>
	<tr>
		<th>^</th>
		<th>Move to the first character of the line.</th>
	</tr>
	<tr>
		<th>$</th>
		<th>Move to the end of the line.</th>
	</tr>
	<tr>
		<th>%</th>
		<th>If the cursor is in one of these characters : {, (, [, ], ), }, show the associated one.</th>
	</tr>
	<tr>
		<th>ctrl + r</th>
		<th>Redo.</th>
	</tr>
	<tr>
		<th>:[number], [number]G</th>
		<th>Go to line [number].</th>
	</tr>
	<tr>
		<th>:w</th>
		<th>Save.</th>
	</tr>
	<tr>
		<th>:q</th>
		<th>Quit, if the file wasn't edited.</th>
	</tr>
	<tr>
		<th>:wq</th>
		<th>Save and quit.</th>
	</tr>
	<tr>
		<th>:q!</th>
		<th>Quit without saving.</th>
	</tr>
</table>

## Sources

* Harry UNG (ENSIIE Student)
* Quentin RAMSAMY–AGEORGES (ENSIIE Student)

References
* <https://en.wikipedia.org/wiki/Vim_(text_editor)>
* <https://neovim.io/doc/>