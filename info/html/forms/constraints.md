# Notes about constrains

[Go back](../index.md#forms)

You can add constraints to your fields, such as required, to force the user to complete this field. You can also set a range of values, or a pattern for the values that are allowed. This is what we call HTML constraints.

```html
<!-- at least one letter, lowercase only -->
<input type="text" value="" placeholder="John DOE" required pattern="[a-z]+" />

<input type="checkbox" checked />

<input min="x" max="y" minlength="z" maxlength="t">
```

* **required**: this field must have a value (blank character pass the test like a space)
* **disabled**: the user can't modify/click on a button/field
* **hidden**: hide a field
* **checked**: check by default a checkbox / radio button
* **minlength**: min length (characters)
* **maxlength**: max length (characters)
* **min**: max value (int)
* **max**: max value (int)
* **pattern**: write a regex (regular expression) that the input must match

If the user is submitting an invalid value, or forgets to fill a field, then the browser will show him/her a message. You can also see the message when hovering the field. In JavaScript, you will be able to customize the messages shown.