# User Interface (UI)

#### How to ...?

* **Responsive canvas**

If you are **not using anchors**, you can click on your canvas, and in the component "canvas scaler", set **mode to "scale with the screen size"** while defining a size. I think it's better to use anchors.

* **Handle backgrounds**

You can create an Image, or an empty component, or do this on any component having the component "Image". You may drop a **sprite** (see 2D-sprites) in "Source Image" to create a **background image**, and/or you may **change the color**/**add a material**.

* **Override width/height/...**

If you want to override the minimum/preferred/... width, height, then you can do that by adding a **Layout element component** to the game object you want to override. You can use this when you got components inside another, and you want one to act a bit differently.

* **Auto-resize components**

If you got a component with some text, you may want your component to auto-resize itself, when the text is shorter or longer, smaller or bigger. You can do that by adding a component called "Content Size Fitter" and setting either (or both) fields to "Preferred size".

> **Pro tip**: you may have to add a layout, for instance, a horizontal layout, which is allowing you to use padding too.