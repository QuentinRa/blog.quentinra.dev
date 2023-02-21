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

To install PHP, you will need a webserver such as [Apache](/operating-systems/webservers/apache/index.md). ➡️ Well-known versions of PHP are: `5.6`, `7.*`, and `8` <small>(latest, since 2020)</small>.

Additionally, you may install extensions later:

```ps
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

The PHP blocs (`<?php ?>`, `<?= ?>`) will be executed, and an HTML file will be generated and send to the client.

```html
<p>Hello, World!</p>
```

👉 As we may have a lot of PHP blocs to echo something, the bloc `<?= ?>` was introduced doing an implicit `echo`.

```phpt!
<p><?= "Hello, World!" ?></p>
```
</div><div>

➡️ Sometimes, you have files with only PHP inside. In such scenario, you can omit the closing `?>`.

➡️ You can omit `;` in PHP blocs with only one instruction.

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

You can also declare constants either using const, or define. The latter should be used when the right-hand value is a non-const variable.

```php!
// same as define ('XXX', 5);
const XXX = 5;
echo XXX;
```

➡️ Before PHP7.3, constants were case-insensitive, meaning we could call the constant above with "Xxx" or "xxx" and it worked.

#### Types

Types are: `boolean`, `integer`, `double`, `string`, `array`, `object`, `resource`, and `NULL`. You can check/get the type using:

```php!
$someVariableType = gettype($someVariable); // get
if (is_integer($someVariable)) {} // check
```

➡️ PHP use "Type juggling" meaning the variable is converted based on the context <small>(ex: inside a if statement, it is converted to a boolean...)</small>

#### Comments

```php!
// a comment
/* a comment */
# a comment
```
</div><div>

#### Print some text

To print some text, you can use `echo`. You can also use `var_dump`, and `print_r`, but they are mostly used for debugging and objects/arrays.

```php!
echo "XXX: $variable"; // ✅ $variable is replaced
echo 'XXX: $variable'; // ❌ not replaced
echo "XXX: a{$variable}z"; // ✅ $variable is replaced
echo "XXX: a".$variable."z"; // concatenation
// advanced: like in Bash, you can dynamically
// generate the name of the variable you want to call
echo "XXX: ${"variable"}";
var_dump($variable); // print debug information
```

#### Operators

* arithmetic: `+`, `-`, `*`, `/`, `+=`, `-=`, `*=`, `/=`, `**` (power), `%` (mod), `^` (xor)
* comparison: `>`, `>=`, `<=`, `<`
* booleans: `&&`, `||`, `!` (not)
* booleans: `and`, `or` <small>(use &&/||)</small>

For equality operators, there are two: `===` and `!==` <small>(strict, same value and same type)</small> or `==` and `!=`/`<>` <small>(same value after casting to the same type)</small>.

👉️ Always use STRICT equality: `0 == 'true' && 0 == 'false'` is true in PHP, so `0` is both `'true'` and `'false'`.

#### Existence

PHP do not check that variables were declared before executing some code. `isset` check that the variable exists, while `empty` check both that the variable exists, and that it is not "empty".

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

If PHP, there are two kind of structures. Those using braces, and those using starting (`:`) and ending tags (`endXXX`). 

This is because you may use HTML inside structures, and you may close and re-open a PHP bloc, but it doesn't look clean using braces:

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

You can give default value to parameters

```php!
function sum(int $a, int $b = 10) : int {}
```

#### Nullable and multi-types arguments

You can declare a nullable parameter or return type

```php!
function sum(int $a, ?int $b) : ?int {}
```

Since PHP8.0, a value can explicitly declare multiple types with `|`

```php!
function sum(int $a, int | null $b) : int | null {}
```

#### Anonymous functions/Closures

```php!
$x = function () { echo "XXX"; };
$x();
```

Anonymous functions can "use" variable from the outside.

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
</div></div>

<hr class="sep-both">

## Classes and objects

<div class="row row-cols-md-2 mx-0"><div>

A class is a template to create objects. A class called table could define attributes such as `cost`, and method such as `"sell"`. 

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

We usually fill attributes in a magic method called constructor.

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

Classes can have methods/attributes using `static`. As a reminder, static attributes are shared between every object and static method can be called without having to create an object.

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

You can create abstract class, meaning a class that has 0 or more methods that were not implemented.

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

## Website specific

<div class="row row-cols-md-2"><div>

#### Redirection

You can use `header` to redirect a user using PHP. Note that you must call it before rendering anything, otherwise use an HTML redirect. Also note that you must call `exit` right-after, otherwise, the remaining PHP code will still be executed before redirecting.

```php!
header("Location: index.php");
exit();
```

#### Convenient functions

* `nl2br`: convert `\n` to `<br/>`
</div><div>

#### Handle a form

[HTML forms](/programming-languages/web/html/index.md#forms) have an attribute `action` which takes a URL. This URL can lead to a PHP script that will handle the form. According to the method specified in the HTML form, values will be stored either in `$_POST` or `$_GET`.

➡️ Use a `var_dump($_POST)`/`var_dump($_GET)` to ensure that the array is filled as you expect it to be before processing.

✅ You should ensure that all values are here using `isset` and that they are not empty using `empty`. You should also do some server-side verification of the type <small>(ex: `ctype_digit(str)` for integers)</small> and the value:

```
if (filter_var($email, FILTER_VALIDATE_EMAIL) != false){
    // this should be a valid email
} // otherwise, handle the error
```

👉 You may also `trim(...)` strings to remove leading/trailing spaces.
</div></div>

<hr class="sep-both">

## Additional notes

<div class="row row-cols-md-2"><div>

#### JSON

```php
$decoded = json_decode("{}", true);
$json = json_encode($decoded)
```
</div><div>

#### Date and time

```php
$date = date("Y-m-d");
$time = time();
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* global variables
* spaceship (`<=>`) operator PHP 8 to compare two values (0, 1, -1)
* `type TypeName = integer;` (or int before PHP8)
* `@file_get_contents(xxx)`/`file_get_contents`/`file_put_contents`
* `__FILE__` (full path to file?) and `__DIR__`
* enums
* str functions (str_length, substr, str_split...)

</div><div>

* magic methods
* namespaces (PHP 5.3+), and `use`
* `error_reporting()`/`try/catch`

```php
// pretty print debug
echo "<pre>".var_dump($exception)."</pre>"
```

* unions return types 
* annotations (`#[Pure]`)
* basically, what's new since PHP 8.0
</div></div>