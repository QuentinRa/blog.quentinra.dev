# Observable Design Pattern

[Go back](../index.md#behavioral-)

<div class="row row-cols-lg-2"><div>

**Aliases** 📌: None

**Description** 📚: An observable is a class that is able to notify its observers when an event occurs.

For instance, `A` class `B` will register itself as an observer of class `B`. If B changes, then `A` will be notified.

</div><div>

**Advantages** ✅

* Simplified communication

**Disadvantages** 🚫

* ???

**Notes** 📝

* None
</div></div>

<hr class="sep-both">

## Java Implementation

<div class="row row-cols-lg-2"><div>

For instance, a `game` class might want to be notified when the player does something. The game will be registered as an Observer. 

```java
public class Main {
    public static void main(String[] args) {
        GameManager g = new GameManager();
        Player p = new Player();
        p.addObserver(g);
        p.buy("XXX +9");
    }
}
```

The game itself may transfer the event to someone else:

```java
public class GameManager implements PropertyChangeListener {
    private final GameMap map = new GameMap();

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        System.out.println("GameManager, message received");
        // call on each component of the game
        this.map.propertyChange(evt);
        // ...
    }
}
```

```java
public class GameMap implements PropertyChangeListener {
    @Override // print some random text
    public void propertyChange(PropertyChangeEvent evt) {
        System.out.println("GameMap, message received : " + evt.getNewValue());
    }
}
```
</div><div>

```java
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;

public class Player {
    private final PropertyChangeSupport support;

    public Player() {
        this.support = new PropertyChangeSupport(this);
    }

    // proxy
    public void addObserver(PropertyChangeListener o) {
        this.support.addPropertyChangeListener(o);
    }

    public void removeObserver(PropertyChangeListener o) {
        this.support.removePropertyChangeListener(o);
    }

    // some method
    public void buy(String item) {
        // call for change
        this.support.firePropertyChange("buy", this.support, item);
        //...
    }
}
```
</div></div>