# Forms

[Go back](..#js-for-websites)

Most of the verifications are in HTML but If you can't
check everything in HTML or you want to display a custom
message, then here you go.

<hr class="sl">

## onsubmit

You can listen to the event "onsubmit" and return
true (send form) or false (do not send form).

```html
<form onsubmit="return checkForm(this)"></form>
```

Here some "template" for "checkForm"

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

<hr class="sr">

## Custom errors

If you want to use your own custom messages, then first
disable the default messages

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
        // your code to print the error
    }
    if (email_register.validity.typeMismatch) {
        // your code to print the error
    }
    if (login_register.validity.valueMissing) {
        // your code to print the error
    }
    // ...
    return false;
}
```


