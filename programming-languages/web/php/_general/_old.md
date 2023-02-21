# PHP Hypertext Preprocessor (PHP)

```php
// pretty print debug
echo "<pre>".var_dump($exception)."</pre>"
```

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