# Ncurses

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [gist](https://gist.github.com/alan-mushi/c8a6f34d1df18574f643)
* [HowTo](https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/forms.html)
</div><div>

<details class="details-n">
<summary>Old notes</summary>

Using ncurses

NCurses is a graphic library to create beautiful
interfaces in a terminal. I you do know the
great ``VIM`` editor, then the interface was made with
ncurses. It's simple and really easy to learn.

You can install ncurses using

* ``sudo apt-get install libncurses5-dev libncursesw5-dev``
* check installed with ``ls -la /usr/include/ncurses.h``

You may check these resources

* <https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/>
* <https://github.com/tony/NCURSES-Programming-HOWTO-examples>
</details>


</div></div>

<hr class="sep-both">

<div class="row row-cols-md-2"><div>

```
// close
bool r = endwin();
if ( !r )
    // error

mvwprintw(w, 0, 0, " %2d", some_number);
mvwprintw(mapWindow, 0, 0, "xxx");

wattron(w, color);
wattroff(w, color);
attron(A_BOLD);
attron(A_STANDOUT); // highlight

move(0, 0)

mvwaddstr(w, 0, 0, str);
waddstr(w, str);
mvwaddch(w, 0, 0, char);
mvwdelch(w, 0, 0);
```
</div><div>

```c
// hide cursor
noecho();
cbreak();
curs_set(FALSE);
keypad(w, TRUE);
wclear(w);
// reset
echo(); //show printed charaters
nocbreak(); // don't save into buffer until <enter> pressed
curs_set(TRUE);
keypad(window, FALSE);

int ch = getch();
case KEY_RIGHT:
case KEY_SEND: case KEY_ENTER: // both
case 'b':

    //init colors
    if ( has_colors() == FALSE ) {
        // don't support colors
    } else {
        // start colors
        start_color();
    }

// colors goes from 0 to 255
    /*for ( short i = 0; i < 255; i++ ) {
        // init
        init_color(i, 0, 0, 0);
        // new color as foreground, black as background
        init_pair(i, i, COLOR_BLACK);
    }*/
    for ( short i = 0; i < 8; i++ ) {
        init_pair(i, i, COLOR_BLACK);
    }
    
attr_t color = COLOR_PAIR(COLOR_WHITE);
```
</div></div>