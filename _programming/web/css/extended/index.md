# Extended CSS

<div class="row row-cols-md-2"><div>

There are compilers allowing us to write an extended/enhanced CSS, that once compiled, will generate a `.css`.

They are used to make the CSS files much more readable and cleaner.
</div><div class="align-self-center">

* [SASS](https://github.com/sass/sass) (14.3k ⭐, `.scss`, `.sass`)
* [Less](https://github.com/less/less.js) (16.9k ⭐, `.less`)
* [Stylus](https://github.com/stylus/stylus) (11k ⭐, `.styl`)
</div></div>

<hr class="sep-both">

## 🐲 SASS 🐲

<div class="row row-cols-md-2"><div>

[SASS](https://github.com/sass/sass) (14.3k ⭐) is one of the two most-used ones.

* [Documentation](https://sass-lang.com/documentation/)
* [W3Schools](https://www.w3schools.com/sass/default.php)

```powershell
$ npm install sass
$ sass --watch input.scss output.css # auto-compile 😍
$ sass input.scss output.css # manually compile 😪
```

#### Variables

<p></p>

```scss
$name: #d41;
p { color: $name; }
```

#### Inheritance

<p></p>

```scss
.test { }
.test2 { @extend .test; }
```

#### Nested tags

You can use `&` to reference the parent. You can group sub-styles inside one parent, to make the code cleaner.

```scss
p {
  // both are the same ("p:hover")
  :hover { color: #0a53be; }
  &:hover { color: #0a53be; }
  // "p span"
  span { color: #fc3; }
  // div > p
  div > & { /* ... */ }
}
```

#### Mixin

<p></p>

```scss
// declare a mixin
@mixin padding-x ($value) { padding-left: $value; padding-right: $value; }
// use the mixin
.button { @include padding-x(1rem); }
// parameter with a default value
@mixin some-mixin2 ($val: 0px) {}
```
</div><div>

#### Statements

<p></p>

```scss
$value: 0;
p {
  // if - else if - else
  @if ($value == 0) { color: red; }
  @else if (0) { }
  @else {}
  // for i = 0; i <= 12; i++
  @for $i from 0 through 12 {}
  // while
  $i: 0;
  @while $i <= 12 {
    width: $i+px; // concatenation
    $i: $i + 1;
  }
}
```

#### Predefined functions

<p></p>

```scss
p {
  color: mix(#FF0033, #FF0033, 50%);
  color: lighten(#FF0033, 50%);
  color: darken(#FF0033, 50%);
}
```

#### Split your SCSS into modules

You can create modules to split your code. A module is usually named `_other.scss`, not `other.scss` ⚠️. They will be merged into the file importing them, and won't have their own `.css` file.

You can use "`use`" or "`import`" to import a module <small>(ex: `_other.scss`)</small>.

```scss
// both are the same
@use "other.scss";
@import "other";
```
</div></div>

<hr class="sep-both">

## 🥂 Less 🥂

<div class="row row-cols-md-2"><div>

[Less](https://github.com/less/less.js) (16.9k ⭐) is one of the two most-used ones.

* [Documentation](https://lesscss.org/#overview)
* [less-tester](https://www.lesstester.com/) or [less-preview](http://lesscss.org/less-preview/)
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [SASS nesting](https://markdotto.com/2015/07/20/css-nesting/)
* [PHPStorm watchers](https://www.jetbrains.com/help/phpstorm/transpiling-sass-less-and-scss-to-css.html#ws_sass_less_scss_syntax_highlighting)
</div><div>

* [StyleGuide](https://www.toptal.com/css/sass-mixins-keep-your-stylesheets-dry)
* [Another style guide](https://www.toptal.com/front-end/sass-style-guide-a-sass-tutorial-on-how-to-write-better-css-code)
</div></div>