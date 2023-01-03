# Front-End code exposed

[Go back](../../../programming/web/_general/_old/general/index.md#security)

Your code is running in someone else browser, so they can do what they want with it. You should **already know** that using the developers' tools, you can see the code source of a page. Using elements, you can modify the HTML/CSS. Using the console, you can run some JavaScript/modify the JavaScript.

Overall, what the user can do?

<details class="details-e">
<summary>Hidden fields</summary>

If you made a field hidden, it's only `hidden` for your average user, but we can easily change the value of the hidden field.

Ex: you stored the ID of my account in the form to edit my profile, what if I put someone else ID inside? In the first place, this ID should be in the `$_SESSION`, so that was a pretty bad move 😶.
</details>

<details class="details-e">
<summary>Required fields</summary>

If a field is **required**, or you added a script in **JS** to check the form,  the user can **remove** or bypass anything. You **have to** test everything **again** in PHP. You will do it once in HTML/CSS for the normal users, and another one for the "hackers".
</details>

<details class="details-e">
<summary>Comments</summary>

You should never make HTML comments in your code (as anyone can read them). Instead, developers are making **PHP comments** like this

```php
<?php // some comment ?>
```
</details>