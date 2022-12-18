# Forms

[Go back](../../../../../archives/info/web/_old#javascript-for-websites)

Most of the verifications are in HTML, but If you **can't check something in HTML** (ex: the password and the password confirmation have the same value) or you want to **display a custom error message**, then here you go.

<hr class="sl">

## onsubmit

You can listen to the event "onsubmit" and return **true** if the form is valid, or **false** if the user needs to correct something (=cancel submit).

```html
<form onsubmit="return checkForm(this)"></form>
```

Here is some "template" for "checkForm" <small>(you may change the name of the function, you may not do it like this)</small>

```js
function checkForm(form){
    // this is an example
    // we are printing the value of the field
    // having the name="a_name"
    //
    // you won't print it but now you know how to
    // get a value
    console.log(form.elements['a_name']['value']);

    return false;
}
```

Some are using FormData to handle the form, at least when handling API requests (I'm using the syntax above)

```js
let formData  = new FormData(form);
// add a value
formData.append('key', 'value')
formData.get('key') // get a value by name="key"
// iterate
for(let [key, value] of formData) {}
// to array
const formDataArray = [...formData.entries()];
```

<hr class="sr">

## Custom errors

If you want to use your own custom messages, then first disable the default messages

```html
<form onsubmit="return checkForm(this)" novalidate></form>
```

Then

```js
function checkForm(form){
    if (login_register.validity.tooShort) {
        // your code to print the error
    }
    if (login_register.validity.tooShort) {
        // ...
    }
    if (email_register.validity.typeMismatch) {
        // ...
    }
    if (login_register.validity.valueMissing) {
        // ...
    }
    // ...
    return false;
}
```