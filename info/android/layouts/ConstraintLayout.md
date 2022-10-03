# ConstraintLayout

[Go back](..)

According to the [Constraint Layout Documentation](https://developer.android.com/reference/androidx/constraintlayout/widget/ConstraintLayout): "A ConstraintLayout is a ViewGroup which allows you to position and size widgets in a flexible way".

<hr class="sl">

## Margins

<div class="row row-cols-md-2 mx-0"><div>

Margins are one way to place an element. Using margins, you will define the horizontal, and the vertical **"free space"** that the element can take. 

<div class="row row-cols-md-2 mx-0"><div>

![Constraint Layout Margins](../_images/cl_margins.png)
</div><div>

Click on "+" to add a margin.

For instance, if we have a screen width of 226dp, and we are adding a margin of 140 (left), and 25 (right), we will have a 61 dp of "free space" for our element.

![Constraint Layout Margins Space](../_images/cl_margins_space.png)

The part which is not linear is the "free space".
</div></div>
</div><div>

You can define what do to with the "free space". 

By default, both vertically, "layout_width", and "layout_height" are set to "**wrap_content**", so the **content is centered** in the free space.

You can set one to **0** which is a shortcut for **fill** the free space. 

You can click on the symbols next to the "+" to swap "in one click".

![Constraint Layout Margins Kind](../_images/cl_margins_kind.png)

</div></div>

<hr class="sr">

## Relative margins

<div class="row row-cols-md-2 mt-4"><div>

If you click on a View, you will see some circles. A margin can be applied relatively to another View. That could be viewed as "parenting/wrapping a View inside another".

![Button](../_images/button.png)

To make a View rendered relatively to another, simply connect one of its dots to another view.

</div><div>

![Constraint Layout Margins Relative](../_images/cl_margins_relative.png)

Once you did, moving the "parent" will move the child.
</div></div>