# Enumerations

[Go back](..)

It's a class of static instances.

```java
public enum RpgClasses {
 SORCERER, WARRIOR, ARCHER, TANK
}
```

You can write ``RpgClasses.SORCERER`` to use
an object of the class ``RpgClasses``. `enum`
can't extends another class, since it's already extending
``java.lang.Enum`` (implicitly). You can implements interfaces
trough.

> You should use Enumerations when you have a finite
> number of values. It's not a good thing to use it
> for something where you may add values (like
> here with RpgClasses) since you might break others code.
> (switch won't work anymore, foreach might do something
> unexpected...)

<div class="sr"></div>

## Complexes enums

You can add methods and attributes, along with a constuctor
in an enum.

```java
public enum ClassesRpg {
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
int sorcerer_hp = ClassesRpg.SORCERER.getHP();
```