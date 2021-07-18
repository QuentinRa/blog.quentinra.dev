# Builder

[Go back](..)

When you got something big to do, just split it
into small tasks!

* ➡️ : in web/app you should code a method for the header, one for the main and one for the footer
* ✅ : more readable code
* 🚫 : ???

## Example in java

```java
import javax.swing.*;

public interface FrameBuilder {
    // generates header : menus, title, logo, ...
    JPanel generatesHeader();
    // generates page view
    JPanel generatesContent();
    // generates footer : logo?, tos, legal terms, ...
    JPanel generatesFooter();
}
```

A page of our website will most likely have the same footer/header so
be can create a class ``AbstractPage``.

```java
// a page of our website
public abstract class AbstractPage implements FrameBuilder {
    @Override
    public JPanel generatesHeader() { /* code ici */ }

    @Override
    public JPanel generatesFooter() { /* code ici */ }
}

// on surcharge la partie qui change
public class HomePage extends AbstractPage {
    @Override
    public JPanel generatesContent() { /* code ici */ }
}

// on surcharge la partie qui change
public class ContactPage extends AbstractPage {
    @Override
    public JPanel generatesContent() { /* code ici */ }
}
```