# Summary

[Go back](index.md#cheatsheet)

Here you have a summary of the commands you can use in VIM.

| Input | Action |
| ------ | ------ |
| a | Append: Move the cursor right, then enter in insert mode. |
| b | Move to the beginning of the previous word. |
| c [Space]	 | Delete a character and enter in edit mode. |
| ce | Delete from the cursor to the end of the word and enter in edit mode. |
| c$ | Delete from the cursor to the end of the line and enter in edit mode. |
| d[Space] | Delete one character. Same as "x". |
| dd | Delete one line. |
| [number]dd | Delete [number] lines. |
| e, E | Go to the end of the next word. |
| f | ???. |
| gg, G | Go to the beginning/end of the file. |
| h, j, k, l | Go Left, Down, Up, Right. |
| i | Enter in edit mode. |
| m | ??? |
| n, N | Search the next/previous occurrence (use it with the input "/" or "?") |
| o | Add a line, and then enter in edit mode. |
| p | Paste after the cursor. Paste the last copied content or the last deleted content. |
| P | Paste before the cursor. |
| q | ??? |
| r[input] | Replace the current character by the new one [Input]. |
| R | Enter in "replace mode". |
| s | ??? |
| t | ??? |
| u | Undo. See also: "Ctrl + r". |
| v | Visual: highlight areas of text. |
| w | Go to the beginning of the next word. |
| x | Delete one character. Same as "d[Space]". |
| y | In Visual mode (see "v"), copy the highlighted text. |
| yy | Copy the line. |
| z | ??? |
| ~ | Change UPPERCASE to lowercase, and vice-versa. |
| /[input] | Search the [input] (ASC). |
| ?[input] | Search the [input] (DESC). |
| >> | Indent. |
| << | Dedent. |
| 0 | Move to the beginning of the line. |
| ^ | Move to the first character of the line. |
| $ | Move to the end of the line. |
| % | If the cursor is in one of these characters: {, (, [, ], ), }, show the associated one. |
| ctrl + r | Redo. |
| :[number], [number]G | Go to line [number]. |
| :w | Save. |
| :q | Quit, if the file wasn't edited. |
| :wq | Save and quit. |
| :q! | Quit without saving. |