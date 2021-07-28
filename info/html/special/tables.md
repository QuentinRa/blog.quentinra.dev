# Tables

[Go back](..)

You are gonna use the **table** tag with
a subtag **thead** for the first line with the column
names (if you want one) and **tbody** for your table content.

A line is made using **tr** tag, and you use
**th** for column names and **td** for column values.

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

<hr class="sr">

(I added some style)

<table class="table table-bordered table-dark text-warning">
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