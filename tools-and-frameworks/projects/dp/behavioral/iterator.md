# Iterator Design Pattern

[Go back](../index.md#behavioral-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: None

**Description** 📚: It provides a way to iterate something and access its child elements.

</div><div>

**Advantages** ✅

* Simplified Iteration

**Disadvantages** 🚫

* May be complicated if we need to edit iterated elements

**Notes** 📝

* None
</div></div>

<hr class="sep-both">

## Java Implementation

<div class="row row-cols-md-2"><div>

Assuming we got a bunch of elements:

```java
public interface Item {}
public class ItemA implements Item {}
public class ItemB implements Item {}
```

And a container `Bag` that we want to iterate:

```java
public class Main {
    public static void main(String[] args) {
        Bag bag = new Bag(new ItemA(), new ItemB(), new ItemA());
        for (Item item: bag) {
            System.out.println(item);
        }
    }
}
```

Then in Java, we would have to implement `Iterable<T>` and in some scenarios, we may have to create our own `Iterator<T>`.
</div><div>

```java
import java.util.Iterator;
import java.util.NoSuchElementException;

public class Bag implements Iterable<Item> {

    private final Item[] items;

    public Bag(Item... items) {
        this.items = items;
    }

    @Override
    public Iterator<Item> iterator() {
        return new BagIterator(this);
    }

    // iterator of my Sac
    private static class BagIterator implements Iterator<Item> {
        private int current;
        private final Bag bag;

        public BagIterator(Bag bag) {
            this.bag = bag;
            this.current = -1; // starts right before 0
        }

        @Override // do we have a next ?
        public boolean hasNext() { return this.current+1 < this.bag.items.length; }

        @Override
        public Item next() {
            // the documentation says that we must throw NoSuchElementException
            if(!hasNext()) throw new NoSuchElementException("no such elements");
            this.current++;
            return this.bag.items[this.current];
        }
    }
}
```
</div></div>