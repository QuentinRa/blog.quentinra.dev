# Swing and AWT

Events and listeners

```java
// events
aComponent.addMouseListener(null /* listener here */);
aComponent.removeMouseListener(null /* listener here */);
```

We are calling listeners, classes having a function (handler) called when an action (click, mouse moved, ..) is done. Inside the handler, you will write the code specific to the event.

You can add listener using methods like `addMouseListener` or `addActionListener` (only on buttons). You can use `addWindowListener` on Windows like a `JFrame`.

* [ActionListener](listenersn-listener.md)
* [MouseListener](listeners-listener.md)
* [WindowListener](listenersw-listener.md)
* MouseMotionListener (drag and drop)
* MouseWheelListener (scroll)

Lazy (or smart?) ones are using the lambda syntax to declare a listener since they are functional interfaces

```java
JButton b;
// ...
b.addActionListener(e -> {
 // code ici
});

// or
b.addActionListener(new ActionListener(){
 @Override
 public void actionPerformed(ActionEvent e){
        // code ici
 }
});
```

but you should create a class (be it inner or not) since that's way better (in most cases).

<hr class="sl">

## Drawing

Extends JComponent and override `paintComponent` method. Do anything you want inside.

```java
import javax.swing.JComponent;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Font;
import java.awt.RenderingHints;

public class class Demo extends JComponent {

    @Override
    protected void paintComponent(Graphics g) {
        // make a copy just in case
        Graphics2D copy = (Graphics2D) g.create();

        // do not draw a background if not opaque
        if (this.isOpaque()) {
            copy.setColor(this.getBackground());
            copy.fillRect(0, 0, this.getWidth(), this.getHeight());
        }

        // drawing options
        RenderingHints rh = new RenderingHints(
                RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_OFF);
        copy.setRenderingHints(rh);

        // color, font, ...
        copy.setColor(Color.RED);
        copy.setFont(new Font("name", Font.PLAIN, 20));

        // forms
        copy.drawLine( int x1, int y1, int x2, int y2);
        copy.drawPolygon( int[] xPoints, int[] yPoints, int nPoints);
        copy.drawRect( int x, int y, int width, int height);
        // ...

        // image
        // (Toolkit.getDefaultToolkit().getImage(path) ???)
        copy.drawImage(Image img, int x, int y, ImageObserver observer)
    }
}
```