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

A default css file will probably look like this

```css
@charset "UTF-8";

html {
    /* */
     see the difference if you made a "back to top"
     button through */
    scroll-behavior:smooth;
}
```

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

**And if you feel now that you got many selectors, you are wrong**,
check out [here](https://www.w3schools.com/cssref/css_selectors.asp)
and [here](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors)
if you want more. What you just read was only my handmade list.

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

<div class="sl"></div>

## CSS properties

The format is 

```css
selector {
    property_name: property_value;
}
```

Notes

* write one per line (or not, I won't)
* must add a ``;`` if you add more than one property
* specify the unit unless the value is 0
* you may add ``!important`` to force a style
* the style added at the end are the one applied first (unless important
  is used)
* you may use the value ``inherit`` to make a property
value be inherited

And here we go! The main idea is that I'm listing some
styles you may use, then you go check on duckduckgo/google/w3school/stackoverflow
how you could use it if you don't understand.

```css
div {
    background: yellow; /** change background **/
    background: rgb(255,0,0); /** change background **/
    background: rgba(255,0,0, 0.8); /** change background with alpha=transparency **/
    background: #dd4441; /** use a hexadecimal code **/
    background: url("..."); /** url is a path or a real url **/
    /* if it's an image, you can play with it */
    background-size: 100% 100%;
    background-size: auto;
    background-size: cover;
    background-repeat: repeat;
    
    color: red; /* working like background */
    font-size: 15px; /* font size */
    font-family: "Open Sans", sans-serif; /* change font-family, try using
     "Open Sans" then ... until the last one. In case of something no-specific
     link "sans-serif" than any font passing the requirement is used. */
    font-weight: 400; /* font weight, you could also write bold, ligh,
     lighter, ... */
    line-height: 50px;
    
    text-align: justify; /* center, left, right, ... */
    text-decoration: underline #dd4441; /* add underline */
    text-decoration: none; /* remove underline */
    
    width: 5px; /* width */
    height: 5px; /* height */
    
    display: block; /* display value. You can use none to hide something */
    
    border: 1px solid #202735; /* add border, size=1px, type=solid and black */
    border-radius: 4px; /* border radius, round some button for instance */
    
    cursor: pointer; /* change cursor to "click"=pointer cursor */
    outline: none; /* for button, outline shown on focus */
}
```

Adding some position-related styles

```css
div {
    position: absolute; /* relative, fixed */
    top: 0; /* try to set a position */ 
    left: 0;
    right: 0;
    border: 0;
    z-index: 1; /* if two div at the same pos,
    who is on top ? the one with the highest z index */
    
    /** explained bellow */
    margin: auto;
    padding: 15px; /* all */
    padding: 15px 5px; /* top=bottom=15, left=right=5 */
    padding: 15px 5px 15px 5px; /* top, right, bottom, left */
    padding-bottom: 15px; /* manually */
    
    /* so convenient to center a div */
    justify-content: center;
    align-self: center;
    align-items: center;
    /* or you may have to look around flex box*/
    display: flex;
    /* or maybe you would like */
    float: left;
    float: right;

    /** too many thing and a little space,
    how should we handle the overflow?
     */
    overflow:hidden; /* hide */
    overflow:auto; /* show a scroll bar */
}
```

...

<div class="sr"></div>

# Responsive

```css
@media screen and (max-width: 950px) {
    /* the style declared here will only
     be used is the width is lesser than
     950px. */
}

@media screen and (max-width: 1100px) and (min-width: 950px) {
    /* ... */
}
```