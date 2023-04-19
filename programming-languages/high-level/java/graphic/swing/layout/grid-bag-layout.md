# GridBagLayout

[Go back](..#layout-manager)

A great layout (yet a pain in the ass to use), allowing you to do what was hard to do using other layouts.

```java
jcomponent.setLayout(new GridBagLayout());

// set the constraints that will be used to place
// the component
GridBagConstraints c = new GridBagConstraints();
c.gridx = int; // starts from 0, the position (column)
c.gridy = int; // starts from 0, the position (row)
c.gridwidth = int; // number of columns taken (colspan)
c.gridheight = int; // number of rows taken (rowspan)

// sort of expand, a value like a percent
// used to guess what to do with the remaining space
c.weightx = double;
c.weighty = double;

// alignement
c.anchor = {NORTH, EAST, ..., SOUTHEAST, SOUTHWEST};
// if weight, components may fill their container
c.fill = {BOTH, NONE, HORIZONTAL, VERTICAL}
// padding
c.insets = new Inset(top, left, bottom, right);

// add "something" with the contraint "c" 
jcomponent.add(something, c);
```