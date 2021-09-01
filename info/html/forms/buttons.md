# Notes about submit/reset

[Go back](../index.md#forms)

You must add a button to submit your form. Any button inside the field, unless you add the attribute `type="button"`, will submit the field. You may also add a button to reset the form, but almost no one is still using it nowadays.

```html
<button type="submit">submit</button>
<button type="reset">reset the form</button>
```

<button type="submit" onclick="alert('submitted 😏')">submit</button>
<button type="reset" onclick="alert('reset 🙄')">reset the form</button>