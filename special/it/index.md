# IT Project

This is a review of the ENSIIE IT Project (2nd
semester) taught by Dimitri WATEL.

You will have some specifications about a Game (in C) and
will work with 3 other persons following the
directives.

* ``lot_a``: create the `.h` files
* ``lot_b``: make the game (v1)
* ``lot_c``: improve the game (graphical interface?
  in another language? ...)
  
You can find our code [here](https://github.com/lgs-games/prim/tree/master/version_c),
we got 20/20.
  
<hr class="sr">

## Lot_a

In the ``lot_a``, you need to write into headers
files

* functions
* type declarations but not their actual
content
* document everything (using Doxygen if you want to be great)

```c
// you will declare Map later, for instance in a .c
typedef struct Map_S Map;

// you can use map but don't know what's
// a map
Map *map_create(Difficulty dif);
```

The hardest thing is planning what you will code
like

* returns value or pointer? (remember that
  a value **can't** be NULL)
* argument should be const? (value like int, ...
  are already const)
* should your argument be a pointer or not? (
  are you going to modify the
  address (pointer) or only the content
  (not)?)

Our notes

* read the subject once, make some notes about the rules
* read the subject again, try making a graphical version
  to understand better what kind of things you are
  going to create or manipulate like the properties
  of your types
* **COMMENT YOUR CODE** (you may use
  [doxygen](../../tools/doxygen/index.md))
* think about the names (try making sure
  everyone will use the same kind of names so we don't
  have a map_create and a staff_new... or that we don't
  add newStaff and create_map...)
  * we used the ``file_name_aFunctionName``
  kind of syntax like in ``map.h`` we would
    have ``ErrorCode map_endTurn(Map *m);``
  * note that we are returning Codes instead
  of booleans so that we can log/translate
    easily the errors

You should think by now about some things like

* will you translate your game?
* will you have different graphical
  interface? (terminal one and a graphical one
  for instance)
  * if you do, try to think if you should
  add some methods like ``interface_init``
  or ``interface_close`` that may be used
  by graphical engines to set up themselves
* ...