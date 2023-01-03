# PHP Hypertext Preprocessor (PHP)

You can use **PHP** to dynamically generate some part of your HTML. You will be able to use **statements**, **functions**, **loops**, **databases**, and many more things to make your code cleaner and more maintainable. We will soon be in **PHP8.1** (11-2021), but many are still in **PHP7/PHP7.4**, and some developers are still using the outdated **PHP5.6**.

There are alternatives to PHP, such as **Node.js**. You may [learn PHP on W3Schools](https://www.w3schools.com/PhP/default.asp), or maybe by reading the official documentation [reading the official reference](https://www.php.net/manual/en/langref.php) <small>(my recommendation, I would really want to read it completely)</small>.

> You need to set up a server to be able to run some PHP, and you need to be familiar with HTML. It's strongly advised to read the [Web course](../../../../programming/web/_general/_old/general/index.md) and the [HTML course](../../web/html/index.md) **beforehand**.

<hr class="sl">

## Composer

Before digging into PHP, you may want to install some libraries/frameworks (later). This is something that can be done quite easily (even on Windows), by installing [composer](https://getcomposer.org/).

```bash
# follows the steps, generate your config
$ composer init
$ composer install something
# $ composer install vendor/package:version (version optional)
$ composer update
```

And you have to write `require_once __DIR__ . '/vendor/autoload.php';` at the beginning of your file. The versioning is working the same [as for package.json in Node.js](https://nodejs.dev/learn/semantic-versioning-using-npm).

<hr class="sr">

## Writing PHP

You can only write **PHP** in a **.php**, but you can also write **HTML** inside. Everything is the same as for a HTML file, aside the fact that you can use the **PHP tag**, and write some PHP along the HTML.

<details class="details-e">
<summary>PHP code</summary>

```php
<?php // ex: index.php ?>
<!DOCTYPE html>
<html lang="fr">
<head><title>Hello world!</title></head>
<body>
<p><?php echo "Hello world"; ?></p>
<?php /* <?php echo "" ?> is the same as <?=""?> */ ?>
<p><?= "Date: ".date("Y-m-d")?></p>
</body>
</html>
```
</details>

**What the logic?**: you can **write** (echo) some code inside the HTML tags, which are evaluated before sending the HTML to the client. For instance, we wrote "Hello world" inside the first `p`, and we evaluated the second string with the date, and wrote it inside the second `p`. This is what resulting HTML code may looks like

```html
<!-- ... -->
<p>Hello world</p>
<p>Date: 2021-09-06</p>
```

<details class="details-border">
<summary>You will use <code>echo</code> a lot, but you got <code>var_dump</code> to debug/print an array, and <code>print_r</code> to print an array.</summary>
<br>

```php
<?php
echo "some text"; // some text
var_dump("some text"); // string(9) "some text"
print_r("some text") // some text
// pretty print array
echo "<pre>".print_r(array(5,6))."</pre>"
// pretty print debug
echo "<pre>".var_dump($exception)."</pre>"
```

</details>

<hr class="sr">

## Basic concepts

* [Variables](basic/variables.md)
* [Operators](basic/operators.md)
* [Structures](basic/structures.md)
* [Functions](basic/functions.md)
* [Basic functions](basic/functions-basic.md)
* [Include/Require](basic/include.md)
* [Arrays](basic/arrays.md)

<table class="table border-dark table-bordered table-striped">
<tr><th class="text-center">Other notes about the Language</th></tr>
<tr><td>If there is no HTML after a PHP bloc, you can omit <code>?&gt;</code></td></tr>
<tr><td>You can write comments with <code>//</code>, <code>/**/</code>, or <code>#</code>.</td></tr>
</table>

<hr class="sl">

## Main concepts

After learning almost all the syntax needed, here some concepts that you will surely use in PHP.

* [Classes and objects](main/classes.md)
* [Database and SQL](main/sql.md)
* [MongoDB / NoSQL](main/mongodb.md)
* [Handling Forms](main/forms.md)
* [Sessions](main/sessions.md)
* [Login/Logout](main/login_logout.md)

<hr class="sl">

## MVC in PHP

The MVC is an architectural pattern, in which you are splitting your code into

* **View**: what you will show to the user
* **Model**: the data of your application, usually the SQL-related classes/files
* **Controller**: classes that will fetch some data from the model and render the view

For instance, you could have a view for the head, one for the footer, and one view for the main content of each page. When you want to GET a page, the controller will write the head, get some data from the database (if needed), pass it to the view for the main content, and then write the footer.

<hr class="sr">

## Migration

<details class="details-e">
<summary>Notes from PHP5.6 to PHP 7</summary>

* change `<? ?>` to `<?php ?>`
* `ereg` deleted, `mbstring` deleted/moved, `mktime` changed
* `list` replaced by `str_split`, and foreach changed
* sessions changed
* `mysql` deprecated, use `mysqli`
</details>

<details class="details-e">
<summary>Notes in PHP7</summary>

* add function returns types
* add function arguments types
</details>

<details class="details-e">
<summary>Notes in PHP8</summary>

* add unions return types
* add annotations
</details>

<hr class="sl">

## Tests with PHPUnit

You can write some tests in PHP using `phpunit`. You may read the [course about Tests](../../proj/tests/index.md) beforehand.

You can install PHPUnit using composer like this `composer require --dev phpunit/phpunit^9.5`, but you should read the [documentation](https://phpunit.readthedocs.io/en/9.5/installation.html#composer). I'm using PHPStorm to compile and run my tests, but maybe you could do that with `phpunit test_file.php` using the command-line (not tested).

* [TestSuite](tests/file.md)
* [Assertions](tests/assertions.md)

<hr class="sr">

## Sources

* <https://www.javatpoint.com/get-vs-post>
* <https://www.php.net/manual/fr/language.operators.php>
* <https://www.php.net/manual/fr/language.basic-syntax.php>
* <https://www.w3schools.com/php/default.asp>
* <https://www.php.net/manual/fr/language.constants.php>
* <https://www.php.net/manual/fr/language.oop5.php>
* <https://www.php.net/manual/fr/reserved.variables.server.php>
* <https://www.php.net/manual/fr/reserved.variables.session.php>
* <https://www.php.net/manual/fr/reserved.variables.cookies.php>
* <https://www.php.net/manual/fr/language.functions.php>
* <https://www.php.net/manual/en/functions.anonymous.php>
* <https://stackoverflow.com/questions/4094701/do-i-need-to-have-when-do-i-need-captcha>