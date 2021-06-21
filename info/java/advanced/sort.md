# Sorting

[Go back](..)

French names for sorting algorithms

* tri par insertion
* tri par base
* tri à bulles
* tri par tas
* tri arborescent
* tri fusion
* tri rapide

You may check this [github](https://github.com/java2blog/Tutorials/tree/master/Algorithms/Sorting-Algorithms)
for the english names and implementations in Java.

<div class="sl"></div>

## Comparator

You might want to sort a list or an Array. You need
for that to provide a ``Comparator`` class.

```java
class MyComparator implements Comparator<Object> {
    @Override
    public int compare(Object o1, Object o2) {
        return 0; /* code here */
    }
}
```

Here the comparator is for Object but if you got a list
of String, use String etc. You will return

* ``0``: o1 and o2 are the same
* ``1``: o1 is after o2
* ``-1``: o1 is before o2

> Remember in maths, when x is higher than y, then
> x minus y is 
> 
> * positive (here 1) if x is greater then y
> * negative (here -1) if y is greater then x
> * null (here 0) if x equals y
> 
> And that's how you can remember this.

A concrete example would be

```java
public class StupidExample {
    public static void main(String[] args) {
        ArrayList<Integer> objects = new ArrayList<>();
        objects.add(5);
        objects.add(9);
        objects.add(2);
        objects.add(1);
        objects.add(15);
        objects.sort(new MyComparator());
        System.out.println(objects);
    }
}

public class MyComparator implements Comparator<Integer> {
    @Override
    public int compare(Integer o1, Integer o2) {
        return o1 == o2 ? 0 : o1 > o2 ? 1 : -1;
    }
}
```

And you could also write this using a lambda

```java
objects.sort((o1, o2) -> o1 == o2 ? 0 : o1 > o2 ? 1 : -1);
```

And since we are using Integer, you could do that

```java
objects.sort((o1, o2) -> o1.compareTo(o2));
```

But this statement can be inferred so you can
write

```java
objects.sort(Integer::compareTo);
```

<div class="sl"></div>

## Streams

You can use a method ``stream()`` on a collection
creating a easily to handle, one time use, reader
for the data inside the collection.

By "one time use", I mean that each methods
(called **intermediary methods**)
are returning a new stream since the previous
one will be empty. Methods that are not returning
a stream also empty the stream.

```java
ArrayList<Integer> objects = new ArrayList<>();
objects.add(5);
objects.add(9);
objects.add(1);
objects.add(-1);

Stream<Integer> stream = objects.stream();
```

**filter**

You can filter you steam, like removing non-positives
values

```java
stream = stream.filter((i) -> i > 0);
```

That's the sort syntax of ``test`` using lambdas

```java
stream = stream.filter(new Predicate<Integer>() {
    @Override
    public boolean test(Integer i) {
        return i > 0;
    }
});
```

**map**

You can apply a function on each element of a stream
to create a new one

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

You can use ``stream = stream.sorted();`` is the element are Comparable.
otherwise you should do like we did above.

```java
stream = stream.sorted(Integer::compareTo);
```

**others**

You may be interested by these methods

* ``anyMatch(Predicate) : boolean``
* ``allMatch(Predicate) : boolean``
* ``noneMatch(Predicate) : boolean``
* ``count() : long``