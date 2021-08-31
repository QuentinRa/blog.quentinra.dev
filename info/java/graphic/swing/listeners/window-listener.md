# WindowListener

[Go back](..#events-and-listeners)

You can also use `MouseAdapter` (abstract class) implementing WindowListener, WindowStateListener, and WindowFocusListener

```java
public class MyWindowListener implements WindowListener {

    @Override // never called ?
    public void windowClosed(WindowEvent e){}

     @Override // before closing
    public void windowClosing(WindowEvent e){}

    @Override
    public void windowActivated(WindowEvent e){}

    @Override
    public void windowDeactivated(WindowEvent e){}

    @Override
    public void windowIconified(WindowEvent e){}

    @Override
    public void windowDeiconified(WindowEvent e){}

    @Override // never called ?
    public void windowOpened(WindowEvent e){}

}
```