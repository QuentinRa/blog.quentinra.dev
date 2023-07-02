# Swing/AWT

<div class="row row-cols-md-2"><div>

Swing and AWT are libraries bundled with Java to create graphical interfaces. Swing was introduced as a replacement to AWT, but it didn't completely replace AWT.

☠️ Modern developers prefer to use [JavaFX](../javafx/index.md), which heavily cut down the quantity of code, and the time invested for the same output.
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

All Swing components are extending `JComponent` while AWT components are extending `Component`.

#### JFrame - window

You'll usually create a frame, and add some component inside. Then, you'll make it visible.

```java
JFrame f = new JFrame("title");
f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // when "x" pressed
f.setSize(500,500); // size
f.setLocation(0,0); // location in the screen
f.add(component);   // add content
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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>