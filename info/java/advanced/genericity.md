# Genericity

[Go back](..)

The main idea is that you want to code, that can
works with some kind of classes. For instance let's
says we want the first element of an array.

We could first write something like this

```java
public static Integer firstElement(Integer[] array){
    return array.length == 0 ? null : array[0];
}

public static Float firstElement(Float[] array){
    return array.length == 0 ? null : array[0];
}

/* ... */
```

But as we can see, the code is the same some we can
factorize, maybe using ``Object`` class and Liskov
substitution principe.

```java
public static Object firstElement(Object[] array){
    return array.length == 0 ? null : array[0];
}
```

But if we are using it, we will have to cast back
our Object to Integer.

```java
public class GenericMaths {
    public static Object firstElement(Object[] array){
        return array.length == 0 ? null : array[0];
    }

    public static void main(String[] args) {
        Integer[] test1 = new Integer[]{1,2,3};
        // notice the cast, that we need to add
        Integer o = (Integer) firstElement(test1);
        // ...
    }
}
```

To remove this cast, we could actually use a better version
of genericity. You will use that when you can't use liskov
substitution principle or when the type returned is some
some abstract version of your type.

The generic method is

```java
public static <T> T firstElement(T[] array){
    return array.length == 0 ? null : array[0];
}
```