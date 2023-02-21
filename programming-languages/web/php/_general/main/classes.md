# Classes and objects

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