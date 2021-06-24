# Web - PWR

This course is supposed to help ENSIIE student 
to sail in the Web course. 

First, you need to know that in 2020-2021

* we did a "mini-project" (only one grade)
* that we could reuse or not in the Web project

<hr class="sl">

## START

Your websites will be accessible
with a URL like this ``http://pgsql.pedago.ensiie.fr/~prenom.nom/``.
You will have to create a public_html folder and set
some permissions.

* [Set public_html](parts/public_html.md)
* [Project Workflow](parts/workflow.md)

<hr class="sl">

## ERROR 500 (Internal server error)

Sometimes you may have an **error 500** like everything
was working and now you can't check your website. Note
that this is because you got a critical error in your code
and the errors are disabled.

* [Enable errors](parts/errors.md)

<hr class="sl">

## Database

First, the database can only be accessed from the
inside, meaning you need to be on the server to run it. 
You can use a ``SSH Tunel`` like
in PHPStorm but that won't be explained here.

```php
<?php
$c = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp");
```

* [Create a database account](parts/db-acc.md)
* [Database errors](parts/db-err.md)
* [Artificial keys](parts/db-ak.md)

<hr class="sl">

## W3Validator

W3Validator is used to verify if you are writing your code
using good practices. You will be asked to check that
your website is good for W3.

* [Validator](parts/validator.md)

<hr class="sr">

## Tips

Use an IDE to code, I recommend PHPStorm since you
could configure easily to work directly on the server
(you may check a video or the section PHPStorm in
[Jetbrains](../../tools/jetbrains/index.md) course).

* try making a mockup of your website, like drawing
your website pages (you may use your hand and we don't
  need something beautiful)
  * using this mockup
  * write how you move from a page to another
    (data submitted? ...)
  * this will help to organize your work and writing
    your specifications
  * you may check [HMI](../../proj/hmi/index.md) course

* you should do some tests, this is quite easy to do.
  You should use them to test your code like testing your
  login method with all sort of input (field missing,
  invalid input, too long/short, wrong type, ...)
  
* use MVC. You will learn faster if you splitting your 
  code into section (like HTML/VIEW SQL/DB and the brain
  interacting with the two) because your code will be more
  readable