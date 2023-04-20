# Iterable

[Go back](../../index.md#advanced)

Something is iterable meaning that we can use the method `iterator()` to get something called an Iterator to read the values of our iterable.

```java
public class MyListOfIntegers implements Iterable<Integer> {

    // ...

    @Override
    public Iterator<Integer> iterator() {
        return null;
    }
}
```

<hr class="sr">

## Creating a Iterator

Instead of returning null, you need to create something to iterates your data. We will write some stupid class using Arrays but you will mainly use that for Collection that will be introduced later

```java
public class MyListOfIntegers implements Iterable<Integer> {

    // fake some stream of data
    private final Integer[] myFakeData = new Integer[]{5,3,6};

    @Override
    public Iterator<Integer> iterator() {
        return new MyListIterator();
    }

    // inner class
    private class MyListIterator implements Iterator<Integer> {

        // cursor
        private int current = 0;

        // true if we can call next
        @Override
        public boolean hasNext() {
            return current < myFakeData.length;
        }

        // avance cursor and return an element
        @Override
        public Integer next() {
            if (!hasNext()) throw new NoSuchElementException("Invalid call of next.");
            // return and avance current
            int v = myFakeData[current];
            current++;
            return v;
        }
    }
}
```

<hr class="sl">

## Use an iterator

Now that you made an iterator, you need to know how you will use it.

```java
MyListOfIntegers list = new MyListOfIntegers();
```

**Using while**

```java
Iterator<Integer> iterator = list.iterator();
while (iterator.hasNext()){
    System.out.println(iterator.next());
}
```

**Using for(each)**

```java
for (Integer integer : list) {
    System.out.println(integer);
}
```

