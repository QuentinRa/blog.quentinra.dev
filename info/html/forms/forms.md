# Notes about forms

[Go back](../index.md#forms)

Some notes about forms such as fields outside a form, or notes about the attribute "action", which is properly explained in the PHP course.

<hr class="sl">

## external fields

I wanted to add something that I did often, if an input field is not inside a form, you may add `id="a_form_id"` to your form, then you simply have to add inside the field `form="a_form_id"`.

```html
<form id="example"></form>

<button type="submit" form="example"></button>

<input type="text" form="example">
```

<hr class="sr">

## action

Every working form has an attribute "action", telling us where is the script handling the form server-side.

```html
<!-- we don't have one -->
<form action=""></form>
<form action="#"></form>
<!-- we got one -->
<form action="file.php"></form>
<form action="URL"></form>
```