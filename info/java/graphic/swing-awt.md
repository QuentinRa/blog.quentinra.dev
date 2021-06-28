# Swing and AWT

[Go back](..#graphical-interfaces)

Swing and AWT are the native way of creating 
graphical interfaces. AWT was the first library
but was quite slow so Swing got introduced. Now,
both are the same.

```java
// awt
import java.awt.*;
// swing
import javax.swing.*;
```

Why I hating Swing/AWT? A lot of graphical bugs. Using
some repaint and co. on components without a background
may also draw remnant of the previous draw... I created
the same app in Swing and Javafx and in JavaFX the app
is faster, with less code and easier to change
since I'm using fxml so don't use Swing/AWT.

<hr class="sl">

## Components

Swing and AWT have a lot of similar classes, in SWING
the names are starting with a ``J`` then the AWT name.

All swing components extends ``JComponent`` while
AWT components are extending ``Component``.

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

Before digging into listeners, drawing and layout managers, here is a list
of what you could expect of a JComponent.

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