# IT Project

This is a review about ENSIIE IT Project (2nd
semester) taught by Dimitri WATEL.

You will have some specifications about a Game (in C) and
will work with 3 others persons following the
directives.

* ``lot_a``: create the `.h` files
* ``lot_b``: make the game (v1)
* ``lot_c``: improve the game (graphical interface?
  in another language? ...)
  
You can find our code [here](https://github.com/lgs-games/prim/tree/master/version_c),
we got 20/20.
  
<hr class="sr">

## Lot_a

I think that you should take a bit a time thinking about
the project before digging into the code.

Read the subject once, then try to note what 
your understood. Read the subject again when you got a hint
that you may have skipped something.

Read the subject again, and this time, try drawing what
the games would look like. By know you should a at least
a little understanding of what you need to create.

Then gather your teammates and create a UML Diagram,
or anything you want summarizing

* what are the types
* what are the functions

You may use the subject to find that out but making
a great ``lot_a`` will be asking you to simulate your
functions like this methods is calling this one with
these parameters... Check if the types are good, like

* should you use a pointer here?
* can this value be a constant?
* be careful of return types, sometimes you will 
  return a value but a value **can't be null**
  
Then write your function, your main, ... You may add
some ``.h``, or request the teacher if you can use
english names, ... COMMENT YOUR CODE (you may use
[doxygen](../../tools/doxygen/index.md)).

Do not write the content of your structure (you should
think about it, we did, but the teacher want you to
make a declaration like this)

```c
// you will declare Map later, for instance in a .c
typedef struct Map_S Map;

// you can use map but don't know what's
// a map
Map *map_create(Difficulty dif);
```

**Recap**

* think about types (records with their properties)
  but you will only put the record declaration in the
  ``.h``
* think about methods, like their name (try making sure
  everyone will use the same kind of names so we don't
  have a map_create and a staff_new... or that we don't
  add newStaff and create_map...)
* think about return types (don't forget a value
  can't be NULL)
* comment your code, using Doxygen would be a good idea

Once your team knows what they need to do, everything
will go smoother.