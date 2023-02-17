# Web - PWR

This course is supposed to help ENSIIE students to sail in the Web course. Your websites will be accessible with a URL like this `http://pgsql.pedago.ensiie.fr/~prenom.nom/`. You will have to create a public_html folder and set some permissions.

* [Set public_html](parts/public_html.md)
* [Project Workflow](parts/workflow.md)

In 2020-2021,

* we did a "mini-project" (the only grade, no MCQ)
* and we could reuse the code or not in the Web project

<hr class="sl">

## ERROR 500 (Internal server error)

Sometimes you may have an **error 500** like everything was working, and now you can't check your website. This is because you got a critical error in your code and the errors are disabled.

* [Enable errors](parts/errors.md)

<hr class="sr">

## Database

First, the database can only be accessed from the inside, meaning you need to be on the server to access it. You can use a ``SSH Tunnel`` like in PHPStorm, but that won't be explained here.

```php
<?php
$c = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp");
```

* [Create a database account](parts/db-acc.md)
* [Database errors](parts/db-err.md)
* [Artificial keys](parts/db-ak.md)

<hr class="sl">

## W3Validator

W3Validator is used to verify if you are writing your code using good practices. You will be asked to check that your website is following W3 standards.

* [Validator](parts/validator.md)

<hr class="sr">

## Tips

Use an IDE to code, I recommend PHPStorm since you could easily work directly on the server (you may look for videos on YouTube or the section PHPStorm in [JetBrains](../../tools/jetbrains/index.md) course).

* try making a mock-up of your website, like drawing your website pages

  * you may use tools introduced in the [HMI course](../../../proj/hmi/index.md) (no need for something beautiful)

  * write how you move from a page to another (data submitted? what kind of data? click? on what? etc.)

  * this will help you organize your work, and writing your specifications.

* you should write some tests, this is quite easy to do. You should use them to test your code, like testing your login method with all sorts of inputs (field missing, invalid input, too long/short, wrong type, ...)

* use MVC. You will learn faster if you're splitting your code into sections (like HTML/VIEW SQL/DB and the brain interacting with the two) because your code will be more readable