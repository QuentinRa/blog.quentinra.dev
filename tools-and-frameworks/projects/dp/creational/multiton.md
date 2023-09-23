# Multiton Design Pattern

[Go back](../index.md#creational-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: None

**Description** 📚: This pattern is a generalization of the [singleton](singleton.md) pattern with `n` instances instead of `1`.

</div><div>

**Advantages** ✅

* Same as a singleton

**Disadvantages** 🚫

* Same as a singleton

**Notes** 📝

* We use `getInstance(xxx)` with `xxx` something to identify which instance you want <small>(ex: an int, a string...)</small>.
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-md-2"><div>

#### Lazy instantiation

<p></p>

```java
public class RpgMaker {
    private static final int MAX_INSTANCE = 5;
    private static ArrayList<RpgMaker> instance = null;

    // get instance
    public static RpgMaker getInstance(int i) {
        if (i > MAX_INSTANCE || i < 0) throw new IllegalArgumentException("not a valid key");
        if (instance == null) {
            // initialization
            instance = new ArrayList<>();
            // fill the list
            for (int j = 0; j < MAX_INSTANCE; j++) {
                instance.add(new RpgMaker());
            }
        }
        return instance.get(i);
    }

    // private !!!
    private RpgMaker(){}
}
```
</div><div>

#### Early instantiation

<p></p>

```java
public class RpgMaker {
    private static final int MAX_INSTANCE = 5;
    // initialization
    private static final ArrayList<RpgMaker> instance = new ArrayList<>();
    static {
        // fill the list
        for (int j = 0; j < MAX_INSTANCE; j++) {
            instance.add(new RpgMaker());
        }
    }

    // get instance
    public static RpgMaker getInstance(int i) {
        if (i > MAX_INSTANCE || i < 0) throw new IllegalArgumentException("not a valid key");
        return instance.get(i);
    }

    // private !!!
    private RpgMaker(){}
}
```
</div></div>