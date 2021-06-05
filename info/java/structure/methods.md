# Methods

[Go back](..)

A method can have

* **a visibility**: public, private, ...
* **a special property**: final, static, ...
* **a return type**: Object, int, ...
* **a name**
* some arguments

Some methods are particular, they are called **getters** 
and **setters**. A getter returns a value and a setter set a value in the class.
A getter usually starts with ``get...`` and a setter
usually starts with ``set...``.

Declaring a method ``final`` means that no one can overrides it
(explained later).

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