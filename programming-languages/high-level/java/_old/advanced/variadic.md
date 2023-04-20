# Variadic methods

[Go back](../../index.md#advanced)

That's a method taking a variable number of arguments, greater or equals than 0.

```java
public void myMethod(Integer ... numbers){
    foreach(Integer i: numbers){
        // handle argument
        System.out.println(i);
    }
}
```

`numbers` here is an array so you can use anything you would use on an Array. The type is `Integer[]`.