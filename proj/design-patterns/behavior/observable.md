# Observable

[Go back](..)

An observer is someone who wants to be notified when an event occurred on an observable. This could be the Undo class, which wants to be notified when we clicked (event=click) on the undo button (=observable).

* ✅ : simple communication
* 🚫 : ...

<hr class="sl">

## Example on Java

In Java < 9, when Observable and Observer were not deprecated.

```java
import java.util.Observable;
import java.util.Observer;

public class GameManager implements Observer {

    // ... faking some game
    private final GameMap map = new GameMap();

    @Override
    public void update(Observable o, Object arg) {
        System.out.println("GameManager, message received");
        // call on each component of the game
        this.map.update(o, arg);
        // ...
    }

    public static void main(String[] args) {
        GameManager g = new GameManager();
        Player p = new Player();
        p.addObserver(g);
        // manually call observer
        p.setChanged();// fake
        p.notifyObservers("player bought Caladbolg +9");// fake some event on player
    }
}

class GameMap implements Observer {
    @Override // print some random text
    public void update(Observable o, Object arg) { System.out.println("GameMap, message received");}
}

class Player extends Observable {
    @Override // trigger change
    public synchronized void setChanged() { super.setChanged(); }
}
```

And now we could do it like this

```java
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;

public class GameManager implements PropertyChangeListener {

    // ... faking some game
    private final GameMap map = new GameMap();

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        System.out.println("GameManager, message received");
        // call on each component of the game
        this.map.propertyChange(evt);
        // ...
    }

    public static void main(String[] args) {
        GameManager g = new GameManager();
        Player p = new Player();
        p.addObserver(g);
        // do some event
        p.buy("Caladbolg +9");
    }

}

class GameMap implements PropertyChangeListener {
    @Override // print some random text
    public void propertyChange(PropertyChangeEvent evt) {
        System.out.println("GameMap, message received : "+evt.getNewValue());
    }
}

class Player {
    private final PropertyChangeSupport support;

    public Player() {
        this.support = new PropertyChangeSupport(this);
    }

    // proxy
    public void addObserver(PropertyChangeListener o){ this.support.addPropertyChangeListener(o); }
    public void removeObserver(PropertyChangeListener o){ this.support.removePropertyChangeListener(o); }

    // some method
    public void buy(String item){
        // call for change
        this.support.firePropertyChange("buy", this.support, item);
        //...
    }
}
```