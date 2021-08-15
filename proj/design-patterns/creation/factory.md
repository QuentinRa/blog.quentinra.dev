# Factory or Virtual constructor

[Go back](..)

This is a class with methods like this
``createObject() : A`` in which A can be 

* abstract (an interface, an abstract class, ...)
* the class A
* a sub-class of A

meaning the caller won't know exactly what we created. 
We can easily change what's created so that is really useful.

* ➡️ : an example would be ``iterator()`` in JAVA
* ✅ : more flexibility
* 🚫 : may create a lot of class

<hr class="sl">

## Example in Java

```java
// ------------ factory related ------------- //

// should manage creation of RPG Units, UnitCreator.java
public interface UnitCreator {

    // kind of units
    enum UnitName { HERO, MONSTER, NPC }

    // factory method, @see RPGUnit
    RPGUnit getUnit(UnitName name);

}

// concrete
// real creator
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