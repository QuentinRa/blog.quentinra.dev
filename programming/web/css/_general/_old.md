# Cascading Style Sheets

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