# ActionListener

[Go back](..#events-and-listeners)

This is an example of what you can do in the method `actionPerformed` of `ActionListener`.

```java
public class MyActionListener implements ActionListener {
    @Override
    public void actionPerformed(ActionEvent e){
        // each time the button is clicked
        
        // get the button (if needed)
        Object source = e.getSource();
        JButton button = (JButton) source;

        // get the text of the button (if needed)
        String text = e.getActionCommand();
        
        // ...
    }
}
```

And you can add the listener like this

```java
JButton b;
// ...
b.addActionListener(new MyActionListener());
```