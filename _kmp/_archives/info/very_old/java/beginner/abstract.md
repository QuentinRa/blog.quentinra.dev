# Abstract classes

[Go back](../index.md#beginner)

An abstract class is a new kind of class where you can write normal code like you used to, be also write some methods `abstract` meaning without a body. 

Inheritors would have to write the code of all abstract methods or become abstract.

**Note**: a class having at least one method **abstract** must be declared abstract. But a class without abstract methods can also be declared abstract.

**Note**: an abstract class **cannot** be instanced. They can have a constructor trough but you can't call it. They are considered incomplete by the compiler so you can't use them as if.

**Note**: a method can't be **static** and **abstract**.

<hr class="sl">

## Example

I'm showing the syntax, but the example isn't that good 😣.

```java
public abstract class Animal {
    private final String specie;

    protected Animal(String specie) {
        this.specie = specie;
    }

    //  concrete
    public String getSpecie() { return this.specie; }
    // abstract
    public abstract int getSize();
}

public class Wolf extends Animal {

    public Wolf(String specie) {
        super(specie);
    }
    
    @Override
    public int getSize() { return 0 /* do something */; }
}
```