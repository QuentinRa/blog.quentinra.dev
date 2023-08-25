# Object methods

[Go back](../index.md#object)

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

#### XXX#clone

```java
@Override
public Object clone() {
    XXX xxx;
    try {
        xxx = (XXX) super.clone();
        // you can do some changes here
    } catch (CloneNotSupportedException e) {
        xxx = new XXX(...);
    }
    return xxx;
}
```

#### XXX#toString

```java
@Override
public String toString() {
    return "XXX{" +
        "attr1='" + attr1 + '\'' +
        '}';
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
    
    // for each attribute, use the correct line

    // if attr is a boolean
    hash = prime * hash + (attr ? 1231 : 1237);
    // if attr is a char
    hash = prime * hash + attr;
    // if attr is a double
    long doubleTLB = Double.doubleToLongBits(attr);
    hash = prime * hash + (int) (doubleTLB ^ (doubleTLB >>> 32));
    // if attr is a float
    hash = prime * hash + Float.floatToIntBits(attr);
    // if attr is an int
    hash = prime * hash + attr;
    // if attr is an object
    hash = prime * hash + (attr == null ? 0 : attr.hashCode());

    return hash;
}
```
</div></div>