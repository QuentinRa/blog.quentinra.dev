# User Interface (UI)

In Unity, UI stuff is in a game object called "**canvas**". Simply create one (UI > canvas), then you can add buttons (UI > buttons), texts (UI > text), etc. as a child of your canvas. Note that creating a UI element outside a canvas will automatically generate a new canvas.

> **Pro tip**: **go back to 2D** to create your user interface. If you were in 3D, simply toggle "2D" in the Scene windows ![Unity UI toggle 2D](images/toggle2D.png).

<details class="details-e">
<summary>Positioning components</summary>

It's not the best to manually place something in your canvas. What if a user got a window smaller or larger? **We are usually using anchors (`ancrage`) to position components**.

Click on a UI element, and check the "Rect Transform". Then click on this (**Anchor presets**) ![Unity UI Anchor presets](images/anchor_presets.png).

By pressing **ALT** and clicking on elements of the grid, you can position your component somewhere in the canvas, and you can stretch it too (increase width, height, both).

Here is an example of positioning an image near the top.

![Example Unity UI Anchor presets](images/anchor_presets.gif)
</details>

<details class="details-e">
<summary>How to ...?</summary>

* **Responsive canvas**

If you are **not using anchors**, you can click on your canvas, and in the component "canvas scaler", set **mode to "scale with the screen size"** while defining a size. I think it's better to use anchors.

* **Handle backgrounds**

You can create an Image, or an empty component, or do this on any component having the component "Image". You may drop a **sprite** (see 2D-sprites) in "Source Image" to create a **background image**, and/or you may **change the color**/**add a material**.

* **Override width/height/...**

If you want to override the minimum/preferred/... width, height, then you can do that by adding a **Layout element component** to the game object you want to override. You can use this when you got components inside another, and you want one to act a bit differently.

* **Auto-resize components**

If you got a component with some text, you may want your component to auto-resize itself, when the text is shorter or longer, smaller or bigger. You can do that by adding a component called "Content Size Fitter" and setting either (or both) fields to "Preferred size".

> **Pro tip**: you may have to add a layout, for instance, a horizontal layout, which is allowing you to use padding too.
</details>

<details class="details-e">
<summary>Layout managers</summary>

**Layout managers** (`gestionnaires de mise en page`) are components allowing you to design easily your interface. You need **to create an empty game object** (empty is not mandatory) and give it to the layout manager. Once you did, **children of the** empty **game object will be displayed according to the manager you picked**.

If you are familiar with Swing in Java, then this is quite similar.

* **Horizontal Layout**

Components are on the same line, with a gap (that is 0 by default).

* **Vertical Layout**

One component per line, with a gap between lines (that is 0 by default).

* **Grid Layout**

A horizontal layout by default. You can make columns and rows by selecting another value for the field "constraint".
</details>

<details class="details-e">
<summary>Handling multiple menus / another way of referencing something</summary>

You could create multiple canvas, and turn them on/off. I heard that Unity is advising against this, but I couldn't find proof that this is not a good practice. Anyway, another way to

* create a canvas, and put everything inside
* Add a component "XXXManager" (your script) on the canvas
* Add a component "XXXElement" (your script) on each menu (you may use "Empty Game objects", and put your stuff inside)

Then, in the manager, you are using `GetComponentsInChildren<XXXElement>`. As each component got a field "gameObject" for the associated game object, you got your menus too from their components. You may add a method in **XXXElement** returning the kind of menu (use an enum) to do specific stuff according to the kind of menu.
</details>

<details class="details-e">
<summary>UI Events</summary>

You can add a listener <small>(a method that will be called when an event is triggered)</small>

* in the code

```cs
GetComponent<Button>().onClick.AddListener(() => {});
GetComponent<Button>().onClick.AddListener(MyMethod);
```

* in the editor

You need to add an entry inside "On Click" (ex: Button > On Click). Select "Runtime Only" and drag and drop a component having the script in which you got the method you want to call. Then select the method in "No Function".
</details>

> **Pro tip**: As you can watch is [this video, there is a new way to create interfaces, called UI Builder](https://www.youtube.com/watch?v=NQYHIH0BJbs&ab_channel=CocoCode). It's not available yet.