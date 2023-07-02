# Swing and AWT

Swing and AWT have a lot of similar classes, in SWING the names are starting with a `J then the AWT name.

All swing components extends `JComponent` while AWT components are extending `Component`.

```java
JFrame f = new JFrame("title");
// close on "x", HIDE_ON_CLOSE by default...
f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
f.setSize(500,500); // size
f.setLocation(0,0); // location in the screen

// adding content
f.add(component);

f.setVisible(true); // show, false by default
```

Components are classes like

* JLabel (text)
* JButton (button)
* JTextArea (text area)
* JTextField (input field)
* JPassword (input field, type=password)
* JCheckBox (input field, type=checkbox)
* JRadioButton (input field, type=radio)
* JList (select list)
* JPopupMenu

And you got some containers

* JPanel (like a div in HTML)
* JScrollPane (a div with a scroll)

```java
JButton b = new JButton("test");
b.addActionListener( /* listener */ );

JLabel l = new JLabel("text");
l.setHorizontalAlignment(JLabel.CENTER);
String text = l.getText();
l.setText(text);

JPanel p = new JPanel();
p.add(b);
p.add(l);
```

<hr class="sr">

## JComponent

Before digging into listeners, drawing and layout managers, here is a list of what you could expect of a JComponent.

```java
JComponent aComponent = new JPanel(); // we don't care about what component
JComponent anotherOne = new JButton(); // we don't care about what component

// add
aComponent.add(anotherOne);
aComponent.remove(anotherOne);
aComponent.removeAll();
// show
aComponent.setVisible(true);

// events
aComponent.addMouseListener(null /* listener here */);
aComponent.removeMouseListener(null /* listener here */);

// layout
aComponent.setLayout(null /* layout manager here */);

// style
aComponent.setFont(new Font("name", Font.PLAIN, 20));
aComponent.setOpaque(true); // have a background
aComponent.setBackground(Color.RED); // background color if opaque
aComponent.setForeground(Color.WHITE); // text color

// redraw if modified
aComponent.repaint();
// force redraw, invalidate the view
aComponent.revalidate();

// DO NOT USE setSize
// only PreferredSize is read most of the size
aComponent.setPreferredSize(new Dimension(50,50));
// MAY BE IGNORED by the layout
aComponent.setSize(new Dimension(50,50));
aComponent.setMinimumSize(new Dimension(50,50));
aComponent.setMaximumSize(new Dimension(50,50));
```

<hr class="sl">

## Layout manager

You may have wondered how you could set a component to be somewhere in the frame. All JComponents got a method `setLayout(LayoutManager m)` taking a LayoutManager which is actually defining how the `add` method will work.

**By default, the layout is a FlowLayout**, you may use null to disabled the layout.

* [BorderLayout](layoutr-layout.md)
* [FlowLayout](layoutlayout.md)
* [GridLayout](layoutlayout.md)
* [CardLayout](layoutlayout.md)
* [GridBagLayout](layoutbag-layout.md)

<hr class="sr">

## Events and listeners

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