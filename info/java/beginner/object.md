# Object

[Go back](..)

You will see with
inheritance that each class is inheriting of the ``Object`` class.
That's means that each object have theses methods

```java
// compare two object
boolean equals(Object obj);

// if objects are equals, then their hashcode is the same
public int hashCode();

// clone an object, not accessible by default
Object clone();

// returns the object as a string
String toString();

// called by the garbage collector before destroying an object
void finalize();
```