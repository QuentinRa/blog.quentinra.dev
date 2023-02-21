# PHP Hypertext Preprocessor (PHP)

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

<table class="table border-dark table-bordered table-striped">
<tr><th class="text-center">Other notes about the Language</th></tr>
<tr><td>If there is no HTML after a PHP bloc, you can omit <code>?&gt;</code></td></tr>
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