# PHP Hypertext Preprocessor (PHP)

You can use **PHP** to dynamically generate some part of your HTML. You will be able to use **statements**, **functions**, **loops**, **databases**, and many more things to make your code cleaner and more maintainable. We will soon be in **PHP8.1** (11-2021), but many are still in **PHP7/PHP7.4**, and some developers are still using the outdated **PHP5.6**.

There are alternatives to PHP, such as **Node.js**. You may [learn PHP on W3Schools](https://www.w3schools.com/PhP/default.asp), or maybe by reading the official documentation [reading the official reference](https://www.php.net/manual/en/langref.php) <small>(my recommendation, I would really want to read it completely)</small>.

> You need to set up a server to be able to run some PHP, and you need to be familiar with HTML. It's strongly advised to read the [Web course](../web/index.md) and the [HTML course](../html/index.md) **beforehand**.

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

## Start writing some PHP

Now that you got a server, you can only run some PHP
if you are using an URL (no drag and drop like in HTML
possible). You will write a file ending with ``.php``.
If the file is called ``index`` then you don't
need to write it in the URL.

Finally, note that you can write HTML inside
a PHP file, but not PHP inside an HTML file.

```php
<?php // sort of ${HTML_FOLDER}/test/index.php, so I will use http://localhost/test/index.php ?>
<!DOCTYPE html>
<html lang="fr">
<head><title>TODAY date</title></head>
<body>
    <p>
    <?php
        // The content is evaluated by the server
        // before sending the resulting HTML to the client
        // so the client will have something like this
        // <p>Hello World, we are the xxxx-xx-xx !</p>
        echo "Hello World, today we are the ".date("Y-m-d")." !";
    ?>
    </p>
</body>
</html>
```

So you should have a better understanding of what we will do.
We will write some code and use methods
like echo where the result will be printed in the resulting
HTML giving us your final HTML file requested by
the client.

<hr class="sr">

## Basic concepts

First of all, 

* you need a ``;`` at the end of each line (one exception)
* you can make comments using ``//`` or `/* */`
* you can also make comments with ``#`` but that's
usually used for specials comments
  
Then note that to write some PHP, you
need to write a PHP tag like this

```php
<?php
// some php code here
?>
<!-- here it's HTML not PHP -->
```

Then here you go with the syntax

* [Variables](basic/variables.md)
* [Operators](basic/operators.md)
* [Structures](basic/structures.md)
* [Functions](basic/functions.md)
* [Basic functions](basic/functions-basic.md)
* [Include/Require](basic/include.md)
* [Arrays](basic/arrays.md)

And two tips

* first you don't have any HTML inside your
PHP file, then don't add a ``?>`` a the end
* second, if you are doing this
```php
<?php echo "Hello World!" ?>
```
Then you can use the reduced form that automatically
calls echo

```php
<?="Hello World!"?>
```

<hr class="sl">

## Main concepts

After learning almost all the syntax needed, here
concepts that you will surely use in PHP.

* [Classes and objects](theme/classes.md)
* [Database and SQL](theme/sql.md)
* [MongoDB / NoSQL](theme/mongodb.md)
* [Handling Forms](theme/forms.md)
* [Sessions](theme/sessions.md)
* [Login/Logout](theme/login_logout.md)

One last piece of advice, about security, is to be
aware of XSS injections. In a form, one
can write SQL but also ``HTML/JS``. Someone could
write for instance ``<script>malicious_script();</script>``
as username. When we go on his/her profile,
you will echo this HTML like your usual username
so anyone reading this page
will have the malicious script being executed (if you
enabled scripts that is).

To prevent this, simply escape tags using 
``htmlentities`` like ``echo htmlentities($username)``.

<hr class="sl">

## MVC in PHP

The MVC is a design pattern, in which the idea 
splitting your code into

* View: what you will show to the user
* Model: the data of your application, usually the SQL part
* Controller: will fetch data from the model, render the view

Usually, your website will have a router that will call
a method according to the page requested like ``home``,
`contact`, ...

Each of these methods is in a controller and the controller
will fetch data from the model if needed, init some
variable or a session, handle $_POST/$_GET if needed
and render send everything so that the view only
need to be rendered using the variables already created
and properly set/formatted.

Usually, a page is not **one** view but a lot of views
like a header, a page-specific view, and the footer
so the controller need to ask all of these to render
themselves.

<hr class="sr">

## Migration

Notes from PHP5.6 to PHP 7

* change ``<? ?>`` to `<?php ?>`
* ``ereg`` deleted
* ``mbstring`` deleted/moved
* ``mktime`` changed
* ``list`` replaced by `str_split` and foreach changed
* session handling changes
* ``mysql`` deprecated, use `mysqli`

Notes in PHP7

* add function returns types
* add function arguments types

Notes in PHP8

* add unions return types
* add annotations

<hr class="sl">

## Tests with PHPUnit

Following the [tests](../../proj/tests/index.md) course,
you can write some tests in PHP using ``phpunit``.

You can install it using composer 
``composer require --dev phpunit/phpunit ^9.5``
but you may check the 
[documentation](https://phpunit.readthedocs.io/en/9.5/installation.html#composer)
if you are new to that.

I'm using PHPStorm to compile and run my tests, but
maybe you could do that ``phpunit test_file.php``
using the command-line.

* [test file](tests/file.md)
* [assertions](tests/assertions.md)

You may also check

* [testing-php-errors-warnings-and-notices](https://phpunit.readthedocs.io/en/9.5/writing-tests-for-phpunit.html#testing-php-errors-warnings-and-notices)
* [assertions](https://phpunit.readthedocs.io/en/9.5/assertions.html)
* [annotations](https://phpunit.readthedocs.io/en/9.5/annotations.html)

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