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
* [joker selector](selector/joker.md) : other kind of selector

At this point, you are ready to write some css.

**BEWARE**: sometimes you might write CSS, refresh and no changes. That's
sometimes because you used the wrong selector or some error on your side,
but it may also be your browser that cached the page. Refresh
the cache using one of theses (the one working for you)

* CTRL+SHIFT+F5
* CTRL+F5
* CTRL+R
* CTRL+SHIFT+R

To check your selector, simply try adding a background to see what you are selecting.