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

<hr class="sl">

## Layout manager

You may have wondered how you could set a component
to be somewhere in the frame. All JComponents
got a method ``setLayout(LayoutManager m)``
taking a LayoutManager which is actually defining
how the ``add`` method will work.

**By default, the layout is a FlowLayout**,
you may use null to disabled the layout.

* [BorderLayout](swing/layout/border-layout.md)
* [FlowLayout](swing/layout/flow-layout.md)
* [CardLayout](swing/layout/card-layout.md)
* [GridLayout](swing/layout/grid-layout.md)
* [GridBagLayout](swing/layout/grid-bag-layout.md)

<hr class="sr">

## Events and listeners

We are calling listeners, classes having a function
(handler) called when an action (click, mouse moved, ..)
is done. Inside the handler, you will write the code
specific to the event.

You can add listener using methods like
``addMouseListener`` or `addActionListener` (only
on buttons). You can use ``addWindowListener``
on Windows like a ``JFrame``.

* [ActionListener](swing/listeners/action-listener.md)
* [MouseListener](swing/listeners/mouse-listener.md)
* [WindowListener](swing/listeners/window-listener.md)
* MouseMotionListener (drag and drop)
* MouseWheelListener (scroll)

Lazy (or smart?) ones are using the lambda syntax
to declare a listener since they are functional
interfaces

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

but you should create a class (be it inner or not)
since that's way better (in most cases).