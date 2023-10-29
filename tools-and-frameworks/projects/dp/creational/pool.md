# Object Pool Design Pattern

[Go back](../index.md#creational-)

<div class="row row-cols-lg-2"><div>

**Aliases** 📌: None

**Description** 📚: we create up to `n` object and when requested, we give one to whoever request one. Once they are done using it, we reset theirs so that it can be requested again by others.

</div><div>

**Advantages** ✅

* Improved performances and scalability

**Disadvantages** 🚫

* Complexity and maintenance overhead

**Notes** 📝

* None
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-lg-2"><div class="mt-4">

```java
public class Main {
    public static void main(String[] args) {
        CharacterPool characterPool = new CharacterPool(2);
        // take 2 instances in the pool
        Character player1 = characterPool.borrowCharacter();
        Character player2 = characterPool.borrowCharacter();
        // use them
        // add back one instance to the pool
        characterPool.returnCharacter(player1);
        // get back an instance
        Character player3 = characterPool.borrowCharacter();
    }
}
```

```java
public class Character {
    public Character(String name, int health) {
        // ...
    }

    // ...
}
```
</div><div class="mt-4">

```java
public class CharacterPool {
    private final List<Character> pool;

    public CharacterPool(int poolSize) {
        pool = new ArrayList<>(poolSize);
        for (int i = 0; i < poolSize; i++) {
            pool.add(createCharacter());
        }
    }

    public Character borrowCharacter() {
        for (Character character : pool) {
            if (character != null) {
                pool.remove(character);
                return character;
            }
        }
        return null; // No available characters in the pool
    }

    public void returnCharacter(Character character) {
        pool.add(character);
    }

    private Character createCharacter() {
        return new Character("Player", 100);
    }
}
```
</div></div>