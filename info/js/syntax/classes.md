# Classes and objects

[Go back](../index.md#advanced-syntax)

In Javascript, everything that is an object have
properties that you can change. For instance, if you
grab the object used to store an image,
you can use in Javascript

* the properties like "alt, src, ..."
* some methods (like `getAttribute('name')`
taking a name like src and returning the source's value)

What will defines what kind of properties/methods I can
use on an image is a Class. But, beware: properties can
be changed at runtime like if you want to add an attribute,

* you can create a new classes inheriting the class
you want, then add a new function
* or you can create a new property/change a property
for all object of a class at runtime

You can get the variable class and prototype with
``variable.__proto__``.

<hr class="sl">

## Creating a class

Everything is quite familiar if you are familiar with
Java.

```js
class ClassName {

    // How can we create new objects of this class?
    // answer: we are calling this method
    constructor(arg1="default_value") {
        // declaring attributes
        this.property = arg1;
    }
    
    // you may declare functions, ...
}
```

<hr class="sr">

## Creating Objects

An object is an instance of the class.

```js
// creating new objects
let v1 = new ClassName()
let v2 = new ClassName("test")
v1.property // "default_value"
v2.property // "test"
```

<hr class="sl">

## Changing the prototype

```js
// we are changing the prototype,
// adding a new attribute for all variables
v2.__proto__.new_property = 5
v1.new_property // 5
v2.new_property // 5
// adding a new property to v1
v1.v1_propery = null;
v1.v1_propery // null
v2.v1_propery // undefined
```

<hr class="sr">

## Dynamic classes

You can also create a class on the fly,
and giving the values right away. The syntax
for objects is the same as in JSON.

```js
let user = {
     name: "Calistro",
     work : function() {
          alert("I'm already working :(");
     }
};

user.name // Calistro
user.work() // opens alert
```