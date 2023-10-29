# Adapter Design Pattern

[Go back](../index.md#structural-)

<div class="row row-cols-lg-2"><div>

**Aliases** 📌: Wrapper, Translator

**Description** 📚: It's common in software development to have software that behaves in a specific way and a client software that requires to use it in another specific way.

The Adapter is a class that connects the two.
</div><div>

**Advantages** ✅

* Allow two programs/classes/... to interact with each other

**Disadvantages** 🚫

* Increase the amount of code to write/maintain

**Notes** 📝

* For instance, a webapp and a payment API
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-lg-2"><div>

Assuming, you defined that characters could only attack:

```java
public class Character {
    public void attack() {
        System.out.println("Character attacks!");
    }
}
```

But, the game, the client that was externally implemented, was expecting characters to be able to attack and defend:

```java
public interface RPGCharacter {
    void performAttack();
    void performDefense();
}
```

```java
public class RPGGame {
    private final RPGCharacter character;

    public RPGGame(RPGCharacter character) {
        this.character = character;
    }

    public void battle() {
        character.performAttack();
        // Perform new RPG logic here...
        character.performDefense();
    }
}
```
</div><div>

Then, we need to create an adapter to be able to use it:

```java
public class CharacterAdapter implements RPGCharacter {
    private final Character character;

    public CharacterAdapter(Character character) {
        this.character = character;
    }

    @Override
    public void performAttack() {
        character.attack();
    }

    @Override
    public void performDefense() {
        // do some implementation
        // so that it works
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        CharacterAdapter character = new CharacterAdapter(new Character());
        RPGGame game = new RPGGame(character);
        game.battle();
    }
}
```

👉 Here, we could also directly edit `Character` to implement `RPGCharacter` as it is an interface <small>(it could have been a class, a final class...).
</div></div>