# Cascading Style Sheets (CSS)

<div class="row row-cols-md-2"><div>

Cascading Style Sheets (CSS) are used to style and animate

* 🌍 Websites
* 🖥️ Desktop applications <small>(Electron/JavaFX/...)</small>
* 📱 Mobile applications <small>(Android XML layouts/...)</small>
* ...

CSS files (`.css`) are defining **rules** <small>(ex: the color will be gray)</small> to apply on a target called **selector** <small>(ex: apply on every text)</small>. You can learn CSS on

* [MDN/CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) <small>(🚀)</small>
* [W3Schools/CSS](https://www.w3schools.com/css/default.asp) <small>(🏫)</small>

Some CSS tools

* 👉 Check the correctness of your CSS using [W3C Validator](https://jigsaw.w3.org/css-validator/#validate_by_input)
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
</div><div>

```
<meta
      name="viewport"
      content="width=device-width, height=device-height, viewport-fit=cover, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no"
  />
```

* pseudo-selector ([ex](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-line))

```css
.selector {
    white-space: pre-line; /* multilines */
    background: rgba(37,70,170,0.83) !important;
    width: 44px;
    opacity: 1;
}

table.class tr > :not(td[colspan="7"], :first-child) {}

*[href] {}
*[d~='1.06L9.53'] {}
div:nth-child(2) {}
button[role="tab"][id][tabindex="-1"] {}
/* get selector from console */
```
</div></div>