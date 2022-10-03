# Android development

...

<hr class="sl">

## Views

<div class="row row-cols-md-2 mx-0"><div>

Everything displayed on the screen is a `View`.

* Display a text: `TextView`
* Display an image: `ImageView`
* Display a button: `Button`

`View` doesn't means that this is only a "view", a view be clickable/editable...
</div><div>

The layout is handled by a `ViewGroup`. Layouts are edited using the layout editor. There are located in `res > layout`.

* **ConstraintLayout**: arrange elements in a flexible way

</div></div>

<hr class="sr">

## Layout Editor

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

<ol style="list-style-type: lower-alpha">
<li><b>Mode</b>: you can switch to code/layout editor here</li>
<li><b>Palette</b>: a library of views that you can drag and drop to the design view</li>
<li><b>Design view</b>: what the user will see</li>
<li><b>BluePrint view</b>: everything is shown on it, included hidden elements</li>
<li><b>Component tree</b>: list of all views of your screen</li>
<li><b>Attributes</b>: edit the properties of a view</li>

</ol>
</div><div>

![Layout Editor](_images/layout_editor.png)
</div></div>

<hr class="sl">

## Resources

<div class="row row-cols-md-2 mx-0"><div>

On the left side, or in View > Tools Windows, you got the "Resources Manager". This is a tab in which you can easily track every resource of your application, in other words, files in `res`.
</div><div>

<details class="details-e">
<summary>Add a new "drawable" (image)</summary>

* Go to Drawables
* Click on "+"
* Import drawables
* The new file should be in the list
* You can drag, and drop it in the design view (or select it when creating a new imageview)
</details>
</div></div>