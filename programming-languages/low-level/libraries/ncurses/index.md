# NCurses

<div class="row row-cols-md-2"><div>

NCurses "new curses" is a successor of the curses library. It's a C library to write text-based interfaces <small>(e.g. interfaces in a terminal)</small>.

It's commonly used by Linux programs such as `vim`.

```shell!
$ # see also, [...]5-dev and [...]w5-dev
$ sudo apt-get install libncurses-dev
```

And, in your program, use:

```c
#include <ncurses.h> // or, use curses.h
```
</div><div>

**Features** ⭐

* 🎨 Background/Foreground color for text
* 🪟 Multiple windows
* 🎹 Keyboard/Mouse input
* 🎯 Cursor implementation
* 🐸 Extensions for forms, menus...
* ...

**Documentation** 📚

* [NCURSES Programming HOWTO](https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/intro.html) <small>(examples are stored on [git](https://github.com/tony/NCURSES-Programming-HOWTO-examples))</small>
* Dan Gookin's Guide to Ncurses Programming
</div></div>

<hr class="sep-both">

## Window system

<div class="row row-cols-md-2"><div>

#### Creating windows

To use ncurses within a terminal, you first need to initialize it:

```c
if ( initscr() == NULL ) {
    // handle error
    exit(1);
}
```

This will fill a global variable `stdscr` of type `Window*` which is the screen of your terminal. You **may** divide it in multiple separate windows:

```cpp
WINDOW* w = subwin(stdscr, height, width, pos_x, pos_y);
box(w, ACS_VLINE, ACS_HLINE); // show borders
```

➡️ It uses a coordinate system with the origin in the top-left corner. Use the global variables `LINES`/`COLS` to get the height/width of `stdscr`.
</div><div>

#### Using windows

There are two kind of macro/functions:

* those taking a window <small>(`Window*`)</small>
* those not taking a window <small>(`stdscr` is implicit)</small>

Common functions are:

* `refresh()`/`wrefresh(w)`: redraw the window
* `clear()`/`wclear(w)`: empty the window
* `endwin()`/`delwin(w)`: destroy a window

👉 Don't forgot to call `endwin()` at the end of your program. It will automatically destroy all sub-windows.
</div></div>

<hr class="sep-both">

## Display text

<div class="row row-cols-md-2"><div>

#### Cursor

The position of the cursor is where the text will be displayed, unless you specify a position explicitly.

```c
// get
int cursor_x = getcurx(w); // cursor column
int cursor_y = getcury(w); // cursor line
// set
move(cursor_x, cursor_y);
```

#### Display a text using a sort of `printf`

```c
// print where the cursor is
printw(format);
printw(format, args...);
// print at a specific location
mvwprintw(w, pos_x, pos_y, format);
mvwprintw(w, pos_x, pos_y, format, args...);
```

#### Display characters

```c
// print where the cursor is
addch(char); // or, waddch(w, char); 
addstr(char); // or, waddstr(w, char*);
// print at a specific location
mvwaddch(w, pos_x, pos_y, char);
mvwaddstr(w, pos_x, pos_y, char*);
```

#### Delete characters

```c
deleteln();                // delete a line
mvwdelch(w, pos_x, pos_y); // delete a character
```
</div><div>

#### Colors

Colors can only be used if the terminal supports it.

```c
if ( has_colors() == FALSE ) {
    // don't support colors
} else {
    // support colors, enable them
    start_color();
}
```

Colors are represented using a number. It can go from 0 to 256, but some terminals only support 0 to 8. To use a color, you need to wrap it inside a pair. A pair has a foreground color, and a background color.

```cpp
init_pair(pair_id, foreground, background);
```

➡️ There are aliases for basic constants: `COLOR_BLACK`...

To create new colors, use:

```cpp
init_color(color_id, 0, 0, 0); // not support by all
```

To use a pair:

```cpp
attron(COLOR_PAIR(pair_id)); // use for following text
attroff(COLOR_PAIR(pair_id)); // stop
wattron(w, COLOR_PAIR(pair_id)); // ...
```

Other text effects that can be enabled: `A_BOLD`, `A_STANDOUT`...
</div></div>

<hr class="sep-both">

## Reading input

<div class="row row-cols-md-2"><div>

You have to call some methods according to the behavior you want and the default settings (✅).

```cpp
noecho();    // don't print pressed keys
echo();      // ✅ do print pressed keys

nocbreak();  // wait for <enter> to process input
cbreak();    // ✅ don't wait for <enter> to process input

curs_set(TRUE);   // ✅ show cursor
curs_set(FALSE);  // hide cursor

keypad(w, TRUE);  // handle arrow keys as characters
keypad(w, FALSE); // ✅ don't handle arrow keys as characters
```

#### Mouse

...

</div><div>

#### Keyboard

If you're using `cbreak()`, you'll most likely read character by character using `getch()`. Otherwise, refer to `getstr(buffer)` documentation.

🤖 Both calls are blocking the program until they receive input.

```c
int ch = getch();

switch(ch) {
    case KEY_UP: // if keypad enabled
        // ...
        break;
    case 'r': // normal key pressed
        // ...
        break;
    case KEY_SEND: case KEY_ENTER: // enter pressed
        // ...
        break;
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>
</div><div>
</div></div>