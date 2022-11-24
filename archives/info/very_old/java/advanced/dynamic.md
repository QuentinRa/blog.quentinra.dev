# Dynamic structures

[Go back](../index.md#advanced)

These are structures of data that you will use like ArrayList or HashMap. Theses are called Collections since they implementing `Collection` and note that collections are `Iterables`.

HashMap is not a collection but a `Map`.

<hr class="sr">

## ArrayList

It's a list of values.

```java
import java.util.ArrayList;

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

<hr class="sl">

## HashSet

Same as ArrayList but values are uniques and if the same value is added twice, then the previous one is removed.

```java
import java.util.HashSet;

HashSet<Integer> list = new HashSet<>();
```

Note that you don't have a `get` method so you will need to iterate the list if you want an element.

<hr class="sr">

## LinkedList using Queue

```java
import java.util.Queue;
import java.util.LinkedList;

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

<hr class="sl">

## HashMap

It's a dictionary. The key are uniques and each key is associated with a value.

```java
import java.util.HashMap;

HashMap<Integer, String> map = new HashMap<>();

// add value for key or
// replace existing value
String oldValue = map.put(key, value);
// remove value for key
String removed = map.remove(key);
// true if key exists
boolean b = map.containsKey(key);
// get value for key
String get = map.get(key);
// clear
map.clear();

// iterates
for(Map.Entry<Integer, String> entry: map.entrySet()){
    Integer key = entry.getKey();
    String value = entry.getValue();
}
```