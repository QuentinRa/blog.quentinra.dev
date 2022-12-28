# Cascading Style Sheets

<hr class="sr">

## Introduction

A CSS is a list of **rules** that are made of **selectors+properties**. For instance, you can say that every text in a paragraph (selector "p") will be red (property color=red): this is a rule. They are three ways to write CSS.

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

**2**: another style is overriding yours

* for **2**: try using `!important` or check the CSS used in the developers' tools

<hr class="sl">

## Selectors

This is a list of the selectors I know of

<table class="table table-bordered table-striped border-dark">
<thead><tr><th>Description</th><th>CSS</th><th>HTML matched</th></tr></thead>
<tbody>

<!-- Pseudo-classes -->
<tr>
<td><b>Pseudo-classes selector</b><br>

You can apply a style to something, but only the element is in a predefined state.

You got `:active`, `:checked`, `:focus`, `:disabled`, `:visited` and many more. You also got `:first-child`, `last-child`, or `:nth-child(1)` to select a child.

</td>
<td>

```css
button:hover { /* mouse over */ }
:not(p) { /* ... */ }
*:not(p) { /* same */ }
:is(h1, h2) { /* either h1 or h2 */ }
:where(...) { /* same, but
 the specificity=0 */ }
```
</td>
<td>
...
</td>
</tr>

</tbody>
</table>

And these four aren't selectors, but you can use them to factorize rules

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

You can apply a selector to elements filtered by another.<br> This is the same as for **path** without the constraint of being a direct child.
</td>
<td>
<pre><code class="language-css">p a { /* ... */ }</code></pre>
</td>
</tr>

<!-- + -->
<tr>
<td><b>Plus</b><br>

The style is applied on the first child of the selector (ex: first link inside a paragraph).
</td>
<td>
<pre><code class="language-css">p + a { /* ... */ }</code></pre>
</td>
</tr>

</tbody>
</table>

Of course, you got more of them, as you can [read here (W3Schools)](https://www.w3schools.com/CSSref/css_selectors.asp).

<hr class="sr">

## Values

Before digging into the properties, you must learn more about the values you can give them.

<details class="details-border">
<summary>Size</summary>
<br>

* a value (`0` is the only one that should not have a unit)
* a value with a unit (`1px`, ...). The most used unit is **px** (default, pixels), but you may check **rem**, **pc**, or **vh**.
* a percent such as `100%`
* an expression resulting in a value `calc(100% - 15px)`

A lot of properties will usually take 4 values `t r b l` (respectively top-right-bottom-left). You can either use `property-top: value` (to only set the top) or a shortcut

* `padding: ALL;` (t=r=b=l=ALL)
* `padding: Y X;` (t=b=Y, r=l=X)
* `padding: U V W;` (t=l=U, r=V, b=W)
</details>

<details class="details-border">
<summary>Color</summary>
<br>

You can use

* a name (`red`, `yellow`, etc.)
* the RGB function (ex: `rgb(r, g, b)` such as `rgb(255, 0, 0)` for red)
* the RGBA function (ex: `rgba(r, g, b, a)`, with alpha the transparency)
* the HEX code (ex: `#dd4411` or `#d41`)
</details>

<details class="details-border">
<summary>Variables</summary>
<br>

You may create variables (to store colors, sizes, etc.).

<pre><code class="language-css"
>/* declare */
:root { 
  --name: value;
}
/* use */
p { 
  color: var(--name);
}</code></pre>
</details>

<hr class="sl">

## CSS properties

The format is 

<pre><code class="language-css"
>selectors {
    property_name: property_value;
}</code></pre>

Notes

* write one per line 👍
* the `;` (semicolon) is optional, but add it 👍
* you may add `!important` to force a style 🤔
* the last style is applied ("*cascade*" 👈), or the last with important
  * to be accurate, each selector have a **specificity**, which is used to determine what property is the most relevant ([source](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity))
* you may use the value `inherit` to inherit the value of the parent

Usually, when you are learning CSS, you will go to other websites that you like, and learn by reading how they do something. You can also ask something on Stack Overflow, or you check websites such as W3Schools/YouTube (**don't copy-paste code, usually websites are under copyright**). I think that the best way to learn CSS, is to learn the syntax, then look on the WEB each time you need something new, and learn bit by bit, as there are **too many properties**.

<hr class="sr">

## My List of properties

<details>
<summary>Background</summary>

<pre><code class="language-css"
>div {
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
}</code>
</pre>
</details>

<details>
<summary>Text</summary>

<pre><code class="language-css"
>div {
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
}</code>
</pre>
</details>

<details>
<summary>Size and position</summary>

<pre><code class="language-css"
>div {
    width: 5px; /* width */
    height: 5px; /* height */

    display: block; /* display value. You can use none to hide something */

    position: absolute; /* relative, fixed */
    top: 0; /* try to set a position */ 
    left: 0;
    right: 0;
    border: 0;
    z-index: 1; /* if two div at the same pos,
    who is on top ? the one with the highest z index */

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
}</code>
</pre>
</details>

<details>
<summary>Others</summary>

<pre><code class="language-css"
>div {
    border: 1px solid #202735; /* add border, size=1px, type=solid and black */
    border-radius: 4px; /* border radius, round some button for instance */
    
    cursor: pointer; /* change cursor to "click"=pointer cursor */
    outline: none; /* for button, outline shown on focus */

    /** content is too big and the size is not enough,
    how should we handle the overflow?
     */
    overflow:hidden; /* hide */
    overflow:auto; /* show a scroll bar */

    list-style-type: none; /* change list style 😅 */
}</code>
</pre>
</details>
<br>

This is almost everything I used, and I'm considering myself to be a beginner. You should **at least know these**

|Property|Effect|
|----|----|
|background| set the background (image/color/...)|
|color| set the color of the text|
|text-decoration: none;|remove the underline under a link|
|display: none;| same as the attribute hidden in HTML|
|display: flex;| Read [about flex](https://www.w3schools.com/csS/css3_flexbox.asp), it's wonderful 😍 |
|border: size solid color;| add a border |
|padding|gap between a component, and it's border| 
|margin|gap between a component, and the "outside"|

<hr class="sl">

## Responsive design

This is most likely what will take most of your time, and why I switched to Bootstrap. Your user will use different resolutions when visiting your website, different browsers, and different platforms (mobile, tablet, computer, etc.). This is your job, that the website is properly rendered on each platform, and that's a practice called **responsive design**.

The first thing to do is to add this line in your HTML, so that the website will try to adapt itself according to the size of the screen

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

Then, we will write **media queries**. These are blocks in which you will declare the rules that should be used if the screen is lesser than "Xpx" or greater than "Ypx" or within "Xpx" and "Ypx".

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

You can use that to hide/show some buttons, change some component's positions, ...

> **edit 02/09/2021**: media queries are more complex than what I learned, you can [read more here](https://www.bitdegree.org/learn/media-css#media-types), as I saw a lot of times `@media (min-width: 950px) {}` instead of the code above with `screen and`.

<hr class="sr">

## Animations

I never used CSS animations (hence you may complete this part), but here are some links. It looks fun, and I hope someone will scout this for us

* [MDN - CSS animations](https://developer.mozilla.org/fr/docs/Web/CSS/CSS_Animations/Using_CSS_animations)
* [CSS-tricks - Animation Libraries](https://css-tricks.com/css-animation-libraries/)

<hr class="sl">

## External resources

Guidelines

* [List of guides](https://css-tricks.com/css-style-guides/)
* [CSS guidelines](https://cssguidelin.es/#css-selectors)
* [codeguide](https://codeguide.co/#css-syntax) (quite good, almost a summary of the two previous ones)

CheatSheets

* [Simple cheatsheet](https://devhints.io/css) (😍, not too much content, well-made)
* [CSS - Reference](https://cssreference.io/) (quite good to get explanations about something)

<hr class="sl">

## SCSS, SASS, and Less

You can use Less, SASS, or SCSS to write a sort of enhanced CSS. Both are similar, but the syntax is a bit different. You may read [JetBrains tutorial to configure watchers too (in PHPStorm)](https://www.jetbrains.com/help/phpstorm/transpiling-sass-less-and-scss-to-css.html#ws_sass_less_scss_syntax_highlighting) (you can enable/disable watchers).

```bash
npm install sass -g 
# watcher
sass --watch input.scss output.css
# or compile when you want
sass input.scss output.css
```

As always, [W3Schools got a tutorial about SASS](https://www.w3schools.com/sass/default.php). [SASS official documentation](https://sass-lang.com/guide) is quite good too.

<details class="details-border">
<summary>My notes about the syntax</summary>
<br>

<table class="table table-bordered table-striped border-dark">
<tr>
<td><b>Variables</b></td>
<td>

```scss
$name: #d41;
p { color: $name; }
```
</td>
</tr>

<tr>
<td><b>Inheritance</b></td>
<td>

```scss
p { }
p.red { @extend p; }
```
</td>
</tr>

<tr>
<td><b>Nested tags</b></td>
<td>

```scss
p { 
  color: #d41;
  span { color: #fc3; }
  &:hover { color: #0a53be; }
  :hover { color: #0a53be; }
}
```
</td>
</tr>

<tr>
<td><b>Mixin</b> (functions)</td>
<td>

```scss
@mixin some-mixin {}
.button { @include some-mixin; }

@mixin padding-x ($value) { padding-left: $value; padding-right: $value; }
.button { @include padding-x(1rem); }

// you can also declare rules inside a mixing
// or variables, or give default value to arguments
@mixin some-mixin2 ($val: 0px) {}

// you can call it anywhere
@include theme("dark", ...);
```
</td>
</tr>
<tr>
<td><b>Statements</b></td>
<td>

```scss
@if $value == something {} @else if /* ... */ {} @else {}
//ternary: if($value == something, 'if_true', 'if_false')
@each $i in value1, value1  { .#{i} {} }
// 12 included (=>through)
@for $i from 0 through 12 {}
@while $i <= 12 { $i: $i + 1; }
```
</td>
</tr>

<tr>
<td><b>Functions</b></td>
<td>

```scss
// mix 50% of color 1 and 100-50% of color2
mix(color1, color2, 50%)
lighten(color, 50%)
darken(color, 50%)
opacity(color, 0.5)
```
</td>
</tr>
<tr>
<td><b>Breaking into files</b></td>
<td>You can split a SCSS into files=modules, the modules are starting with a <code>_module.scss</code>. Then, in the main file, use

<pre class="language-scss"><code>@import 'module'</code></pre> (or @use)
</td>
</tr>

</table>
</details>

* [StyleGuide](https://www.toptal.com/css/sass-mixins-keep-your-stylesheets-dry)
* [Another style guide](https://www.toptal.com/front-end/sass-style-guide-a-sass-tutorial-on-how-to-write-better-css-code)