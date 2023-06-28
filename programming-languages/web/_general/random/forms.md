# Forms

<div class="row row-cols-md-2"><div>

Forms are used when requesting data from the user to perform an action. Common forms often found on websites are: 

* 🔓 a login form
* 🧑 a sign-in form
* 🔑 a password forgot form
* 💵 a checkout form
* 🔎 a search/filter form
* 🤖 a [captcha](captcha.md) form

There are two [HTTP methods](/operating-systems/networking/protocols/http.md#method) commonly used in forms: `GET` and `POST`. There is a semantic use 🗺️: `GET` is used by forms "getting" data from the server <small>(search/filter forms)</small>, `POST` is used by forms creating something server-side <small>(all others forms)</small>. In practice, it's up to the developer.
</div><div>

Forms are commonly involving 4 languages:

* [HTML](/programming-languages/web/html/index.md#forms): the visual and some constraints <small>(range/required/...)</small>
* [CSS](/programming-languages/web/css/_general/index.md): to make nicer forms
* [JavaScript](/programming-languages/web/javascript/_general/dom.md#-validating-forms-): to validate forms/advanced constraints
* [PHP](/programming-languages/web/php/_general/index.md#handle-a-form): to validate and process forms

The languages involved may change, but there is **always a validation that should be done server-side** 📌, such as in PHP, as client-side validations can be bypassed, and they are only used to provide a better experience for normal users.
</div></div>