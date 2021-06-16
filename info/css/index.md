# Introduction

CSS is mainly used to style websites. Here
you will learn how you can write some
basic CSS.

* this course may introduce SCSS and SASS
* Boostrap and any other CSS framework won't
be introduced in this course

<div class="sr"></div>

## Where do you write css ?

You should not use the first two and only
write a ``style.css`` file but it's good to know
them since they are quite used.

* [style attribute](how/attribute.md) (`style='...'`, not recommended)
* [style tag](how/tag.md) (`<style></<style>`, not recommended)
* [style file](how/file.md) (`style.css`)

<div class="sl"></div>

## Selectors

In order to apply some style to "something", you need
to defines this "something".

* [tag selector](selector/tag.md) (ex: style all "p" tags)
* [id selector](selector/id.md) (ex: style a tag with an ID)
* [class selector](selector/class.md) (ex: style a tag having this class)
* [path selector](selector/path.md) : use the three above
* [joker selector](selector/joker.md) : like ``*`` and root
* [state selector](selector/state.md) : checked, hover, ...

**BEWARE**: sometimes you might write CSS, refresh and no changes. That's
sometimes because you used the wrong selector or some error on your side,
but it may also be your browser that cached the page. Refresh
the cache using one of theses (the one working for you)

* CTRL+SHIFT+F5
* CTRL+F5
* CTRL+R
* CTRL+SHIFT+R

To check your selector, simply try adding a background to see what you are selecting.

<div class="sr"></div>

## Sizes

You will be asked a lot of times to enter a value of a size.
By default, values are in pixels ``px``. 

* ``width: 0px;`` valid for 0 you can remove px `width:0;`
* ``width: 15px;``

Aside from px, developers are choosing one of theses and
work with it

* ``rem`` (seems linked to font-size, used by boostrap)
* ``pc``
* ``mm`` (millimeters) and `cm` (centimeters)
* ``ch``: width of 0
* ``ex``: height of the font used
* ``vh``/`vw`: viewport height/width

You could and should use **percents** when you
can like ``100%``.

You can do some calculations with ``calc(...)``
like ``width: calc(100% - 15px);``

At this point, you are ready to write some css.