# PHP

PHP is a language to run some code before sending a
web page. You have a lot of things not available in HTML
such as

* **statements**: loops, if, ...
* **functions**: you can create a function or use them
  to factorize some code, change some values
  on your page (dates, translations, ...), etc.
* **server-side code**: when submitting a form, uploading
  a file, ... you need your webserver to handle it.
* **sessions**: you can store some data so that your
  website remember that you are logged in what
  we call a session.
  
PHP isn't the only way to do that, some developers are now using
JS with Node.js for example to handle the server-side logic.

<div class="sr"></div>

## Setup

To run some PHP code, you first need a server. Some
developers are directly coding on the server, or in other 
words, they are coding then sending their files to the 
server then check the website. That's not a good practice...

* You can set up a [(virtual) local server](setup/wamp.md)
* You can set up a [apache server on linux](setup/apache.md)
* use some IDE! For instance, I know that
[PHPStorm](../../tools/jetbrains/phpstorm/remote.md)
allow you to create a remote project and is automatically
uploading changes on the server (paid but free
if you register with your student email). Check out
if your IDE is doing it!

<div class="sl"></div>

## Routing

Here we go. Now that you are using URLs, you need
to learn a bit about how they work.

Let's says we have some website here: ``http://localhost/index.php``.
First ``index.php`` may be omitted since it's the file
loaded by default. Next everything after the server
name like ``localhost`` here is called URI.

Then  ``http://localhost/test/file.php`` means that
you got a folder ``test`` and a file `file.php` inside
your server root folder.

On Linux, don't forget to set **the permissions** for
a folder like

* chmod ``700``: seems like the minimum for a .php
* chmod ``744``: seems like the minimum for a .html
* chmod ``711``: seems like the minimum for a folder

If not already done, and you are using public_html
folder

* chmod ``711`` on your home folder
* chmod ``711`` on public_html folder

Note that public_html is a shortcut for your
server root folder, but each user will have a server
folder accessible like that
``https://server.name.tld//~username/index.php`` and
index.php being in ``[...]/username/public_html/index.php``.

<div class="sl"></div>

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

<div class="sr"></div>

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

<div class="sl"></div>

## Main concepts

After learning almost all the syntax needed, here
concepts that you will surely use in PHP.

* [Classes and objects](theme/classes.md)
* [Database and SQL](theme/sql.md)
* [Handling Forms](theme/forms.md)
* [Sessions](theme/sessions.md)

One last piece of advice, about security, is
beware of XSS injections. In a form, one
can write SQL but also ``HTML/JS``. Someone could
write for instance ``<script>malicious_script();</script>``
as username. When we go on his/her profile,
you will echo this HTML like your usual username
so anyone reading this page
will have the malicious script being executed (if you
enabled scripts that is).

To prevent this, simply escape tags using 
``htmlentities`` like ``echo htmlentities($username)``.

<div class="sl"></div>

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