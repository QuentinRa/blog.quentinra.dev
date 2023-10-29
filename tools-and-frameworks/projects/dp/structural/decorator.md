# Decorator Design Pattern

[Go back](../index.md#structural-)

<div class="row row-cols-lg-2"><div>

**Aliases** 📌: None

**Description** 📚: A decorator is a class that uses a concrete instance to delegate the implementation of an interface while using its own implementation for one or more methods. 

</div><div>

**Advantages** ✅

* Avoid using inheritance slots <small>(ex: extends in Java)</small>

**Disadvantages** 🚫

* ???

**Notes** 📝

* An alternative to inheritance
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-lg-2"><div class="mt-lg-4 mt-2">

```java
public interface Food {
    String getName();
    int getPrice();

    default String print() {
        return "{ name:" + getName() + ", price:" + getPrice() + " }";
    }
}
```

```java
public class Pizza implements Food {
    @Override
    public String getName() {
        return "Pizza";
    }

    @Override
    public int getPrice() {
        return 7;
    }
}
```
</div><div class="mt-lg-4">

```java
public class DriveFood implements Food {
    private final Food decorated;

    public DriveFood(Food food) {
        this.decorated = decorated;
    }

    @Override
    public int getPrice() {
        // increase the price
        return decorated.getPrice() + 3;
    }

    @Override
    public String getName() {
        return decorated.getName();
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        Pizza p = new Pizza();
        System.out.println(p.print()); // { name:Pizza, price:7 }
        DriveFood f = new DriveFood(p);
        System.out.println(f.print()); // { name:Pizza, price:10 }
    }
}
```
</div></div>