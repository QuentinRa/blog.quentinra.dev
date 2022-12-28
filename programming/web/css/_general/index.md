# Cascading Style Sheets (CSS)

**[Old notes](_old.md)**

<div class="row row-cols-md-2"><div>

Cascading Style Sheets (CSS) are used to **embellish**

* 🌍 Websites
* 🖥️ Desktop applications <small>(Electron/JavaFX/...)</small>
* 📱 Mobile applications <small>(Android XML layouts/...)</small>
* ...

And, we can also do nice **animations** in CSS.
</div><div>

As CSS can be complex, especially when we add rules to make the content adapt itself to different screen sizes, CSS frameworks are often used.

* [Bootstrap](https://github.com/twbs/bootstrap) (+160k ⭐)
* [tailwindcss](https://github.com/tailwindlabs/tailwindcss) (63.4k ⭐)
* Material Design <small>(Google guidelines)</small>
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

table.class tr > :not(td[colspan="7"], :first-child) {}

*[href] {}
*[d~='1.06L9.53'] {}
div:nth-child(2) {}
button[role="tab"][id][tabindex="-1"] {}
/* get selector from console */
```
</div></div>