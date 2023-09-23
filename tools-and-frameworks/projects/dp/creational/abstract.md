# AbstractFactory Design Pattern

[Go back](../index.md#creational-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: Kit

**Description** 📚: an abstract factory is a factory that is creating factories instead of concrete instances, so now you don't even know which factory is creating objects.

</div><div>

**Advantages** ✅

* Great separation and isolation of classes

**Disadvantages** 🚫

* Too much code and often too complex

**Notes** 📝

* N/A
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-md-2"><div>

Assume we have some abstract classes:

```java
abstract class Monster {
    public abstract void attack();
}
abstract class Human {
    public abstract void speak();
}
```

Along their concrete implementations:

```java
class Goblin extends Monster {
    @Override
    public void attack() {
        System.out.println("Goblin attacks with a club!");
    }
}

class Spider extends Monster {
    @Override
    public void attack() {
        System.out.println("Spider bites with venom!");
    }
}

class Hero extends Human {
    @Override
    public void speak() {
        System.out.println("Hero says: I will save the day!");
    }
}
```

We need to define what our factories can do:

```
// Abstract Factory
abstract class AbstractFactory {
    public abstract Monster createMonster();
    public abstract Human createHuman();
}
```

Then we define our factories:

```java
// Monster Factory
class MonsterFactory extends AbstractFactory {
    @Override
    public Monster createMonster() {
        return new Goblin(); // You can create different types of monsters here.
    }

    @Override
    public Human createHuman() {
        return null; // This factory doesn't create humans.
    }
}

// Human Factory
class HumanFactory extends AbstractFactory {
    @Override
    public Monster createMonster() {
        return null; // This factory doesn't create monsters.
    }

    @Override
    public Human createHuman() {
        return new NPC(); // You can create different types of humans here.
    }
}
```
</div><div>

We can then create a class that will create instances of our factories. 

```java
class UnitCreator {
    public AbstractFactory getMonsterFactory() {
        return new MonsterFactory();
    }

    public AbstractFactory getHumanFactory() {
        return new HumanFactory();
    }
}
```

From the code below, we don't know:

* The factory used to create monsters
* The factory used to create humans
* The monster or human created

But we can write down code using Humans and Monsters.

```java
public class Main {
    public static void main(String[] args) {
        UnitCreator unitCreator = new UnitCreator();

        AbstractFactory monsterFactory = unitCreator.getMonsterFactory();
        Monster monster = monsterFactory.createMonster();
        monster.attack();

        AbstractFactory humanFactory = unitCreator.getHumanFactory();
        Human human = humanFactory.createHuman();
        human.speak();
    }
}
```
</div></div>