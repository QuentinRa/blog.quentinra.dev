# Object

[Go back](../index.md#beginner)

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