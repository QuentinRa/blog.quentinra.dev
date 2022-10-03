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

## UI

* scaleType:centerCrop scale without distorting (9patches)

Layout are edited using the layout editor. `res > layout > activity_main.xml`. 

Returning on the view

* To place an element in a **ConstraintLayout**, you need to add constraints to it.
* If you give layout_width+height "0dp", android studio will match the constraint. If they are "0", then it basically means "fill".

> You can attach a component to another in a constraint layout. click on one of the four circles on something, and link it ot the circle of another view. By doing so, constraint will be relative to the other view. And, moving the "parent" will move the child.

> * You got options to do things faster using right-click.
> * There is a search bar (ex: for attributes)

<hr class="sr">

## Resources

On the left side, or in View > Tools Windows, you got the "Resources Manager". You can use it.

**Import image**

* Go to Drawables
* Click on "+"
* Import drawables
* The new file should be in the list
* You can drag, and drop it in the design view (or select it when creating a new imageview)

<hr class="sr">

## Localization

There is a folder `values` in resources. You can add your own folder for a specific case (ex: support another language). In strings.xml, you can add 

* a key
* a "default" translation for this key

If you create another folder "values" (ex: `values-fr+ca/strings.xml`), you will keep the key, and change the translation. In the code, you will only reference the "key".

If you created something with a "text" not localized. You can click on the "warning", then expand "Hardcoded text", and click on fix.

<hr class="sl">

## Accessibility

* `contentDescription`: what's the purpose of this element
* `importantForAccessibility`: if this element is just decorative, you can set it to no