# Multiton

[Go back](..)

A singleton but we have also another attribute to limit
the number of instances created.

* ➡️ : when you want a bit more than a singleton
* ✅ : same as singleton
* 🚫 : same as singleton

## Example in java

```java
public class RpgMaker {
    private static final int MAX_INSTANCE = 5;
    private static ArrayList<RpgMaker> instance = null;

    // get instance, lazy instantiation
    public static RpgMaker getInstance(int i) {
        // creates
        if(i > MAX_INSTANCE) throw new IllegalArgumentException("not a valid key");
        if(instance == null){ // creates
            instance = new ArrayList<>();
            for (int j = 0; j < MAX_INSTANCE; j++) {
                instance.add(new RpgMaker());
            }
        }
        return instance.get(i);
    }

    // private !!!
    private RpgMaker(){}

}

public class RpgMaker {
    private static final int MAX_INSTANCE = 5;
    // creates, early instantiation
    private static final ArrayList<RpgMaker> instance = new ArrayList<>();

    static {
        // fill
        for (int j = 0; j < MAX_INSTANCE; j++) {
            instance.add(new RpgMaker());
        }
    }

    // get instance
    public static RpgMaker getInstance(int i) {
        // creates
        if(i > MAX_INSTANCE) throw new IllegalArgumentException("not a valid key");
        return instance.get(i);
    }

    // private !!!
    private RpgMaker(){}

}
```