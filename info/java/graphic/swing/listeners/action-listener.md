# ActionListener

[Go back](..#events-and-listeners)

```java
public class MyActionListener implements ActionListener {
    @Override
    public void actionPerformed(ActionEvent e){
        // each time the button is clicked
        
        // get the button (if needed)
        Object source = e.getSource();
        JButton button = (JButton) source;

        // get the button text (if needed)
        String text = e.getActionCommand();
        
        // ...
    }
}
```

And

```java
JButton b;
// ...
b.addActionListener(new MyActionListener());
```