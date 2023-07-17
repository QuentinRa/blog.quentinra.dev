# Dynamic structures

[Go back](../index.md#advanced)

These are structures of data that you will use like ArrayList or HashMap. Theses are called Collections since they implementing `Collection` and note that collections are `Iterables`.

HashMap is not a collection but a `Map`.

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