# Object methods

<div class="row row-cols-md-2"><div>

#### XXX#equals

```java
@Override
public boolean equals(Object o) {
    if (o == null) return false; // nothing else to check
    if (this == o) return true; // same
    // check if we can cast
    if (!(o instanceof XXX)) return false;
    // cast
    XXX xxx = (XXX) o;
    // check equals with the attributes
    // ex: xxx.attribute == this.attribute
    return ...;
}
```
</div><div>

#### XXX#hashCode

You can use `Objects.hashCode(obj)`, `Objects.hash(obj1, obj2...)`, or `obj.hashCode()` to get the hashCode of an object <small>(e.g. for attributes...)</small>.

```java
@Override
public int hashCode(Object o) {
    // ex: return Objects.hash(attribute1, attribute2);
    return ...;
}
```

You can calculate a hashCode manually <small>(i.g. not using Objects.hashCode)</small>:

```java
@Override
public int hashCode() {
    final int prime = 31; // int max power
    int hash = 1; // return 1

    // if attr is a boolean
    hash = prime * hash + (attr ? 1231 : 1237);
    // if attr is a char
    hash = prime * hash + attr;
    // if attr is a double
    long doubleTLB = Double.doubleToLongBits(attr);
    hash = prime * hash + (int) (doubleTLB ^ (doubleTLB >>> 32));
    // if attr is a float
    hash = prime * hash + Float.floatToIntBits(attr);
    // if attribute is a int
    hash = prime * hash + attr;
    // if attribute is an object
    hash = prime * hash + (attr == null ? 0 : attr.hashCode());

    return hash;
}
```
</div></div>