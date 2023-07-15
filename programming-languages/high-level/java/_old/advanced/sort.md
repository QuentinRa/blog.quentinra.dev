# Comparator

You might want to sort a list or an Array. You need for that to provide a `Comparator` class.

```java
class MyComparator implements Comparator<Object> {
    @Override
    public int compare(Object o1, Object o2) {
        return 0; /* code here */
    }
}
```

Here the comparator is for Object but if you got a list of String, use String etc. You will return

* `0`: o1 and o2 are the same
* `1`: o1 is after o2
* `-1`: o1 is before o2

> Remember in maths, when x is higher than y, then x minus y is
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

But this statement can be inferred so you can write

```java
objects.sort(Integer::compareTo);
```