# TP Lists

[Go back](..)

This is the second practical class you will have. We usually have a week to submit our work. You have to code a List, while discovering the notion of Iterable. As always, you got tests to check what you did.

Before starting, please take note that in the project, you got 3 files

* ``ListeOperations.pdf``: visual as to how you should code some methods
* ``src/lists/ListIteratorTest``: **test** your code mid-way (please use it, or you are going to regret it later)
* ``TP Listes.pdf``: what you need to do :)

Then open the project in your favorite IDE, 

* VSCode 
* [IntelliJ](idea.md) (recommended for this one)

The subject [is hosted here](https://github.com/memorize-code/memorize-references/raw/main/special/ilo/Listes.zip).

<hr class="sr">

# Some tips

An iterator is something that we can use to iterate the content of a collection of data. It will be explained a bit later, but basically:

* an iterable is a class inheriting `Iterable` (ex: an array, a collection)
* we can use the method `iterator()` on an iterable
* `iterator()` is returning an Iterator to iterate the content of something
* use either of ``for`` (each) or a ``while`` to iterate the content.
* an iterator got the method ``hasNext`` and `next`
* ``hasNext()`` returns true if we got more elements to read
* ``next()``: return an element and move forward the cursor

**PLEASE** do not forget this: if you are iterating using while and ``hasNext``, don't forget to call ``next()`` to advance the cursor, otherwise ``hasNext`` will return the same result until ``next`` is called.

```java
default void clear() {
    Iterator<E> iterator = this.iterator();
    while (iterator.hasNext()) { // example with while!
        // next return an element but we don't care here
        iterator.next(); // DO NOT forget!!!
        iterator.remove(); // remove
    }
}
```

``head`` is the head. Having no head (head == null) means the list is empty.

We will be using genericity a lot, the `<E>` after the class name, and inside the for, the type of each element is `E`. This means that our list can store objects having or inheriting the type "E" (the creator of the list will pick what's the type E).

```java
public ForwardList(ForwardList<E> liste) {
    // no list or nothing useful
    if (liste == null || liste.head == null) this.head = null;
    else {
        // we are making a deep copy of the head
        // but a shallow copy for each element 
        // (that's what the tests want, 
        // this.head = liste.head won't pass the tests)
        for (E e : liste) this.add(e);
    }
}
```

Memorize this for (each) syntax: ``for (ElementType variableName : iterable)``. You will use almost the same as this one (and maybe this one) a lot in the TP. Here ``E`` is the type of one element, since our iterable  ``ForwardList<E>`` is declared as a ``ForwardList`` storing elements of type ``E``.

An example would be this one for an ArrayList.

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

About insertAt method. Please use other methods according to the case:

* $index \lt 0$: exception
* $index = 0$: insert
* $index = size$: add
* otherwise find the previous element and make a manual insert

Iterators are a way to iterate a list/set of objects. We are returning our iterator, but we will have to code it.

```java
public Iterator<E> iterator() { // returns a new iterator
    return new ListIterator<>();
}
```

In ``ListIterator`` note the attributes 

* ``penultimate``: the previous value of last
* ``last``: the previous value of current
* ``current``: the next value we will return
* ``element``: the last element we returned
* ``nextCalled``: true if next called, set to false in `remove`

Then simply change our variable according to what value they are supposed to have. How do we know that the list is empty? (answer: <span class="spoiler"> current is null means the list is empty. We will have another next element if current **is not null**.</span>)

As a side note, please don't forget to instantiate all attributes in your constructors, **even at null**, since the teacher is asking you to do it.

Here is my equals' method. Please note that this method is “weird”. You are not checking if two items have the same type, but if they have the same content. So you will have to check if they are ``Iterable`` then iterate your lists.

```java
public boolean equals(Object o) {
    // i would rather use my IDE generated equals but no one asked for my choice
    // here what's asked
    if (o == this) return true;
    // stupid since instanceof check for null but well...
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
    // could have been enough in other cases but not this one
    // since we decided in equals that two lists
    // are equals if they have the same content
    // (no matters the type).
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
// as a reminder, you have this attribute
private ForwardList<E> liste;

// add would be
public boolean add(E e) {
    try {
        this.liste.add(e); // returns void or an exception
    } catch (NullPointerException ignored) {
        return false;
    }
    return true;
}
```

... and yeah we are calling list methods so almost nothing to write in a lot of methods!