# Cascading Style Sheets (CSS)

<div class="row row-cols-md-2"><div>

Cascading Style Sheets (CSS) are used to style and animate

* 🌍 Websites
* 🖥️ Desktop applications <small>(Electron/JavaFX/...)</small>
* 📱 Mobile applications <small>(Android XML layouts/...)</small>
* ...

**Where to learn?**

* [MDN/CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) <small>(🚀, [Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference))</small>
* [W3Schools/CSS](https://www.w3schools.com/css/default.asp) <small>(🏫, [Reference](https://www.w3schools.com/CSSref/index.php), [Default styles](https://www.w3schools.com/cssref/css_default_values.php))</small>
* [css-tricks](https://css-tricks.com/) <small>(🥂, articles)</small>
* [cssreference](https://cssreference.io/) <small>(😳, reference)</small>
* [css-cheatsheet](https://github.com/iLoveCodingOrg/css-cheatsheet) <small>(✈️ , cheatsheet)</small>
* [moderncss](https://moderncss.dev/)+[smolcss](https://smolcss.dev/) <small>(modern css)</small>
</div><div>

**CSS versions**

⚠️ CSS selectors/rules are now modularized, so CSS3 is the last CSS version. You should refer to [caniuse](https://caniuse.com/) to see what properties/... are supported, and ["CSS4"](https://css4-selectors.com/)/[CSSDB](https://cssdb.org/) for potential new features.

<br>

**Some CSS tools**

* Syntax ✅: [W3C Validator](https://jigsaw.w3.org/css-validator/#validate_by_input)
* Guidelines ‍🎓 : [cssguidelines](https://cssguidelin.es/) or [codeguide](https://codeguide.co/#css-syntax) or [Google](https://google.github.io/styleguide/htmlcssguide.html#CSS)
* Minifier 🐲: [css-minifier](https://css-minifier.com/) or [csso](https://github.com/css/csso)/[cli](https://github.com/css/csso-cli)/[JB](https://www.jetbrains.com/help/phpstorm/compressing-css.html)
* Lint 🧹: [stylelint](https://github.com/stylelint/stylelint) and/or [unsupported browser features linter](https://github.com/ismay/stylelint-no-unsupported-browser-features)
</div></div>

<hr class="sep-both">

## 🚀 CSS frameworks 🚀

As CSS rules can be complex <small>(responsive design, accessibility)</small>, many CSS frameworks with predefined rules were created.

<div class="row row-cols-md-2"><div>

* [Bootstrap](https://github.com/twbs/bootstrap) <small>(+160k ⭐, [see my notes](/programming/web/css/bootstrap/index.md))</small>
* [tailwindcss](https://github.com/tailwindlabs/tailwindcss) <small>(63.4k ⭐)</small>
* [semantic](https://github.com/Semantic-Org/Semantic-UI) <small>(50.3k ⭐)</small>
* [bulma](https://github.com/jgthms/bulma) <small>(46.6k ⭐)</small>
* [primer](https://github.com/primer/css) <small>(11.6k ⭐, GitHub)</small>
* ...
</div><div>

Based on Material Design (Google UX Guidelines)

* [Material Web](https://github.com/material-components/material-web) <small>(4.6k ⭐, in-progress)</small>
* [Materialize](https://github.com/Dogfalo/materialize) <small>(38.8k ⭐)</small>

</div></div>

<hr class="sep-both">

## 🏫 About CSS 🏫

<div class="row row-cols-md-2 mt-3"><div>

CSS files (`.css`) are defining **rules** to apply on a target called **selector**. A rule is made of a **property**, and its **value**.

<details class="details-n">
<summary>Example: Links should have the color blue. Every text in bold should have a yellow background.

<p></p>

```css
a {
    color: yellow;
}

b {
    background: blue;
}
```
</summary>

* Selector: Links (`a`) and texts in bold (`b`)
* Rule
  * Property: `color`, or `background`
  * Value: `yellow`, or `blue`
</details>

**Notes**

* 🔎 One rule per line is a good practice
* 🔎 The semicolon (`;`) is mandatory <small>(unless there is only one rule)</small>
</div><div>

#### Specificity

Styles are applied in **cascade**! There could be many selectors that are defining a rule that could be applied on the same tag.

If there are conflicts <small>(ex: two selectors defining the same property)</small>, the [**Specificity**](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity) is used to determine which rule is applied. In a nutshell, every selector has a weight <small>(~=how much specific the selector is)</small> which is used to determine which rule is more important.

```css
a { color: yellow; }
a:hover { color: red; } /* will override the other */
```

➡️ You can use `!important` to manually force a style to be applied.

```css
a { color: yellow !important; }
a:hover { color: red; } /* won't override the other */
```
</div></div>

<hr class="sep-both">

## Getting started

There are 3 ways to write CSS for a website.

<table class="table border-dark table-striped table-bordered">
<thead><tr><th>Inline CSS 🤮</th><th>STYLE tag 🤢</th><th>External CSS file 😍</th></tr></thead>
<tbody>
<tr>
<td>

You can use the attribute `style` to add inline CSS. It's convenient for testing.

```HTML
<p style="background: darkcyan">
    ...
</p>
```
</td>
<td>

You can use `<style>` tags. They are usually added in the `head`, but you can add them everywhere.

```HTML
<style>
    p {
        background: darkcyan;
    }
</style>
```
</td>
<td>

You can link an external CSS file. This is the proper way to do it <small>(CSP policy+caching, CDNs, SoC...)</small>.

```html
<link rel="stylesheet"
      href="/path/to/style.css">
```

⚠️ **Note**: Modern browsers are usually caching CSS files. If you changed a file, and don't see any changes, reload the page while ignoring the cache: <kbd>CTRL+SHIFT+R</kbd> or <kbd>SHIFT+F5</kbd> or <kbd>CTRL+F5</kbd>.
</td>
</tr>
</tbody>
</table>

<hr class="sep-both">

## Selectors

<div class="row row-cols-md-2"><div>

A selector is a target, or a set of targets, on which the style will be applied. ➡️ To test a selector, we usually change the background. If the background changes, it means that the selector works.

```css
YOUR_SELECTOR_HERE {
    background: yellow;
}
```

#### Tag selector

The style will be applied to every element having this tag.

<div class="row row-cols-md-2"><div>

```html
<p>xxx</p>
```
</div><div>

```css
p { /* ... */ }
```
</div></div>

#### Id selector

The style will be applied to the tag having the matching Id.

<div class="row row-cols-md-2"><div>

```html
<p id="my-id">xxx</p>
```
</div><div>

```css
#my-id { /* ... */ }
```
</div></div>

#### Class selector

The style will be applied to any tag having this class.

<div class="row row-cols-md-2"><div>

```html
<p class="name ...">xxx</p>
```
</div><div>

```css
.name { /* ... */ }
```
</div></div>

#### Universal selector

The style will be applied to every element.

<div class="row row-cols-md-2"><div>

```html
<p>xxx</p>
```
</div><div>

```css
* { /* ... */ }
```
</div></div>

#### Property/Attribute selector

We can select something based on them having a property.

<div class="row row-cols-md-2"><div>

```html
<p hidden>xxx</p>
```
</div><div>

```css
[hidden] { /* ... */ }
```
</div></div>

We can select something based on the value of a property.

<div class="row row-cols-md-2"><div>

```html
<input type="text" />
<path d="16 95 3"/>
```
</div><div>

```css
[type="text"] { /* ... */ }
[d~="95"] { /* ... */ }
```
</div></div>
</div><div>

#### Pseudo-selectors

They are additional selectors based on a state/condition. These are called Pseudo-classes. See the complete [list on W3Schools](https://www.w3schools.com/CSSref/css_selectors.php).

```css
:hover { /* mouse over */ }
:not(p) { /* every tag aside from "<p>" */ }
:not(p, a) { /* [...] aside from "<p>" and "<a>" */ }
:is(h1, h2) { /* either h1 or h2 */ }
:first-child { /* [ ... ] */ }
:nth-child(0) { /* [ ... ] */ }
:last-child { /* [ ... ] */ }
```

➡️ There are also Pseudo-elements providing access to a fake element. They start with `::` such as `::first-line`.

<br>

#### 👉 Chain selectors

We can chain any selectors!

<div class="row row-cols-md-2"><div>

```html
<p class="one two">xxx</p>
<input type="text" hidden>xxx</input>
```
</div><div>

```css
p.one.two { /* ... */ }
input[type="text"][hidden] { /* */ }
```
</div></div>

➡️ Using `.name` is the same as `*.name`...

<br>

#### 🛣️ Combinators

They can apply a selection based on the structure of the page.

```css
div, a { /* applied on both "div" and "a" */ }
div > a { /* "links" having a "div" as parent */ }
div a { /* "links" having a "div" as ancestor */ }
p + a { /* an adjacent "link" right after a "p" */ }
```

➡️ Obviously, you can use any selectors instead of `a`, `p`, and `div`.

</div></div>

<hr class="sep-both">

## 🥂 Properties Values 🥂

<p class="mt-3">
Properties <small>(ex: background)</small> are taking values <small>(ex: a color)</small>.
</p>

<div class="row row-cols-md-2"><div>

#### Colors

You can use `rgb`, `rgba` <small>(alpha=transparency)</small>, a hexadecimal code...

```css
.x {
    background: red; /* alias to a color */
    background: rgb(255, 0, 0); /* red */
    background: rgba(255, 0, 0, 0.8); /* lighter red */
    background: #dd4441; /** hexadecimal code **/
}
```

#### Sizes

You must provide a value, and a unit.

```css
.x {
    width: 10px; /* px = pixels */
    margin: 0; /* no unit needed */
    height: 100%; /* a percentage */
}
```
</div><div>

#### Calculations

You can only do some calculations inside `calc`.

```css
.x {
    width: calc(100% - 15px);
}
```

#### Variables

```css
:root {
    --primary-color: red;
    --p1: 10px;
}
p {
    color: var(--primary-color);
    padding: var(--p1); /* usage */
}
```
</div></div>

<hr class="sep-both">

## 🔎 Properties 🔎

<p class="mt-4">
👻 I'm not too familiar with CSS, these examples are properties that I used before moving to CSS frameworks. 👻
</p>

<div class="row row-cols-md-2"><div>

#### Background

```css
.xxx {
    background: yellow; /* change background */
    background: url("..."); /** path/url **/
    /* if it's an image, you may use */
    background-size: 100% 100%; /* expand */
    background-size: auto; /* auto */
    background-size: cover; /* cover */
    background-repeat: repeat;
    /* mix of rules */
    background: url("...") no-repeat fixed;
}
```

#### Colors

```css
.xxx {
    color: #FFDD33; /* text color */
}
```

#### Fonts

```css
.xxx {
    font-size: 15px; /* font size */
    /* the second/... are fallback fonts (if not found) */
    font-family: "Open Sans", sans-serif;
    font-weight: 400; /* bold, light, lighter, ... */
}
```

#### Display

```css
.xxx {
    display: block; /* show */
    display: none; /* hide */

    overflow:hidden; /* hide */
    overflow:auto; /* show a scroll bar */

    opacity: 1;

    position: absolute; /* relative, fixed */
    /* set a specific value */
    top: 0; left: 0; right: 0; border: 0;
    z-index: 1; /* on top = the highest z index */
}
```

</div><div>

#### Text utilities

```css
.xxx {
    line-height: 50px; /* ... */
    text-align: justify; /* center, left, right, ... */
    text-decoration: underline #dd4441; /* add underline */
    text-decoration: none; /* remove underline */
    white-space: pre-line; /* multiline */
}
```

#### Size, Margins, Padding

```css
.xxx {
    width: 5px; /* width */
    height: 5px; /* height */

    padding: 15px; /* all */
    padding: 15px 5px; /* y=15, x=5 */
    /* top, right, bottom, left */
    padding: 15px 5px 15px 5px;
    padding-bottom: 15px; /* one by one */
    /* you can use the 4 above with margin */
    /* and, you have this "new" value */
    margin: auto;
}
```

#### Alignment

```css
.xxx {
    justify-content: center;
    align-self: center;
    align-items: center;
    float: left;
    float: right;
}
```

#### Borders

```css
.xxx {
    /* add border, size=1px, type=solid and black */
    border: 1px solid #202735;
    border-radius: 4px; /* round corners */
}
```

#### Random

```css
.xxx {
    cursor: pointer; /* change cursor */
    list-style-type: circle; /* change list style */
    list-style-type: none; /* change list style */
}
```
</div></div>

<hr class="sep-both">

## Responsive design & Accessibility

<div class="row row-cols-md-2"><div>

You should adapt your website according to

* 👉 the browser <small>(browser-specific CSS properties)</small>
* 👉 the screen size <small>(media queries, responsive sizes...)</small>
* 👉 the mode (light/dark) <small>(media queries)</small>
* ...

#### Adapt to the size of the screen

First, you need to add **one of these** lines in your `head`, to make the website automatically adapt itself to the size of the screen.

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, height=device-height, viewport-fit=cover, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
```

Then, in your CSS, you can write CSS code that will only be executed when the condition of the **media query** is fulfilled.

```css
@media screen and (max-width: 950px) {}
@media screen and (max-width: 1100px) and (min-width: 950px) {}
```
</div><div>

#### Light/Dark theme

In modern browsers, there is a media query to detect the theme.

```html
<link rel="stylesheet" href="dark.css" media="(prefers-color-scheme: dark)">
<link rel="stylesheet" href="light.css" media="(prefers-color-scheme: light)">
```

➡️ The CSS files are intended to be used to define variables in **:root**, which will be used by another CSS file, such as `main.css`.

You can add a media query directly inside the CSS too.

```css
@media screen and (prefers-color-scheme: dark) { }
@media screen and (prefers-color-scheme: light) { }
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

**PostCSS**

* [postcss](https://github.com/postcss/postcss)
* [autoprefixer](https://github.com/postcss/autoprefixer)
* [preset](https://preset-env.cssdb.org/)
* [csstools](https://github.com/csstools)
* [postcss-scss](https://github.com/postcss/postcss-scss)

**Animations**

* [animate.css](https://github.com/animate-css/animate.css)
</div><div>

**Random**

* [csscss](https://github.com/zmoazeni/csscss)
* [stylecow](https://github.com/stylecow/stylecow)
* [stylable](https://stylable.io/)
* [ct](https://github.com/csswizardry/ct)
* get selector from console
* print.css
* `inherit`
* [Keeping Up With CSS](https://dev.to/5t3ph/keeping-up-with-css-3f20)
</div></div>