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
* ...
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