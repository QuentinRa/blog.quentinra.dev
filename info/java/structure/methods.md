# Methods

[Go back](../index.md#vocabulary)

A method can have

* **a visibility**: public, private, ...
* **a special property**: final, static, ...
* **a return type**: Object, int, ...
* **a name**
* some arguments

**Getters and setters**: Some methods are particular, they are called **getters** and **setters**. A getter returns a value and a setter sets a value in the class. A getter usually starts with `get...` and a setter usually starts with `set...`.

**final methods**: Declaring a method `final` means that no one can override it (explained later).

**this keyword**: in an instance method, you can use the keyword `this` to call an attribute/method of the current object. The keyword is optional but that's a good practice to use it.

**class/instance**: in a class method, you can't use instance members since you need an instance. But in instance methods, since you got the class, you can call class members.

> **Advanced note**: In Java, the notion of address doesn't exist. You are calling a method using a parameter
> * if it's a primitive type: then the value is passed
> * if it's an object: a reference is passed
> 
> A reference is simply something that's referencing your object meaning that you can change the attributes/call methods on it and the real object will be modified but you can't "destroy"your object because that's simply a reference.

## Example

```java
public class Math {
    private static final float PI = 3.14f;

    // some stupid method
    public static int simpleRound(float f){ return (int) f; }
    
    // getter
    public static float getPI() { return Math.PI; }
}
```

Then you can call

```java
// 3
System.out.println("PI:"+Math.simpleRound(Math.getPI()));
```

And an example of `this` keyword

```java
class Test {

    private String attribute;

    public void test(){
        // this. optional
        this.anotherTest();
    }

    private void anotherTest() {
        // this. optional
        this.attribute = "Test";
    }

}
```