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

## SASS

<div class="row row-cols-md-2"><div>

[SASS](https://github.com/sass/sass) (14.3k ⭐) xxx.

* [Documentation](https://sass-lang.com/documentation/)
</div><div>

...
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* SASS (see TP2/..., [nesting](https://markdotto.com/2015/07/20/css-nesting/))
* Less ([less-tester](https://www.lesstester.com/), [less-preview](http://lesscss.org/less-preview/)) and [LESS](https://lesscss.org/)
* Stylus/Compass

You can use Less, SASS, or SCSS to write a sort of enhanced CSS. Both are similar, but the syntax is a bit different. You may read [JetBrains tutorial to configure watchers too (in PHPStorm)](https://www.jetbrains.com/help/phpstorm/transpiling-sass-less-and-scss-to-css.html#ws_sass_less_scss_syntax_highlighting) (you can enable/disable watchers).

```bash
npm install sass -g 
# watcher
sass --watch input.scss output.css
# or compile when you want
sass input.scss output.css
```

As always, [W3Schools got a tutorial about SASS](https://www.w3schools.com/sass/default.php). [SASS official documentation](https://sass-lang.com/guide) is quite good too.
</div><div>


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
</div></div>