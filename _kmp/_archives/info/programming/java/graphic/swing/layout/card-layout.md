# CardLayout

[Go back](..#layout-manager)

In a website, you got the same header/footer in each pages (don't say no) and you are only changing the center. 

This layout is the one that you would put in the center, and using some methods should could change the view rendered by the layout.

```java
CardLayout cardLayout = new CardLayout();
jcomponent.setLayout(cardLayout);

// adding views
jcomponent.add("key", view);
jcomponent.add("key2", view);

// show the view by key
cardLayout.show(jcomponent, "key");

// show first / next / previous
cardLayout.first(jcomponent);
cardLayout.next(jcomponent);
cardLayout.previous(jcomponent);
```