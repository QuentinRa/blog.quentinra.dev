# Enumerations

[Go back](../../index.md#advanced)

It's a class of static instances.

```java
public enum RpgClasses {
 SORCERER, WARRIOR, ARCHER, TANK
}
```

You can write `RpgClasses.SORCERER` to use an object of the class `RpgClasses`. `enum` can't extend another class, since it's already extending `java.lang.Enum` (implicitly). You can implements interfaces through.

> You should use Enumerations when you have a finite number of values. It's not a good thing to use it for something where you may add values (like here with RpgClasses) since you might break others' code  (switch won't work anymore, foreach might do something unexpected...).

<hr class="sr">

## Complexes enums

You can add methods and attributes, along with a constructor in an enum.

```java
public enum RpgClasses {
    SORCERER(12,58), WARRIOR(58,12), ARCHER(35,35), TANK(70,0)
    
    ; // YOU MUST ADD A COMMA TO END THE LIST

    private int hp;
    private int mp;

    // constructeur, must be package-private
    ClassesRpg(int hp, int mp){
        this.hp = hp;
        this.mp = mp;
    }

    public getHP(){ return this.hp; }
    public getMP(){ return this.mp; }
}
```

Usage would be

```java
int sorcerer_hp = RpgClasses.SORCERER.getHP();
```

<hr class="sr">

## You might like

* `ClassesRpg.values()` : to get all the values of an enum.
* `ClassesRpg.SORCERER.name()`: returns SORCERER
* `ClassesRpg.SORCERER.ordinal()`: returns 0

**EnumMap**

It's like a Hashmap but the key are values of an enum.

```java
EnumMap<EnumClass, ValueClass> map;
map = new EnumMap<>(EnumClass.class);
```