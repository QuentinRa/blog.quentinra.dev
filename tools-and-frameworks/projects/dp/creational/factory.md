# Factory Design Pattern

[Go back](../index.md#creational-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: Virtual constructor

**Description** 📚: we can use it to control how a class instances are created, for instance, to "hide" which class we effectively created.

```java
public A someMethod() { return new XXX(); }
```

➡️ We say that the return type is `A` but the class instantiated may be a subclass or a class implementing `A`.

</div><div>

**Advantages** ✅

* More flexible, we can change the instantiated class or the constructor call easily.

**Disadvantages** 🚫

* We may create have to create a lot of classes

**Notes** 📝

* An example would be `SomeClass#iterator()` method in Java
</div></div>

<hr class="sep-both">

## Java implementations

<div class="row row-cols-md-2 mt-4"><div>

```java
// ------------ factory related ------------- //
// should manage the creation of RPG Units, UnitCreator.java
public interface UnitCreator {

    // kind of units
    enum UnitName { HERO, MONSTER, NPC }

    // factory method, @see RPGUnit
    RPGUnit getUnit(UnitName name);

}

// Concrete and real creator
public class Game implements UnitCreator {
    // create unit
    @Override
    public RPGUnit getUnit(UnitName name) {
        switch (name){
            case HERO: return new Hero();
            // not done
            case NPC: case MONSTER: default: 
                throw new IllegalArgumentException("not implemented yet");
        }
    }

    // test
    public static void main(String[] args) {
        Game game = new Game();
        // we "don't know" what unit go created
        RPGUnit hero = game.getUnit(UnitName.HERO);
        System.out.println(hero); // Hero
    }
}
```
</div><div>

```java
// ------------ created ------------- //
// abstract unit, RPGUnit.java
public abstract class RPGUnit {
    // print unit name
    public abstract String toString();
}

// Hero.java
public class Hero extends RPGUnit {
    @Override
    public String toString() { return "Hero"; }
}
```
</div></div>