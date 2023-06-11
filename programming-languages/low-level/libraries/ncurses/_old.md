# Ncurses

<div class="row row-cols-md-2"><div>

```
wattron(w, color);
wattroff(w, color);
attron(A_BOLD);
attron(A_STANDOUT); // highlight
```
</div><div>

```c
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