# Streams

[Go back](../index.md#advanced)

You can use a method `stream()` on a collection creating a easily to handle, one time use, reader for the data inside the collection.

By "one time use", I mean that each methods (called **intermediary methods**) are returning a new stream since the previous one will be empty. Methods that are not returning a stream also empty the stream.

```java
ArrayList<Integer> objects = new ArrayList<>();
objects.add(5);
objects.add(9);
objects.add(1);
objects.add(-1);

Stream<Integer> stream = objects.stream();
```

**filter**

You can filter you steam, like removing non-positives values

```java
stream = stream.filter((i) -> i > 0);
```

That's the sort syntax of `test` using lambdas

```java
stream = stream.filter(new Predicate<Integer>() {
    @Override
    public boolean test(Integer i) {
        return i > 0;
    }
});
```

**map**

You can apply a function on each element of a stream to create a new one

```java
stream = stream.map(integer -> integer + 1);

// long version
stream = stream.map(new Function<Integer, Integer>() {
    @Override
    public Integer apply(Integer integer) {
        return integer+1;
    }
});
```

**sort**

You can use `stream = stream.sorted();` is the element are Comparable. otherwise you should do like we did above.

```java
stream = stream.sorted(Integer::compareTo);
```

**others**

You may be interested by these methods

* ``anyMatch(Predicate) : boolean``
* ``allMatch(Predicate) : boolean``
* ``noneMatch(Predicate) : boolean``
* ``count() : long``

And you may consume and read all the values using

```java
stream.forEach(new Consumer<Integer>() {
    @Override
    public void accept(Integer integer) {
        System.out.println(integer);
    }
});
```

You could also write the code above

```java
stream.forEach(integer -> System.out.println(integer));
// or
stream.forEach(System.out::println);
```