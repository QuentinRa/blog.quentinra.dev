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

* [Variables](basic/variables.md)
* [Operators](basic/operators.md)
* [Statements](basic/statements.md)
* [Functions](basic/functions.md)
* [Basic functions](basic/functions-basic.md)
* [Include/Require](basic/include.md)
* [Arrays](basic/arrays.md)

<div class="sl"></div>

## Main concepts

* [Classes and objects](theme/classes.md)
* [Database and SQL](theme/sql.md)
* [Forms](theme/forms.md)
* [Sessions](theme/sessions.md)

<div class="sl"></div>

## MVC in PHP

...

<div class="sr"></div>

## Migration

...

<div class="sl"></div>