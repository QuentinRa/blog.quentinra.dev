# PHP

PHP is a language to run some code before sending a
web page. You have a lot of things not available in HTML
such as

* **statements**: loops, if, ...
* **functions**: you can create function or use them
in order to factorize some code, change some values
on your page (dates, translations, ...) etc.
* **server-side code**: when submitting a form, uploading
a file, ... you need your web server to handle it.
* **sessions**: you can store some data so that your
website remember that you are logged in what
we call a session.
  
PHP isn't the only way to do that, some developers are now using
JS with Node.js for example to handle the server-side logic.

<div class="sr"></div>

## Setup

In order to run some php code, you first need a server. Some
developers are directly coding a the server, or in 
other word they are coding, sending file to the server
then check the website. That's not a good practice...

* You can setup a [(virtual) local server](setup/wamp.md)
* You can setup a [apache server on linux](setup/apache.md)
* use some IDE! For instance, I know that
[PHPStorm](../../tools/jetbrains/phpstorm/remote.md)
allow you to create a remote project and is automatically
uploading changes on the server (paid but free
if you register with your student email). Check out
if your IDE is doing it!

<div class="sl"></div>

## Start writing some PHP

Now that you got a server, you can only run some php
if you are using an URL (no drag and drop like in html
possible). You will write a file ending with ``.php``.
If the file is called ``index`` then you don't
need to write it in the url.

Finally, note that you can write HTML inside
a PHP file, but not PHP inside a HTML file.

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
We will actually write some code and use methods
like echo were the result will be printed in the resulting
HTML giving us your final HTML file requested by
the client.

<div class="sr"></div>

## Basic concepts

First of all, 

* you need a ``;`` at the end of each line (one exception)
* you can make comments using ``//`` or `/* */`
* you can also make comments with ``#`` but that's
usually used for specials comments
  
Then note that in order to write some php, you
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

* first you you don't have any HTML inside your
php file, then don't add a ``?>`` a the end
* second, if you are doing this
```php
<?php echo "Hello World!" ?>
```

Then you can use the reduced form that automaticaly
calls echo

```php
<?="Hello World!"?>
```

<div class="sl"></div>

## Main concepts

* [Classes and objects](theme/classes.md)
* [Database and SQL](theme/sql.md)
* [Forms](theme/forms.md)
* [Sessions](theme/sessions.md)

<div class="sl"></div>

## MVC in PHP

The MVC is a design pattern, in which the idea 
splitting your code into

* View: what you will show to the user
* Model: the data of your application, usually the SQL part
* Controller: will fetch data from the model, render the view

Usually, your website will have a router that will call
a methods according to the page requested like ``home``,
`contact`, ...

Each of theses methods is in a controller, and the controller
will fetch data from the model if needed, init some
variable or a session, handle $_POST/$_GET if needed
and render send everything so that the view only
need to be rendered using the variables already created
and properly set/formatted.

Usually, a page is not **one** view but a lot of views
like a header, a page-specific view, and the footer
so the controller need to ask all of theses to render
themselves.

<div class="sr"></div>

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

<div class="sl"></div>

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