# Builder

[Go back](..)

When you got something big to do, just split it into small tasks!

* ➡️ : in web/app you should code a method for the header, one for the main and one for the footer
* ✅ : more readable code
* 🚫 : ???

<hr class="sl">

## Example in java

```java
import javax.swing.*;

public interface FrameBuilder {
    // generates header: menus, title, logo, ...
    JPanel generatesHeader();
    // generates the main
    JPanel generatesContent();
    // generates footer: logo?, tos, legal terms, ...
    JPanel generatesFooter();
}
```

A page of our website will most likely have the same footer/header, so we can create a class ``AbstractPage``.

```java
// a page of our website
public abstract class AbstractPage implements FrameBuilder {
    @Override
    public JPanel generatesHeader() { /* code */ }

    @Override
    public JPanel generatesFooter() { /* code */ }
}

// we are overriding generatesContent since this part is different in each page
public class HomePage extends AbstractPage {
    @Override
    public JPanel generatesContent() { /* code */ }
}

// we are overriding generatesContent since this part is different in each page
public class ContactPage extends AbstractPage {
    @Override
    public JPanel generatesContent() { /* code */ }
}
```