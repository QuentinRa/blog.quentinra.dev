# Dynamic structures

[Go back](..)

These are structures of data that you will use like
ArrayList or HashMap.

<div class="sr"></div>

## ArrayList

It's a list of values.

```java
ArrayList<Integer> list = new ArrayList<>();;

// add
boolean add = list.add(element);

// true if element is in list
// will use equals to check
boolean isIn = list.contains(element);

// remove by element or index
boolean remove = list.remove(element);

// 0, 1, ... return by index
Integer integer = list.get(0);

// convert to array, you should use the same method
// taking an array since you can't cast
Object[] objects = list.toArray();

// size
int size = list.size();

// clone
ArrayList<Integer> copy = new ArrayList<>(list);
```

**Note that ArrayList is iterable.**

<div class="sl"></div>

## HashSet

Same as ArrayList but values are uniques and if the same
value is added twice, then the previous one is removed.

```java
HashSet<Integer> list = new HashSet<>();
```

Note that you don't have a ``get`` method
so you will need to iterate the list if you want an
element.

<div class="sl"></div>

## LinkedList using Queue

```java
Queue<Integer> queue = new LinkedList<>();

// add
boolean add = queue.add(element);
boolean offer = queue.offer(element);
// return last
Integer element = queue.element();
Integer peek = queue.peek();
// return and remove last
Integer poll = queue.poll();
// remove last
Integer remove = queue.remove();
```