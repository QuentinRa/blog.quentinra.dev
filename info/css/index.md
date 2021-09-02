# Cascading Style Sheets

Cascading Style Sheets (CSS) are mainly used to style websites, and add some animations. I'm not an expert nor fond of CSS because CSS frameworks such as Bootstrap are providing most of the CSS that I need.

* How to write CSS
* What are selectors?
* List of CSS properties that I'm using the most
* What's responsive design?

> **Note**: as you are doing in HTML, good developer that you are 😎, you should test that your code is following the W3C standard [using this validator](https://jigsaw.w3.org/css-validator/#validate_by_input). You may also want to minimize your CSS (to make your page faster, as the size of the CSS will be reduced), you can do that with a [CSS minifier](https://css-minifier.com/). If you want to use a CDN, please refer to the WEB course.
>
> I did use it yet (please add explanations if you did here), but you can use SASS to generate CSS, which is working like TypeScript for JavaScript, or PHP to factorize HTML code. It seems useful to make themes (dark, light).

<hr class="sr">

## Introduction

A CSS is a list of **rules** that are made of **selectors+properties**. For instance, you can say that every text in a paragraph (selector "p") will be red (property color=red): this is a rule. They are three ways to write CSS.

<table class="table border-dark table-striped table-bordered">
<thead><tr><th>Inline CSS 🤮</th><th>CSS tag 🤢</th><th>External CSS 😍</th></tr></thead>
<tbody>
<tr>
<td>

Every tag in HTML got an attribute called **style**. Simply write the CSS inside.
```HTML
<p style="color:red;background: yellow;">
  ...
</p>
```
</td>
<td>

You can use one (or more) tag &lt;style&gt;, and put the CSS inside.

```HTML
<style>
p {
  color:red;
  background: yellow;
}
</style>
```
</td>
<td>

You can put the CSS in another file, write the CSS as we did in style, and link it to the HTML with

```html
<link rel="stylesheet" 
      href="/path/to/style.css">
```

This is the best way, as developers won't have to look every file for CSS. You will also be able to use CDN to speed up your website.

</td>
</tr>
</tbody>
</table>

<details>
<summary>
Usually, when using an external CSS, we are calling it <code>style.css</code>, you can make one for when we want to print the page <code>print.css</code>, and/or you can have one CSS file per page.
</summary>

```css
@charset "utf-8"; /* optional */

/* a comment */
p {
  color:red;
  background: yellow;
}
```
</details>

<details class="pt-3">
<summary><b>HELP!</b> I wrote some CSS, but I don't see any changes!?</summary>

They may be three problems **1**: you didn't use the good selector, **2**: another style is overriding yours, or **3**: your page is rendering using the cached CSS. The tips we are given are

* for **1**: try using background="red" or something like that, to check that the selector is good
* for **2**: try using `!important` or check the CSS used in the developers' tools
* for **3**: <kbd>CTRL+R</kbd> or <kbd>CTRL+SHIFT+R</kbd> or <kbd>SHIFT+F5</kbd> or <kbd>CTRL+F5</kbd>.

</details>

<hr class="sl">

## Selectors

This is a list of the selectors I know of

<table class="table table-bordered table-striped border-dark">
<thead><tr><th>Description</th><th>CSS</th><th>HTML matched</th></tr></thead>
<tbody>

<!-- Tag selector -->
<tr>
<td><b>Tag selector</b><br>
Simply write the tag, you want to select.
</td>
<td>
<pre><code class="language-css">p { /* ... */ }</code></pre>
</td>
<td>
<pre><code class="language-html">&lt;p>Some text&lt;/p></code></pre>
</td>
</tr>

<!-- ID selector -->
<tr>
<td><b>ID selector</b><br>
Each tag can have one ID, each ID is unique within a page.
</td>
<td>
<pre><code class="language-css">#my-id { /* ... */ }</code></pre>
</td>
<td>
<pre><code class="language-html">&lt;p id="my-id">...&lt;/p></code></pre>
</td>

<!-- Class selector -->
<tr>
<td><b>Class selector</b><br>
Each tag can have one or more classes, separated by a space.<br><br>
You can match a selector having every specified classes too.<br>You can also add a tag before a class.
</td>
<td>
<pre><code class="language-css">.name { /* ... */ }</code></pre>
<pre><code class="language-css">p.one.two { /* ... */ }</code></pre>
</td>
<td>
<pre><code class="language-html">&lt;p class="name">...&lt;/p></code></pre>
<pre><code class="language-html">&lt;p class="one two">...&lt;/p></code></pre>
</td>

<!-- Joker selector -->
<tr>
<td>

<b>Joker selector</b><br>
I may be the one one calling it like that.<br>
You can use `*` to select everything <br> 
(🤮 you should use body/html instead of `*`)
</td>
<td>
<pre><code class="language-css">* { /* ... */ }</code></pre>
</td>
<td>
<pre><code class="language-html">&lt;p>...&lt;/p>
&lt;div>...&lt;/div>
&lt;!-- .... --&gt;
</code></pre>
</td>
</tr>

<!-- State selector -->
<tr>
<td><b>State selector</b><br>
You can apply a style to something, but only the element is in a predefined state.
</td>
<td>

<details>
<summary>Show</summary>

```css
button:hover { 
  /* mouse on top of it */
}
input:checked { 
  /* selected/checked */
}
a:active { 
  /* active link */
}
input:focus { 
  /* typing ~= focused input */
}
button:disabled { /* ... */ }
a:visited {
  /* visited link */
}
```
</details>
</td>
<td>
<pre><code class="language-html">&lt;input type="radio" checked></code></pre>
</td>

<!-- Property selector -->
<tr>
<td><b>Property selector</b><br>
You can select something according to the values of its attributes.

You got <code>=</code> (equals), <code>*=</code> (contains) etc.
</td>
<td>
<pre><code class="language-css">input[type="radio"] {
  /* ... */
}</code></pre>
</td>
<td>
<pre><code class="language-html">&lt;p class="name">...&lt;/p></code></pre>
</td>

<!-- CSS functions -->
<tr>
<td><b>CSS functions</b><br>

You can use functions such as `:not(selector)`, to select every aside this selector.<br>
As you could guess, they are `State selectors`, so you can add a tag before not <span class="tms">(`a:not(.name)`: every link not having the class name)</span>.
</td>
<td>
<pre><code class="language-css">:not(p) { /* ... */ }
p:first-child { }
p:last-child { }
p:nth-child(1) { }
</code></pre>
</td>
<td>
<pre><code class="language-html">&lt;div>...&lt;/div></code></pre>
</td>

</tbody>
</table>

And there are three things that aren't selector, but you can use to factorize rules

<table class="table table-bordered table-striped border-dark">
<thead><tr><th>Description</th><th>CSS</th></tr></thead>
<tbody>

<!-- , -->
<tr>
<td><b>Comma</b><br>

You can apply the same rules to a bunch of selectors by separating them with a `,` (comma).
</td>
<td>
<pre><code class="language-css">p, a { /* ... */ }</code></pre>
</td>
</tr>

<!-- > -->
<tr>
<td><b>Path</b><br>

You can make a path by separating selectors with `>` (greater than). <br>Note that `a > b` means that b is a **direct child** of a.
</td>
<td>
<pre><code class="language-css">p > a { /* ... */ }</code></pre>
</td>
</tr>

<!-- space -->
<tr>
<td><b>Space</b><br>

You can apply a selector to elements filtered by another.<br> This is the same as **path** without the constraint of being a direct child.
</td>
<td>
<pre><code class="language-css">p a { /* ... */ }</code></pre>
</td>
</tr>

</tbody>
</table>

<hr class="sr">

## Sizes

You will be asked a lot of times to enter a size.
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

<hr class="sl">

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
* styles added at the end are the ones applied first (unless ``!important``
  is used)
* you may use the value ``inherit`` to make a property
value be inherited

And here we go! The main idea is that I'm listing some
styles you may use, then you go check on 
duckduckgo/google/w3school/StackOverflow
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

    /** content is too big and a little space,
    how should we handle the overflow?
     */
    overflow:hidden; /* hide */
    overflow:auto; /* show a scroll bar */
}
```

So let's talk about margin and padding. **margin** is the gap with
your tag the others **outside**. **Padding** is the gap between
our tag and the components **inside**. As shown
in the examples, values are

* if v : applied to all
* if v1 v2 : v1 for Y, v2 for X
* if v1 v2 v3 v4 : top right bottom left

and v can be a value (check size), a percent, or auto.

<hr class="sr">

## Responsive

THIS IS A CORE CONCEPT. The main idea is to adapt your
page according to the size of the screen. Adding
the line (viewport...) allows some basic resizing
but you will have to do a lot of this by yourself.

The main idea is that you will use media queries. Theses
sort of functions will contain a lot of classes that
you want to be used if the screen has a predetermined
size.

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

You can use that to hide/show some buttons, change some
component's positions, ...

<hr class="sl">

## Sources

* <http://www.iut-fbleau.fr/sitebp/web/wim11/css/>
* <https://www.w3schools.com/css/default.asp>
* <https://validator.w3.org/#validate_by_input>
* <https://perso.limsi.fr/annlor/enseignement/ensiie/pw/resume_html_css.pdf>