# Learning about form input fields

[Go back](..)

You will add a lot of input fields in your form,
giving you something like this for each field

```html
<label for="nameField">Your name</label>
<input id="nameField" name="name" type="text" value="" placeholder="John DOE" />
```

Explanations

* use a **label** for each input, the **for** value
is matching the **id** value of the input field.
  
By doing that, a click on the label will focus
the input field and make it ready for input.

* **name**: it's the name that will be used server-side
to get the value of a field
  
Don't add one if you don't want a field data
to be submitted.

* **type**: that's the type of your field like
    * text: some text
    * date
    * password
    * tel
    * range
    * **checkbox**
    * **radio**
    * number
    
You can use a placeholder to define a default value deleted
if the user types something. You can use value to set
a value that the user may or not remove by himself.

<div class="sr"></div>

## Examples

* text

<label for="nameField">Your name</label>
<input id="nameField" name="name" type="text" value="" placeholder="John DOE" />

* password

<label for="pass">Your password</label>
<input id="pass" name="pass" type="password" />

* date

<label for="date">When?</label>
<input id="date" name="date" type="date" />

* checkbox

<label for="date">Check?</label>
<input id="date" name="date" type="checkbox" />

* radio

Alice? <br>
<label for="yes">yes?</label>
<input name="alice" id="yes" name="yes" type="radio" />
<label for="no">no!</label>
<input name="alice" id="no" name="no" type="radio" />

<div class="sl"></div>

## Input properties

And no that was not as easy as it may look. Now you need
to define some constraints or properties.

* **required**: this field must have a value (blank character pass the test like a space)
* **checked**: check by default a checkbox / radio button
* **minlength**: min length (characters)
* **maxlength**: max length (characters)
* **min**: max value (int)
* **max**: max value (int)
* **pattern**: write a regex (regular expression) that the input must match

If an input field is not inside a form, you may add ``form="a_form_id"``
but that may be too much explaining ID now so check the CSS course if you
want to know.

```html
<input type="text" value="" placeholder="John DOE" required pattern="[a-z]+" />

<input type="checkbox" checked />

<input min="x" max="y" minlength="z" maxlength="t">
```

Some random input field with a required tag and a pattern (only lowercase characters)
<input type="text" value="" placeholder="John DOE" required pattern="[a-z]+" />

Some error message will be shown when submitting if the field is not valid. Also,
if your mouse is hoovering the field, then you should see some message
is something is wrong.

<div class="sr"></div>

## Submit

Finally, you must add a submit button to send your form. You can
use an empty action or "#" in the form action field otherwise if you
didn't make some PHP it won't work.

Then simply create a button having the type "submit". You may also
use reset but almost no one is still using it nowadays.

```html
<button type="submit">submit</button>
<button type="reset">reset the form</button>
```

<button type="submit">submit</button>
<button type="reset">reset the form</button>

<div class="sl"></div>

## Textarea

You might use a textarea if you want a bigger input field for text.
You can use almost every property we saw, adding rows and cols for the size
of your textarea.

```html
<textarea
>some default text</textarea>

<label for="...">...</label>
<textarea name="a_name" minlength="..." maxlength="..." required id="..."
          rows="..." cols="..." placeholder="some default text"
>some text</textarea>
```

<label for="tare">Some label</label>
<textarea id="tare" rows="..." cols="..." placeholder="some default text">some text</textarea>