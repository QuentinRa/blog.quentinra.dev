# Factory or Virtual constructor

[Go back](..)

The form is a class with ``createObject() : A`` where A can be 

* abstract (so may be an interface)
* a class of type A
* a sub-class of A

meaning the caller won't know exactly what we created. We can easily change
what's created to that is really useful.

* ➡️ : an exemple would be ``iterator()`` in JAVA
* ✅ : more flexibility
* 🚫 : may create a lot of class

## Some java example

Everything is in one file, ONLY because that was convenient as an
example.

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
                throw new IllegalArgumentException("not implemented yey");
        }
    }

    // test
    public static void main(String[] args) {
        Game game = new Game();
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