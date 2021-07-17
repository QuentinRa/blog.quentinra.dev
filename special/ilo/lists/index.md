# TP Lists

[Go back](..)

Before starting, please take note that in the project,
you got 3 files

* ``ListeOperations.pdf`` : visual as to how you should code some
methods
* ``src/lists/ListIteratorTest`` : **test** your code
mid-way (please use it or you are gonna regret it later)
* ``TP Listes.pdf`` : what you need to do :)

Then open the project in your favorite
IDE, 

* VSCode 
* IntelliJ (it might be a good one to try it out,
but please only add the folder ``tests`` after
  you finished coding) and remove ``RunAllTests.java``
  unless you want to do the same 2-minutes tutorial
  like in the previous TP (check it out for
  the setup if you do).
  
<hr class="sr">

# Some tips

It's all about iterators. You got an iterator
of an object of type ``E`` using `iterator()`
method. Then use either of ``for`` (each)
or a ``while`` to iterate the content.

**PLEASE** do not forget this: you are looping
on ``hasNext`` to check if you can call next, so
don't forget to call ``next()`` to advance
the cursor otherwise ``hasNext`` will return
the same result until ``next`` is called. `next`
return the current element, of type ``E``. See a
bit further the example with ``ArrayList``.

```java
default void clear() {
    Iterator<E> iterator = this.iterator();
    while (iterator.hasNext()) { // example with whil!!!)
        // next return an element but we don't caree
        iterator.next(); // advance (do not forget
        iterator.remove(); // remove
    }
}
```

``head`` is the head. Having no head (head == null)
means the list is empty.

We will be using genericity a lot.
Something like that would be a constructor.

```java
public ForwardList(ForwardList<E> liste) {
    // no list or nothing useful
    if (liste == null || liste.head == null) this.head = null;
    else {
        // deep copy (not at all, but still better than nothing)
        for (E e : liste) this.add(e);
    }
}
```

Note this foreach ``for (Type variable_name : iterable)``
syntax. You will use around the same as this one (and maybe
this one) a lot in the TP. Here ``E`` is the type since
our iterable (a class extending Iterable like our Arrays
or most if not all Collections) ``ForwardList<E>``
is declared as a ``ForwardList`` for elements of type
``E``.

An example would be this one for ArrayLists.

```java
ArrayList<Integer> numbers = new ArrayList<>();
numbers.add(5);
numbers.add(7);
numbers.add(9);
for (Integer c : numbers) {
    // some code
    // c will be 5 then 7 then 9
}
```

About insertAt method. Please use other methods
according to the case

* index < 0 : exception
* index = 0 : insert
* index = size : add
* otherwise find the previous element and make an insert

Iterators are a way to iterate a list/set of objects.
We are returning our iterator but we will have to code
it.

```java
public Iterator<E> iterator() { // returns a new iterator
    return new ListIterator<>();
}
```

In ``ListIterator`` note the attributes 

* ``penultimate`` : the previous value of last
* ``last`` : the previous value of current
* ``current`` : the next value we will return
* ``element`` : the last element we returned
* ``nextCalled`` : true if next called, set to false in `remove`

Then simply change our variable according to what
value they are supposed to have. How do we know that
the list is empty? (answer: current is null mean empty
but do you understand one. Anyways, we will have a next
if current **is not null**.)

As a side note, please don't forget to instantiate all
attributes in your constructors, even at null since
the teacher is asking you to do it.

Here is my equals method. Please note that this method is "weird". You are not checking if two
items have the same type but if they have the same content. So you
will have to check if they are ``Iterable`` then 
iterate your lists.

```java
public boolean equals(Object o) {
    // i would rather use my IDE generated equals but no one asked for my choice
    // here what's asked
    if (o == this) return true;
    if (o == null) return false;

    // if not, then we must check the class
    if (o instanceof Iterable) {
        Iterable<?> l = (Iterable<?>) o;
        Iterator<?> iterator = l.iterator();
        for (Object e:this) { // iterate one
            if(!iterator.hasNext()) return false; // not good, length is not the same
            if(!e.equals(iterator.next()))
                return false; // not good
        }
        return !iterator.hasNext(); // length not the same
    }
    return false;
}
```

And some explicit hashCode

```java
public int hashCode() {
    // Objects.hash(...)
    // or head != null ? head.hashCode() : 0
    // should have been enough...
    final int prime = 31; // int max power
    int hash = 1; // return 1
    for (E e : this) { // or more is we have values
        hash = prime * hash + (e == null ? 0 : e.hashCode());
    }
    return hash;
}
```

Finally, Collections is **easy**. That's a proxy for you!

```java
// as a remember
private ForwardList<E> liste;

// add would be
public boolean add(E e) {
    try {
        this.liste.add(e); // return void or exception
    } catch (NullPointerException ignored) {
        return false;
    }
    return true;
}
```

... and yeah we are calling list methods so
almost nothing to write in a lot of methods!