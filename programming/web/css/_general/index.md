# Cascading Style Sheets (CSS)

<div class="row row-cols-md-2"><div>

Cascading Style Sheets (CSS) are used to style and animate

* 🌍 Websites
* 🖥️ Desktop applications <small>(Electron/JavaFX/...)</small>
* 📱 Mobile applications <small>(Android XML layouts/...)</small>
* ...

CSS files (`.css`) are defining **rules** <small>(ex: the color will be gray)</small> to apply on a target called **selector** <small>(ex: apply on every text)</small>. You can learn CSS on

* [MDN/CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) <small>(🚀, [Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference))</small>
* [W3Schools/CSS](https://www.w3schools.com/css/default.asp) <small>(🏫, [Reference](https://www.w3schools.com/CSSref/index.php))</small>

Some CSS tools

* 👉 Check the **correctness** of your CSS using [W3C Validator](https://jigsaw.w3.org/css-validator/#validate_by_input)
</div><div>

CSS selectors/rules are added modularized, so CSS3 is the last CSS version. You should refer to [caniuse](https://caniuse.com/) to see what's supported, and [CSS4](https://css4-selectors.com/) for new selectors that may be added to CSS modules.

As CSS rules can be complex <small>(responsive, accessibility)</small>, many **CSS frameworks** with predefined rules were created.

* [Bootstrap](/programming/web/css/bootstrap/index.md) (+160k ⭐)
* [tailwindcss](https://github.com/tailwindlabs/tailwindcss) (63.4k ⭐)
* Material Design <small>(Google UX Guidelines)</small>
    * [Material Web](https://github.com/material-components/material-web) (4.6k ⭐, in-progress)
    * [Materialize](https://github.com/Dogfalo/materialize) (38.8k ⭐)
* [bulma](https://github.com/jgthms/bulma) (46.6k ⭐)
* [primer](https://github.com/primer/css) (11.6k ⭐, GitHub)
* [semantic](https://github.com/Semantic-Org/Semantic-UI) (50.3k ⭐)
* ...
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

A selector is a target, or a set or targets, on which the style will be applied. ➡️ To test a selector, we usually change the background. If the background changed, it means that the selector works.

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

#### Universal/Joker selector 🃏

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
p + a { /* an adjacent "link" right-after a "p" */ }
```

➡️ Obviously, you can use any selectors instead of `a`, `p`, and `div`.

</div></div>

<hr class="sep-both">

## 🔎 Properties 🔎

<div class="row row-cols-md-2"><div>

#### Background

```css
.xxx {
    background: yellow; /* change background */
    background: rgb(255,0,0); /* change background */
    background: rgba(255,0,0, 0.8); /* 0.8=transparency **/
    background: #dd4441; /** use a hexadecimal code **/
    background: url("..."); /** path/url **/
    /* if it's an image, you may use */
    background-size: 100% 100%;
    background-size: auto;
    background-size: cover;
    background-repeat: repeat;
}
```

#### Texts & Links

```css
.xxx {
    color: red; /* text color */
    font-size: 15px; /* font size */
    font-family: "Open Sans", sans-serif; /* font-family */
    font-weight: 400; /* bold, light, lighter, ... */
    line-height: 50px;

    text-align: justify; /* center, left, right, ... */
    text-decoration: underline #dd4441; /* add underline */
}

a {
    text-decoration: none; /* remove underline */
}
```
</div><div>

#### Position and alignment

```css
div {
    width: 5px; /* width */
    height: 5px; /* height */

    display: block; /* show */
    display: none; /* hide */

    position: absolute; /* relative, fixed */
    /* set a specific value */
    top: 0; left: 0; right: 0; border: 0;
    z-index: 1; /* on top = the highest z index */

    padding: 15px; /* all */
    padding: 15px 5px; /* y=15, x=5 */
    /* top, right, bottom, left */
    padding: 15px 5px 15px 5px;
    padding-bottom: 15px; /* one by one */
    margin: auto;

    justify-content: center;
    align-self: center;
    align-items: center;
    display: flex;
    float: left;
    float: right;
}
```

#### Random

```css
div {
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
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Bootstrap icons/others
* SASS (see TP2/...)

```
$ npm i -g csso
$ npm i -g csso-cli
```

* Less ([less-tester](https://www.lesstester.com/), [less-preview](http://lesscss.org/less-preview/))
* Stylus/Compass
* [animate.css](https://github.com/animate-css/animate.css)
* [autoprefixer](https://github.com/postcss/autoprefixer)
* [css-tools](https://github.com/csstools)
* [style-lint](https://github.com/ismay/stylelint-no-unsupported-browser-features)
* [ct](https://github.com/csswizardry/ct)
* [CSS minifier](https://css-minifier.com/) + [configure a watcher to auto-compile css to min.css](https://www.jetbrains.com/help/phpstorm/compressing-css.html)
* get selector from console
* print.css
</div><div>

```
<meta
      name="viewport"
      content="width=device-width, height=device-height, viewport-fit=cover, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no"
  />
```

```css
.selector {
    white-space: pre-line; /* multilines */
    background: rgba(37,70,170,0.83) !important;
    width: 44px;
    opacity: 1;
}
```

```css
@charset "utf-8"; /* optional */

/* a comment */
p {
    color:red;
    background: yellow;
}
```
</div></div>