# Classes and objects

[Go back](../index.md#basic-syntax)

In JavaScript, classes are defining the default properties of an object, but you can dynamically add properties (either for one object, or every object of the class). This can make debugging complex, so be careful (e.g.: use inheritance instead of dynamic properties 😉).

Let's say you got an instance (=object of a class) of a HTMLImageElement (`<img src="a_source">`) in the variable `img`, you can

* set/get the properties like "alt, src, ..." with `img.src`
* use methods (like `img.getAttribute('src')` that is the same as `img.src`)

You can get the variable class and prototype with `variable.__proto__` (class, attributes, methods).

> **Note**: Just in case if you didn't know, but a class is something defining properties (ex: name, age, etc.) and methods (functions, such as getAge or isMarried) for a Person. You are creating an object/instance, when you are giving values to the attributes (such as name=John Doe etc.).

<hr class="sl">

## Creating a class

Everything is quite familiar with what you are doing in Java/PHP, but you can only have one constructor (same as PHP).

```js
class Person {

    // How can we create new objects of this class?
    // answer: we are calling this method
    constructor(name="John Doe") {
        // declaring attributes
        this.name = name;
    }
    
    // you may declare functions, ...
    isMarried(){
        return "I don't know 😂";
    }
}
```

<hr class="sr">

## Creating Objects

An object is an instance of the class.

```js
// creating new objects
let john = new Person();
let jane = new Person("Jane Doe")
console.log(john.name) // "John Doe"
console.log(jane.name) // "Jane Doe"
console.log(john.isMarried()); // "I don't know 😂"
```

<hr class="sl">

## Changing the prototype

This is an example of adding an attribute "new_property" to every object of the class Person

```js
// we are changing the prototype,
// adding a new attribute to the class
jane.__proto__.married = false;
jane.married // 5
john.married // 5
// adding a new property only to one variable
jane.age = "?";
jane.age // "?"
john.age // undefined
```

What's the use of this? Well, for images on your website, you are not the one handling them, so you can't inherit HTMLImageElement and add a new property. But what if you are making a Memory and you want to keep track of the images that are already paired? You can dynamically add an attribute to the image 😎.

<hr class="sr">

## Dynamic classes

You can also create a class on the fly, and giving the values right away. The syntax for objects is the same as in JSON.

```js
let calistro = {
     name: "Calistro",
     work : function() {
          alert("I'm already working 😭");
     }
};

console.log(calistro.name) // "Calistro"
user.work(); // open alert
```

<hr class="sl">

## Inheritance

Everything is the same as in Java/PHP/..., look on the WEB, but here is some code

```js
class MarriedPerson extends Person {
    constructor(name="John Doe") {
        // create Person
        super(name);
    }

    // change the behavior
    isMarried(){
        return "Yes!";
    }
}
new Person().isMarried()
// "I don't know 😂"
new MarriedPerson().isMarried()
// "Yes!"
```