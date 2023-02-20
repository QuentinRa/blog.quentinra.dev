# PHP

<div class="row row-cols-md-2"><div>

PHP <small>(PHP Hypertext preprocessor, a recursive acronym)</small> is still a quite used language to dynamically generate HTML pages. You can use

* 🍛 Expressions <small>(e.g. dynamic values such as the current date)</small>
* 🔁 Loops <small>(for, foreach, while...)</small>
* 🔀 Branching <small>(if, else)</small>
* 🥬 Fetch data from a database/... to render a page
* 🦄 Handle HTML forms that are submitted

**Where to learn?**

* The [PHP manual](https://www.php.net/manual/en/langref.php) <small>(⛪, surprisingly easy to read)</small>
* [W3Schools/PHP](https://www.w3schools.com/php/default.asp) <small>(⛪)</small>

</div><div>

To install PHP, you will need a webserver such as [Apache](/operating-systems/webservers/apache/index.md). ➡️ Well-known versions of PHP are: `5.6`, `7.*`, and `8` <small>(latest, since 2020)</small>.

Additionally, you may install extensions later:

```ps
$ sudo apt install php-curl
$ sudo apt install php-intl
$ sudo apt install php-ext-dom
$ sudo apt install php-dom
$ sudo apt install php-mbstring
$ sudo apt install php-mysql
```

You can enable extensions on the server level, or you can edit each `php.ini` manually. On Linux, you can also use `sudo phpenmod xxx`.
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

#### Declare a variable

Types are implicit. The name starts with `$`.

```php
$n = 5; // integer
$n = 5.0; // double
$n = "5"; // string
$n = '5'; // string
$n = null; // null
$n = true; // true
$n = false; // false
```

#### Types

Types are: `boolean`, `integer`, `double`, `string`, `array`, `object`, `resource`, and `NULL`. You can check/get the type using:

```php
$someVariableType = gettype($someVariable); // get
if (is_integer($someVariable)) {} // check
```

#### Comments

```php
// a comment
/* a comment */
# a comment
```
</div><div>

#### Print some text

To print some text, you can use `echo`. You can also use `var_dump`, and `print_r`, but they are mostly used for debugging and objects/arrays.

```php
echo "XXX: $variable"; // ✅ $variable is replaced
echo 'XXX: $variable'; // ❌ not replaced
echo "XXX: a{$variable}z"; // ✅ $variable is replaced
echo "XXX: a".$variable."z"; // concatenation
// advanced: like in Bash, you can dynamically
// generate the name of the variable you want to call
echo "XXX: ${"variable"}";
```

#### Operators

...
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2"><div>

#### Branching

...
</div><div>

#### Loops

...
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

</div><div>

</div></div>