# Classes and objects

[Go back](..)

As usual, a class is a container to store
properties and methods for an abstract concept
like a Person, a Computer, a Room, ...

Properties, called attributes would be names,
age, values, sizes, ... And methods would be
some function to change an attribute, etc.

We call an object, the concrete instantiation
of a class, which is simply giving value to the
attribute using the constructor or the methods.

Here some example

```php
// usually in Person.php but that's up to you
class Person {
    public const MAJORITY = 18;

    public $name;
    private $age = 0;

    // constructor
    public function __construct(string $name) {
        $this->name = $name;
        $this->age = 0;
    }

    public function isAdult() : bool { return $this->age === self::MAJORITY; }

    public function setAge(int $age){ $this->age = $age; }
}

// create an object
$bruno = new Person("Bruno");
$bruno->setAge(15);
echo $bruno->name." is ".($bruno->isAdult()?"an adult":"a minor");
```

A lot of things are like in **Java** and It would
be too much to rewriting everything here, you should check
the Java Course if you don't understand something.
This applies if you don't know

* you don't know this keyword
* you don't know what's public/private/...
* you don't know the ``new`` keyword
* and you may at the end for ``interface``,
``abstract``, `extends`, ...

<hr class="sl">

## Attributes

They have 

* visibility: public, private, or protected
* may be declared as ``const`` (public by default)
and could be called with ``self::NAME`` (only inside
  the class) or ``Person::NAME``.
* can have a default value **but use the constructor**
* you can use the keyword ``static`` to create
a class attribute. (public by default)

You must use ``$this->....`` to access the attribute `...`.

Since PHP7.4, you can add a type giving you
something like this ``public string $name;``.

<hr class="sr">

## Methods

Everything is the same as for attributes.
Note that you may only have one constructor.

<hr class="sl">

## Inheritance

Like in Java, you will use ``extends`` to
inherit one concrete class. You can implements
interfaces using ``implements`` and as many interfaces
as you want.

```php
// some interface
interface I1 { 
    function test1();
}
// because that's taking less space
interface I2 { function test2(); }
```

```php
// abstract class, taking less space
abstract class A { 
    public function __construct() {}
    abstract function test3();
}
```

```php
// create class, need to write the code for ALL
class Concrete extends A implements I1, I2 {

    public function __construct() {
        // call to parent constructor
        // you can also call parent methods etc.
        // using `parent`
        parent::__construct();
    }

    public function test1() { /*  TODO: Implement test1() method. */ }
    function test2() { /* TODO: Implement test2() method. */}
    function test3() { /* TODO: Implement test3() method. */}
}
```

<hr class="sr">

## Private inheritance

You can make a private inheritance
using ``trait`` classes and inherit more than one
class.

```php
trait Parent1 { }
trait Parent2 { }

class Child {
    // can use public/protected properties
    // of Parent1 and Parent2
    use Parent1;
    use Parent2;
}
```

<hr class="sl">

## Namespaces

You might look into that if you need some
packages.

```php
<?php
// like package mu.package.name; in java
namespace my\package\name;

// import package.name.ClassName;
use package\name\ClassName;
// or if package imported
use ClassName;
```

Note that it seems like this only works
if you got a package manager like with
composer.