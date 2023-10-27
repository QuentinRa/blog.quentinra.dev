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

To install PHP, you will need a web server such as [Apache](/operating-systems/cloud/webservers/apache/index.md). ➡️ Well-known versions of PHP are: `5.6`, `7.*`, and `8` <small>(latest, since 2020)</small>.

Additionally, you may install extensions later:

```shell!
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

## Get started

<div class="row row-cols-md-2"><div>

Inside a `.php` file, most of the time, there are both HTML and PHP.

```phpt!
<p><?php echo "Hello, World!"; ?></p>
```

The PHP blocks (`<?php ?>`, `<?= ?>`) will be executed, and an HTML file will be generated and sent to the client.

```html
<p>Hello, World!</p>
```

👉 As we may have a lot of PHP blocks to echo something, the block `<?= ?>` was introduced as an implicit `echo`.

```phpt!
<p><?= "Hello, World!" ?></p>
```
</div><div>

➡️ Sometimes, you have files with only PHP inside. In such a scenario, you can omit the closing `?>`.

➡️ You can omit `;` in PHP blocks with only one instruction.

#### Imports another PHP

You can import another PHP script using `require` <small>(raise an error if the import failed)</small> or `import` <small>(don't mind failed includes)</small>. Most of the time, you want a script to be imported once, which could be done with `xxx_once`.

```php
include "test.php";
include_once "test.php";
require "test.php";
require_once "test.php";
```
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

#### Declare a variable

Types are implicit. The name starts with `$`.

```php!
$n = 5; // integer | int
$n = 5.0; // float
$n = "5"; // string
$n = '5'; // string
$n = null; // null
$n = true; // boolean | bool
$n = false; // boolean 
```

You can also declare constants either using `const`, or `define`. The latter should be used when the right-hand value is a non-const variable.

```php!
// same as define ('XXX', 5);
const XXX = 5;
echo XXX;
```

➡️ Before PHP7.3, constants were case-insensitive, meaning we could call the constant above with "Xxx" or "xxx" and it worked.

Finally, you can declare global variables. This can be used to allow functions to use external variables, or to *nicely* pass variables between scripts.

```php
global $g_someVariable; // declare
$g_someVariable = 150; // assign

// later
global $g_someVariable; // declare (load existing value)
echo $g_someVariable; // output: 150
```

#### Types

Types are: `boolean`, `integer`, `double`, `string`, `array`, `object`, `resource`, and `NULL`. You can check/get the type using:

```php!
$someVariableType = gettype($someVariable); // get
if (is_integer($someVariable)) {} // check
```

➡️ PHP uses "Type juggling" meaning the variable is converted based on the context <small>(ex: inside an if statement, it is converted to a boolean...)</small>

</div><div>

#### Comments

```php!
// a comment
/* a comment */
# a comment
```

#### Print some text

To print some text, you can use `echo`. You can also use `var_dump`, and `print_r`, but they are mostly used for debugging and objects/arrays.

```php!
echo "XXX: $variable"; // ✅ $variable is replaced
echo 'XXX: $variable'; // ❌ not replaced
echo "XXX: a{$variable}z"; // ✅ $variable is replaced
echo "XXX: a".$variable."z"; // ✅ concatenation
// advanced 🧐: like in Bash, you can dynamically
// generate the name of the variable you want to call
echo "XXX: ${"variable"}";
var_dump($variable); // print debug information
```

#### Operators

Every basic [operator](/programming-languages/_paradigm/stuff/operators.md) is available.

* arithmetic: `+`, `-`, `*`, `/`, `+=`, `-=`, `*=`, `/=`, `**` (power), `%` (mod), `^` (xor)
* comparison: `>`, `>=`, `<=`, `<`
* booleans: `&&`, `||`, `!` (not)
* booleans: `and`, `or` <small>(use &&/||)</small>

For equality operators, there are two: `===` and `!==` <small>(strict, same value and same type)</small> or `==` and `!=`/`<>` <small>(same value after casting to the same type)</small>.

👉️ Always use STRICT equality: `0 == 'true' && 0 == 'false'` is true in PHP, so `0` is both `'true'` and `'false'`.

#### Existence

PHP does not check that variables were declared before executing some code. `isset` check that the variable exists, while `empty` check both that the variable exists, and that it is not "empty".

```php!
if (!isset($someInputFromAUser)) { /* error */ }
if (!empty($someInputFromAUser)) { /* error */ }
$yyy = $xxx ?? 0; // or, use default values if not set
```

➡️ You can destroy a variable with `unset`.
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2"><div>

If PHP, there are two kinds of structures. Those using braces, and those using starting (`:`) and ending tags (`endXXX`). 

This is because you may use HTML inside structures, and you may close and re-open a PHP block, but it doesn't look clean using braces:

```phpt!
<?php if (...) { ?>
<p>This HTML element is only shown when the IF is true</p>
<?php } ?>
```

#### Branching

```php!
if ($condition) { /* code */ }
elseif ($condition) { /* code */ }
else { /* code */ }

if ($condition): /* ... */ endif;
```

```php!
switch ($number) {
    case 0: /* code */ break;
    case 1: case 2: /* code */ break;
    default: /* code */ break;
}

switch ($number): /* code */ endswitch;
```
</div><div>

There is also the ternary operator (inline if statement)

```php!
$result = $condition ? $value_if_true : $value_if_false;
```

Since PHP 8, a match statement was introduced.

```php!
$result = match ($variable) {
    'value1' => 'result1',
    'value2', 'value3' => 'result2',
    default => 'default result',
};
```

#### Loops

```php!
// for
for ($i = 0; $i < 10; $i++) { /* code */ }
for ($i = 0; $i < 10; $i++): /* code */ endfor;

// while
while ($condition){ /* code */ }
while ($condition): endwhile;

// do while
do { /* code */ } while ($condition);
```

➡️ You can use `break` to exit a loop, and `continue` to move to the next iteration. You can also add a number: `break 2;`.
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

Since PHP 7.*, you can type parameters and the return type.

```php!
function sum(int $a, int $b) : int {
    return $a + $b;
}

echo sum(5, 6);
```

➡️ You must use `int/bool/...` instead of `integer/boolean/...`.

➡️ Since PHP 7.4, you can use `void`.

#### Passage by reference

In PHP, arguments are passed by value. If you want a function to modify a variable, you can pass it by reference.

```php
function sum(int $a, int $b, &$res) : void {
    $res = $a + $b;
}

$res = -1; // declare it
sum(5, 6, $res); // fill it
echo $res; // output: 11
```
</div><div>

#### Default values

You can give default values to parameters

```php!
function sum(int $a, int $b = 10) : int {}
```

#### Nullable and multi-types arguments

You can declare a nullable parameter or return type

```php!
function sum(int $a, ?int $b) : ?int {}
```

Since PHP 8.0, we can explicitly declare multiple types with `|`:

```php!
function sum(int $a, int | null $b) : int | null {}
```

#### Anonymous functions/Closures

```php!
$x = function () { echo "XXX"; };
$x();
```

Anonymous functions can "use" variables from the outside.

```php!
$a = 10;
$x = function () use ($a) { echo $a; };
$x(); // output: 10
```

</div></div>

<hr class="sep-both">

## Arrays

<div class="row row-cols-md-2"><div>

Arrays in PHP can be multi-types, and can be either indexed using integers <small>(starting from 0)</small>, or they can be associative, meaning a string is associated with a value.

#### Creation

```php
$array = array(5, "10", 15.0);
$array = [5, "10", 15.0];
$associative = ["five"=>5, "ten" => "10"];
$multi_dimensional = [[5], [10]]; // [0][0] == 5
```

#### Add/Edit values

```php
// add a value
$array[] = 20; // at the end
// modify a value
$array[0] = 2; // change the first value
$associative["five"] = "5"; // change a value
```

#### Get values

```php
echo $array[1]; // print 10
echo $associative["ten"]; // print 10
```
</div><div>

#### Print array

```php
print_r($array);
var_dump($array);
// pretty print array
echo "<pre>".print_r($array)."</pre>"
```

#### Iterate arrays

```php
// index are "0", "1"...
// values are 2, "10", 15.0
foreach ($array as $value) {}
foreach ($array as $index => $value) {}
// values are "5", "10"
// keys are "five" "ten"
foreach ($associative as $value) {}
foreach ($associative as $key => $value) {}
```

#### Useful methods

* `count($array)`: number of elements
* `is_array($array)`: true if this is an array
* You can deconstruct an array: `[$v1, $v2, $v3] = $array;`
</div></div>

<hr class="sep-both">

## Classes and objects

<div class="row row-cols-md-2 mx-0"><div>

A class is a template to create objects. A class called table could define attributes such as `cost`, and methods such as `"sell"`. 

Objects are concrete instances of the class, in which we give value to attributes, such as `TableXXX: cost = 10`.

#### Basic syntax

```php!
class Person {
    public string $name = "John Doe";
    public int $age = 0;

    function doNothing() : void {}
}
```

Instantiation is done by calling the `new` keyword

```php!
$somePerson = new Person();
$somePerson->doNothing(); // call a method
$name = $somePerson->name; // access an attribute
```

#### Constructors

We usually fill attributes in a magic method called the constructor.

```php!
class Person {
    public function __construct(string $name, int $age)
    {
        // internally, use "$this->" to access attributes
        $this->name = $name;
        $this->age = $age;
    }
}
```

```php!
$janeDoe = new Person("Jane Doe", 18);
```

#### Getters/Setters

We usually use private attributes, and add getters/setters when needed <small>(if both are present and trivial, you may use public)</small>.

```php!
class Person {
    public function getName(): string
    { return $this->name; }

    public function setAge(int $age): void
    { $this->age = $age; }
}
```

➡️ Attributes and functions can be `public`/`private`/`protected`. Aside from static members, there is no default visibility.
</div><div>

#### Static

Classes can have methods/attributes using `static`. As a reminder, static attributes are shared between every object and static methods can be called without having to create an object.

```php!
class SomeClass {
    public const XXX = 18; // public by default
    public static $YYY = 5; // public by default
    private const ZZZ = 2;
    
    public static function zzz() : int
    { return self::XXX; } // or SomeClass::
}
```

```php!
$xxx = SomeClass::XXX;
$yyy = SomeClass::$YYY;
$zzz = SomeClass::zzz();
```

#### Inheritance

A class can inherit one class <small>(public/protected methods/attributes)</small>, and zero or more interfaces. Interfaces are basically custom types.

```php
// some interface with one function
interface IPerson {
    function fun1();
}
// ➡️ Use "," to implement more interfaces
class Person implements IPerson {
    function fun1() {}
}
// 👉 Example with a normal class
class DoeFamilyMember extends Person {}
```

You can create an abstract class, meaning a class that has 0 or more methods that were not implemented.

```php
abstract class IncompleteImplementation {
    abstract function fun2();
}
class ConcreteClass extends IncompleteImplementation {
    function fun2() {}
}
```

#### Traits

A class can privately inherit from multiple "trait" classes.

```
trait Parent1 { function xxx() {} } // public
trait Parent2 { function yyy() {} } // public
class Child { // inherit public/protected
    use Parent1; // from Parent1
    use Parent2; // and Parent2
}
```
</div></div>

<hr class="sep-both">

## Error handling

<div class="row row-cols-md-2"><div>

PHP error handling is mainly based on exceptions. A programmer can raise a signal called an exception when something unexpected, mostly an error, occurs. This signal will stop a function/script and go back to the caller until it's caught. If no one catches and handles it, then it may be displayed to the user <small>(according to the server configuration)</small>.

For debugging purposes, you can add these two lines to display all errors to the "user" <small>(a.k.a. you, the programmer)</small>.

```php
// usually at the start of the script
error_reporting(E_ALL);
ini_set("display_errors", 1);
```

To raise an exception, use `throw`

```php
throw new \Exception("a message");
```
</div><div>

To catch and handle a function raising an exception, use `try-catch`

```php
try {
    // code that may raise an exception
} catch (\Exception $e) {
    // print the message
    echo "Error: ".$e->getMessage();
    // pretty print of the stacktrace + message
    echo "<pre>".var_dump($e)."</pre>"
}
```

➡️ An alternative to "finally" could be `register_shutdown_function`.

It's also possible to raise user-level warnings/errors/notices/...

```php
trigger_error("a message", E_USER_DEPRECATED);
```
</div></div>

<hr class="sep-both">

## Website specific

<div class="row row-cols-md-2"><div>

#### Redirection

You can use `header` to redirect a user using PHP. Note that you must call it before rendering anything, otherwise use an HTML redirect. Also, note that you must call `exit` right after, otherwise, the remaining PHP code will still be executed before redirecting.

```php!
header("Location: index.php");
exit();
```

#### Sessions

[Sessions](/programming-languages/web/_general/random/cookies.md) can be used to keep information about a client on the server during their browsing session, such as their logging status.

All data is stored in an array called `$_SESSION` and available after starting the session.

```php!
session_start(); // 👉 session_destroy to delete it
```

Example: add the username if logged in, remove it on logout.

```php
$_SESSION['username'] = 'root'; // on login
unset($_SESSION['username']); // on logout
// use isset before accessing a field
if (isset($_SESSION['username'])) {}
```

</div><div>

#### Handle a form

[Forms](../../_general/random/forms.md) are handled in PHP.  [HTML forms](/programming-languages/web/html/index.md#forms) have an attribute `action` which takes a URL. This URL can lead to a PHP script that will handle the form. According to the method specified in the HTML form, values will be stored either in `$_POST` or `$_GET`.

➡️ Use a `var_dump($_POST)`/`var_dump($_GET)` to ensure that the array is filled as you expect it to be before processing.

✅ You should ensure that all values are here using `isset` and that they are not empty using `empty`. You should also do some server-side verification of the type <small>(ex: `ctype_digit(str)` for integers)</small> and the value:

```
if (filter_var($email, FILTER_VALIDATE_EMAIL) !== false){
    // this should be a valid email
} // otherwise, handle the error
```

👉 You may also `trim(...)` strings to remove leading/trailing spaces.

#### Convenient functions

* `nl2br`: convert `\n` to `<br/>`
</div></div>

<hr class="sep-both">

## Additional notes

<div class="row row-cols-md-2"><div>

#### JSON

```php!
$decoded = json_decode("{}", true);
$json = json_encode($decoded)
```

#### Date and time

```php!
$date = date("Y-m-d");
$time = time();
```

#### Heredoc Strings

You can use [Heredoc](/tools-and-frameworks/knowledge/heredoc/index.md) strings.

```php!
$some_variable = <<<EOF
You can use both ' and "
EOF;
```

</div><div>

#### Hash passwords

🙅‍♀️ Don't store/use cleartext passwords, hash your passwords!

```php!
// (usually saved in a database)
$hash = password_hash("apassword", PASSWORD_DEFAULT);

// from a hash and a password
// you can check if this password is matching the hash
$boolean = password_verify("apassword", $hash);
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* spaceship (`<=>`) operator PHP 8 to compare two values (0, 1, -1)
* `type TypeName = integer;` (or int before PHP8)
* `@file_get_contents(xxx)`/`file_get_contents`/`file_put_contents`
* `__FILE__` (full path to file?) and `__DIR__`
* enums
* str functions (str_length, substr, str_split...)
* `??=`
* htmlescapechars
* `array_reduce`
* `php -m`
* [phpDoc](https://phpdoc.org/)
* [phpstan](https://github.com/phpstan/phpstan)

```
$ php -ini | head
$ sudo nano /etc/php/v.v/mods-available/xxx.ini # debian
$ sudo phpenmod xxx
# https://pecl.php.net/package/xxx
```

</div><div>

* see generators (yield/...)
* magic methods
* namespaces (PHP 5.3+), and `use`
* unions return types 
* annotations (`#[Pure]`)
* basically, what's new since PHP 8.0
* [roundcube](https://roundcube.net/)
* [php-fig](https://www.php-fig.org/)
* [cburch](http://www.cburch.com/books/php/index.html)

```php!
$files = glob('./*/*.txt');
$dirIterator = new RecursiveDirectoryIterator($path);
foreach (new RecursiveIteratorIterator($dirIterator) as $file) {
    // $file->isFile()
    // $file->getExtension()
    // $file->getPathname()
    // $file->getMTime()
}

arsort($array);
array_slice(array_keys($array), 0, $limit);
reset($xxx)

$this->$hidden

return new class implements XXXInterface {};

sprintf("%06d", 33)
```
</div></div>