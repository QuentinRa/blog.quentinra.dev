# Genericity

[Go back](../index.md#advanced)

The main idea is that you want to code, that can works with some kind of classes. For instance let's says we want the first element of an array.

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

But as we can see, the code is the same some we can factorize, maybe using `Object` class and Liskov substitution principe.

```java
public static Object firstElement(Object[] array){
    return array.length == 0 ? null : array[0];
}
```

But if we are using it, we will have to cast back our Object to Integer.

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

To remove this cast, we could actually use a better version of genericity. You will use that when you can't use liskov substitution principle or when the type returned is some some abstract version of your type.

The generic method is

```java
public static <T> T firstElement(T[] array){
    return array.length == 0 ? null : array[0];
}
```

<hr class="sr">

## Generic methods

The `<T>` before the return type is the declaration of the new type. For now it's just a type named T be you could write everything you want. We usually use a one letter name through.

**Method taking a generic type**

This method is taking a parameters of type T.

```java
public <T> void method(T param){
    /* ... */
}
```

**Constraint on T**

You can ask T to be a class extending a class. Sometimes if you are using that, then you may be using genericity through you could have used Liskov principle with the extended class.

```java
public <T extends ...> void method(T param){
    /* ... */
}
```

You can use the joker type `?` if you don't know nor care about the type. HashMap is a generic class introduced later taking keys associated with a value. Here we don't know the type of the keys nor the type of the values.

````java
public void method(HashMap<?, ?> param){
    /* ... */
}
````

Still you can add an upper bound on `?` like the key must extends Integer

```java
public void method(HashMap<? extends Integer, ?> param){
    /* ... */
}
```

or something like that, asking the class extends by the keys

```java
public static <T> void method(HashMap<? extends T, ?> param, Class<T> keyClass){
    /* ... */
}

// may be called like this
method(param, Integer.class);
```

<hr class="sr">

## Generic classes

If you are using a lot of generic methods, or you want all of your methods to use a generic type declared by the class then you can.

```java
public class MyClass<K> {
    // ...
}
```

You may do something like that

```java
public class GenericClass<K, V> {

    private final K key;
    private final V value;

    public GenericClass(K key, V value) {
        this.key = key;
        this.value = value;
    }

    public K getKey() { return key; }
    public V getValue() { return value; }

    public static void main(String[] args) {
        GenericClass<Integer, String> couple = new GenericClass<>(5, "test");
        Integer key = couple.getKey();
        String value = couple.getValue();
        // ...
    }
}
```

Notice that we declare the type with `ClassName<...>` with `...` the type or the types for the generic types we declared.

When using new, we could write `new GenericClass<>` since the types could be inferred but we could also write `new GenericClass<Integer, String>(...)`.