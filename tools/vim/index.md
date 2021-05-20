# Introduction

*vim*, for *vi improved*, is a text editor.
## How to install and run vim ?
### Windows

### MacOS

### Ubuntu, Debian

Install : `sudo apt-get install vim`
Run : `vim` or `vi`
Could take the file to open as an argument.
## HELP, I'm can't exit vim.
If you are trapped with vim, keep calm, and press `Esc`, then `:q!`.
`Esc` will bring (back) vim to its **normal mode** (if we could call it normal...).
`:q!` is the command to force to quit vim, that is to say, to exit vim without saving.

More generally, the **normal mode** of vim is the state where user's input served to do some special action (move the cursor, copy, paste, erase...).
`:` is use to run a command. E.g, `q` is the command to exit vim if no edit have been done , `q!` to exit without saving and `:wq` to save and exit.
In normal mode, press `i` to enter in **insert mode**, which is the mode where you can write some text such as every other text editor. Press `Esc` to exit this mode and return to the normal one.

## How to learn to use vim ?

The best way to learn how to use vim is... to use it.
However, and thankfully, you can open a terminal and write `vimtutor`, which will teach you the basics command to use vim peacefully, in exchange of ~30 minutes of your life and brain attention.
# Command
These are the command in **normal mode**.

<table>
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
		<th>d [Space]</th>
		<th>Delete one character.</th>
	</tr>
	<tr>
		<th>dd</th>
		<th>Delete one line.</th>
	</tr>
	<tr>
		<th>[Number]dd</th>
		<th>Delete [Number] lines.</th>
	</tr>
	<tr>
		<th>e</th>
		<th>???.</th>
	</tr>
	<tr>
		<th>h, j, k, l</th>
		<th>Go Left, Down, Up, Right </th>
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
		<th>n</th>
		<th>Search the next word (use it with the input "/")</th>
	</tr>
	<tr>
		<th>N</th>
		<th>Search the previous word (use it with the input "/")</th>
	</tr>
	<tr>
		<th>o</th>
		<th>Add a line, and then enter in edit mode.</th>
	</tr>
	<tr>
		<th>p</th>
		<th>???</th>
	</tr>
	<tr>
		<th>q</th>
		<th>???</th>
	</tr>
	<tr>
		<th>r[Input]</th>
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
		<th>w,x,y,z</th>
		<th>???</th>
	</tr>
	<tr>
		<th>~</th>
		<th>Change MAJUSCULE to minuscule, and vice-versa.</th>
	</tr>
	<tr>
		<th>/[input]</th>
		<th>Search the [input].</th>
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
		<th>^</th>
		<th>Move to the beginning of the line.</th>
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
		<th>Ctrl + r</th>
		<th>Redo.</th>
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
		<th>:q</th>
		<th>Quit without saving.</th>
	</tr>
</table>