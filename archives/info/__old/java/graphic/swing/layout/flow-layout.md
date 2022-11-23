# FlowLayout

[Go back](..#layout-manager)

Add the components one after another and gives them their **preferredSize**. Layout by default.

```java
// flow-pane right-aligned
FlowLayout right = new FlowLayout(FlowLayout.RIGHT);
// flow-pane left-aligned
FlowLayout left = new FlowLayout(FlowLayout.LEFT);
// flow-pane centered, default
FlowLayout center = new FlowLayout(FlowLayout.CENTER);
// using default
center = new FlowLayout();

// ...
jcomponent.setLayout(center);
jcomponent.add(component1);
jcomponent.add(component2);
jcomponent.add(component3);
```