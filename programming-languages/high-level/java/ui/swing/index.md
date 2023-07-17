# Swing/AWT

<div class="row row-cols-md-2"><div>

Swing and AWT are libraries bundled with Java to create graphical interfaces. Swing was introduced as a replacement for AWT, but it didn't completely replace AWT.

☠️ Modern developers prefer to use [JavaFX](../javafx/index.md), which heavily cuts down the quantity of code, and the time invested for the same output.
</div><div>

These are the two base packages:

```java!
import java.awt.*;    // awt
import javax.swing.*; // swing
```

👉 Swing classes usually start with `J` followed by their AWT name.
</div></div>

<hr class="sep-both">

## Components

<div class="row row-cols-md-2"><div>

A component is a graphical entity such as a Button.

All Swing components are extending `JComponent` while AWT components are extending `Component`.

```java
JComponent aComponent = new JButton();
```

**Child components**

```java
aComponent.add(anotherOne);
aComponent.remove(anotherOne);
aComponent.removeAll();
```

**Drawing**

```java
aComponent.repaint();        // redraw if modified
aComponent.revalidate();     // force redraw

aComponent.setVisible(true); // show
```
</div><div>

**Style**

```java
aComponent.setFont(new Font("name", Font.PLAIN, 20));
aComponent.setOpaque(true); // mark as having a background
aComponent.setBackground(Color.RED); // background color if opaque
aComponent.setForeground(Color.WHITE); // text color
```

**Size**

```java
// DO NOT USE setSize, it's ignored by most layouts
aComponent.setPreferredSize(new Dimension(50,50));
// MAY BE IGNORED by the layout
aComponent.setSize(new Dimension(50,50));
aComponent.setMinimumSize(new Dimension(50,50));
aComponent.setMaximumSize(new Dimension(50,50));
```
</div></div>

<hr class="sep-both">

## Examples of components

<div class="row row-cols-md-2"><div>

#### JFrame - window

You'll usually create a frame, and add a component inside. Then, you'll make it visible.

```java
JFrame f = new JFrame("title");
f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // when "x" pressed
f.setSize(500,500); // size
f.setLocation(0,0); // location in the screen
f.add(component);   // add ONE component, usually a JPanel
f.setVisible(true); // show, false by default
```

#### JLabel - a text

```java
JLabel label = new JLabel("text");
label.setHorizontalAlignment(JLabel.CENTER);
label.setText("xxxx");
String text = label.getText();
```
</div><div>

#### JButton - a button

```java
JButton b = new JButton("test");
b.addActionListener( /* refer to listeners */ );
```

#### Input fields

* `JTextArea`: a text input zone
* `JTextField`: a text input field
* `JPassword`: a password input field
* `JCheckBox`: a checkbox input field
* `JRadioButton`: a radio button
* `JList`: a select list

#### JPanel - group elements

We usually put components in a JPanel, allowing us to perform an action <small>(move, show/hide)</small> on the whole group.

```java
JPanel p = new JPanel();
p.add(xxx);               // add "xxx" to the group
```

👉 See also: `JScrollPane` for a scrollable panel.
</div></div>

<hr class="sep-both">

## Layout managers

<div class="row row-cols-md-2"><div>

Layout Managers determine how child components are displayed. They are commonly used with `JPanel` 🖼️.

```java
// some constructors can take a layout manager too
aComponent.setLayout(LayoutManager);
```

**By default, the layout manager is a FlowLayout**.

#### FlowLayout

In the [FlowLayout](https://docs.oracle.com/en/java/javase/20/docs/api/java.desktop/java/awt/FlowLayout.html), each component takes its preferred size. Elements could be aligned to the left, to the right, or to the center <small>(default)</small>.

```java
aComponent.setLayout(new FlowLayout(FlowLayout.LEFT));
```

#### BorderLayout

The [BorderLayout](https://docs.oracle.com/en/java/javase/20/docs/api/java.desktop/java/awt/BorderLayout.html) divides the container into 5 areas. The center takes up the remaining space. North and South expand as much as possible horizontally. East and West expand as much as possible vertically.

```java
aComponent.setLayout(new BorderLayout());
aComponent.add(component1, BorderLayout.NORTH);
aComponent.add(component2, BorderLayout.SOUTH);
aComponent.add(component3, BorderLayout.CENTER); // default
aComponent.add(component4, BorderLayout.EAST);
aComponent.add(component5, BorderLayout.WEST);
```
</div><div>

#### GridBagLayout

[GridBagLayout](https://docs.oracle.com/en/java/javase/20/docs/api/java.desktop/java/awt/GridBagLayout.html) is the most versatile layout. Before adding a component, you'll define the constraint on it <small>(position...)</small>.

```java
aComponent.setLayout(new GridBagLayout());

GridBagConstraints c = new GridBagConstraints();
c.gridx = 0; c.gridy = 0;                  // position
c.gridwidth = 1; c.gridheight = 1;         // colspan/rowspan
c.weightx = 0; c.weighty = 0;              // expand priority
c.anchor = GridBagConstraints.LINE_START;  // alignement
c.fill = GridBagConstraints.HORIZONTAL;    // expand behavior
c.insets = new Inset(top, left, bottom, right);  // padding

aComponent.add(someComponent, c);
```

#### GridLayout

In a [GridLayout](https://docs.oracle.com/en/java/javase/20/docs/api/java.desktop/java/awt/GridLayout.html), all rows/columns have the same width/height.

```java
aComponent.setLayout(new GridLayout(rowCount, colCount));
```

#### CardLayout

In a [CardLayout](https://docs.oracle.com/en/java/javase/20/docs/api/java.desktop/java/awt/CardLayout.html), we can swap the content displayed with another view.

```java
CardLayout cardLayout = new CardLayout();
aComponent.setLayout(cardLayout);
aComponent.add("key", view);        // adding a view
cardLayout.show(aComponent, "key"); // select a view
cardLayout.first(aComponent);       // show the first view
cardLayout.next(aComponent);        // show the next view
cardLayout.previous(aComponent);    // show the previous view
```
</div></div>

<hr class="sep-both">

## Event listeners

<div class="row row-cols-md-2"><div>

Listeners allow us to react when the user interacts with the view, such as by clicking on a button.

```
aComponent.addMouseListener(/* a listener here */);
aComponent.removeMouseListener(/* a listener here */);
aButton.addActionListener(/* a listener here */);
aJFrame.addWindowListener(/* a listener here */);
// see also: MouseMotionListener, MouseWheelListener...
```

#### Mouse listener

You can also use `MouseAdapter` (abstract class) implementing MouseListener, MouseWheelListener, and MouseMotionListener.

```java
public class MyMouseListener implements MouseListener {
    @Override // click
    public void mouseClicked(MouseEvent e){}
    @Override // hover (entering)
    public void mouseEntered(MouseEvent e){}
    @Override // hover (exiting)
    public void mouseExited(MouseEvent e){}
    @Override
    public void mousePressed(MouseEvent e){}
    @Override
    public void mouseReleased(MouseEvent e){}
}
```
</div><div>

#### Action listener

This listener is called when a button is pressed.

```java
// public class MyActionListener implements ActionListener
// public void actionPerformed(ActionEvent e)
aButton.addActionListener(e -> {
    // get the button (if needed)
    Object source = e.getSource();
    JButton button = (JButton) source;
    // get the text of the button (if needed)
    String text = e.getActionCommand();
    // ...
});
```

#### Window listener

You can also use `WindowAdapter` (abstract class) implementing WindowListener, WindowStateListener, and WindowFocusListener

```java
public class MyWindowListener implements WindowListener {
    @Override // never called?
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
    @Override // never called?
    public void windowOpened(WindowEvent e){}
}
```
</div></div>

<hr class="sep-both">

## Drawing

<div class="row row-cols-md-2"><div>

You can draw your own component by extending `JComponent` and overriding `paintComponent`.

```
import javax.swing.JComponent;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Font;
import java.awt.RenderingHints;

public class Demo extends JComponent {

    @Override
    protected void paintComponent(Graphics g) {
        // make a copy just in case
        Graphics2D copy = (Graphics2D) g.create();

        // do not draw a background if not opaque
        if (isOpaque()) {
            copy.setColor(getBackground());
            copy.fillRect(0, 0, getWidth(), getHeight());
        }

        // ...
    }
}
```
</div><div>

Some parts of code you might use:

```java!
// drawing options
RenderingHints rh = new RenderingHints(
    RenderingHints.KEY_ANTIALIASING,
    RenderingHints.VALUE_ANTIALIAS_OFF);
copy.setRenderingHints(rh);

// color, font, ...
copy.setColor(Color.RED);
copy.setFont(new Font("name", Font.PLAIN, 20));

// forms
copy.drawLine(int x1, int y1, int x2, int y2);
copy.drawPolygon( int[] xPoints, int[] yPoints, int nPoints);
copy.drawRect(int x, int y, int width, int height);
// ...

// images
// (Toolkit.getDefaultToolkit().getImage(path) ???)
copy.drawImage(Image img, int x, int y, ImageObserver observer)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Event thread
* `SwingUtilities.invokeLater(Runnable);`
</div><div>


</div></div>