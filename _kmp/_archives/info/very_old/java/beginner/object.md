# Object

[Go back](../index.md#beginner)

You will see in the inheritance section that each class is inheriting the  `Object` class. That means that each object have these methods

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

<hr class="sl">

## Instanceof

Note the new operator **x instanceof y**, returning true if x is an instance a y or a subclass of y. If x is null, then false is returned. If you need an auto-cast version of this operator, you can do, since Java 14, **x instanceof y name** with `name` a variable containing x casted in the type of y.

```java
// java < 14
Object value = Integer.valueOf(5);
if (value instanceof Integer){
    Integer n = (Integer) value;
    System.out.println("this is a number:"+n);
}
// java >= 14
if (value instanceof Integer n){
    System.out.println("this is a number:"+n);
}
```

Sometimes, you may not want to use `instanceof y` since that would mean subclasses (children of `y`) return true. Instead what we do is `this.getClass() != obj.getClass()` but check that `obj` is not null beforehand!

<hr class="sr">

## equals

For the equals methods, you will usually write some code returning true or false if `this` (our object) is equals (up to you what equals mean) to `obj`.

```java
public class Person {
    public final String name;

    // constructors
    public Person(String name) { this.name = name; }
    public Person(Person p) { this(p.name); }

    @Override
    public boolean equals(Object o) {
        if (o == null) return false; // nothing else to check
        if (this == o) return true; // same
        // check if we can cast
        if (!(o instanceof Person)) return false;
        // cast
        Person person = (Person) o;
        // check equals with the attributes
        return name.equals(person.name);
    }

    @Override
    public int hashCode() { return this.name.hashCode(); }
}
```

People usually use `equals` like this `obj.equals(another)` or `Objects.equals(obj, another)` (import java.util).

And we can write some code

```java
Person calistro = new Person("Calistro");
Person copy = new Person(calistro);
Person empty = null;
System.out.println(calistro == copy); // false, each object in java called with new is unique
System.out.println(calistro.equals(copy)); // true, name is equal
System.out.println(empty == calistro); // false
System.out.println(Objects.equals(empty, calistro)); // false, but no error like bellow
System.out.println(empty.equals(calistro)); // NullPointerException
```

<hr class="sl">

## hashCode

Then for **hashCode**, you simply need to remember that **two objects that are equals will have the same hashCode**. When you write your equals, make sure that your hashCode is following this property (two objects having the same hashCode may not be equals).

Here some help

* you can call hashCode on an object (ex: `name.hashCode()`)
* same, but returns 0 if "name" is null (ex: `Objects.hashCode(name)`)

or you can explicitly write the hashCode algorithm.

```java
@Override // made by David Roussel
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

<hr class="sr">

## clone

Clone is protected by default, you need to set this method to public.

```java
@Override
public Object clone() {
    Person person;
    try {
        person = (Person) super.clone();
        // you can do some changes here
    } catch (CloneNotSupportedException e) {
        person = new Person(this.name);
    }
    return person;
}
```

<hr class="sl">

## toString

This method is used to write an object as a string. It's pretty useful when you are debugging (format is up to you).

```java
@Override
public String toString() {
    return "Person{" +
        "name='" + name + '\'' +
        '}';
}
```

And then we do

```java
System.out.println(calistro); // auto-conversion to String
System.out.println(calistro.toString()); // that's the same
```

<hr class="sr">

## Finalize

Here you can write some code, only if you are still using it (as explained is the garbage collector part before).

```java
class Person {
    public String name;
    
    @SuppressWarnings("deprecation")
    @Override
    protected void finalize() {
        if (this.name != null){
            this.name = null;
        }
    }
}
```