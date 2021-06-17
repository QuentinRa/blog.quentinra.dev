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
This apply is you don't know

* you don't know this keyword
* you don't know what's public/private/...
* you don't know the ``new`` keyword
* and you may at the end for ``interface``,
``abstract``, `extends`, ...

<div class="sr"></div>

**Attribute**

They have 

* a visibility: public, private or protected
* may be declared as ``const`` (public by default)
and could be called with ``self::NAME`` (only inside
  the class) or ``Person::NAME``.
* can have a default value **but use the constructor**
* you can use the keyword ``static`` to create
a class attribute. (public by default)

You must use ``$this->....`` to access the attribute `...`.

<div class="sr"></div>

**Methods**

Everything is the same that for attributes.
Note that you may only have one constructor.