# Tables

[Go back](../index.md#learn-the-tags-advanced)

You are going to use the **table** tag with a subtag **thead** for the first line with the column names (if you want one) and **tbody** for your table content. A line is made using **tr** tag, and you use **th** for the columns' names and **td** for the columns' values.

```html
<table>
    <!-- header of your table -->
    <thead>
        <tr>
            <th>column1 title</th>
            <th>column2 title</th>
        </tr>
    </thead>
    <!-- body of your table -->
    <tbody>
        <!-- a line -->
        <tr>
            <td>line-1 col-1</td>
            <td>line-1 col-2</td>
        </tr>
        <tr>
            <td>line-2 col-1</td>
            <td>line-2 col-2</td>
        </tr>
    </tbody>
</table>
```

<details>
<summary>Note that this is a good practice to use thead and tbody (HTML5), but you can omit them (🙄😒)</summary>

```html
<table>
<tr>
    <th>column1 title</th>
    <th>column2 title</th>
</tr>
<tr>
    <td>line-1 col-1</td>
    <td>line-1 col-2</td>
</tr>
<tr>
    <td>line-2 col-1</td>
    <td>line-2 col-2</td>
</tr>
</table>
```
</details>

<hr class="sr">

## Preview

Note that I added some style.

<table class="table table-bordered border-dark">
    <!-- header of your table -->
    <thead>
        <tr>
            <th>column1 title</th>
            <th>column2 title</th>
        </tr>
    </thead>
    <!-- body of your table -->
    <tbody>
        <!-- a line -->
        <tr>
            <td>line-1 col-1</td>
            <td>line-1 col-2</td>
        </tr>
        <tr>
            <td>line-2 col-1</td>
            <td>line-2 col-2</td>
        </tr>
    </tbody>
</table>

The table **raw** is a bit unreadable/messy after all

<table>
<thead>
<tr><th>column1 title</th><th>column2 title</th></tr>
</thead>
<tbody>
<tr><td>line-1 col-1</td><td>line-1 col-2</td></tr>
<tr><td>line-2 col-1</td><td>line-2 col-2</td></tr>
</tbody>
</table>

<hr class="sl">

## Improving your tables

<br>

<details class="details-border">
<summary>You can add a caption, a small title above your table</summary>
<br>
<table class="caption-top  table-bordered table border-dark">
<caption class="text-center">Some caption</caption>
<thead>
<tr><th>column1 title</th><th>column2 title</th></tr>
</thead><tbody><tr><td>line-1 col-1</td><td>line-1 col-2</td></tr></tbody>
</table>

The code is

```html
<table>
    <caption>Some caption</caption>
    <!-- ... -->
</table>
```
</details>

<details class="details-border">
<summary>If you have a footer, you may use tfoot</summary>
<br>
<table class="table-bordered table border-dark">
<thead>
<tr><th>column1 title</th><th>column2 title</th></tr>
</thead><tbody><tr><td>line-1 col-1</td><td>line-1 col-2</td></tr></tbody><tfoot><tr><td>Footer</td><td>Footer</td></tr></tfoot>
</table>

The code is

```html
<table>
    <!-- ... -->
    <tfoot>
        <tr>
            <td>Footer</td>
            <td>Footer</td>
        </tr>
    </tfoot>
</table>
```
</details>

<details class="details-border">
<summary>You can add colspan/rowspan to a cell (td/th), to make it take multiples columns/lines.</summary>
<br>
<table class="table-bordered table border-dark">
<thead>
<tr><th>column1 title</th><th>column2 title</th></tr>
</thead><tbody>
<tr><td colspan="2">line-1 col</tr>
<tr><td>line-2 col-1</td><td>line-2 col-2</td></tr>
</tbody>
</table>

The code is

```html
<table>
    <!-- ... -->
    <tfoot>
        <tr>
            <td>Footer</td>
            <td>Footer</td>
        </tr>
    </tfoot>
</table>
```
</details>