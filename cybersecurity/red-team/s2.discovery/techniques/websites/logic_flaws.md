# Logic flaws

[![owasptop10](../../../_badges/thm/owasptop10.svg)](https://tryhackme.com/room/owasptop10)

<div class="row row-cols-lg-2"><div>

A logic flaw occurs when a programmer thinks a user will do always as they expect, and fail to handle scenario in which they don't.

* The user visit the page "payment" before the page "checkout"
* The user manually send a form and do not use the HTML form

A more concrete example is that if the developer used an HTML `SELECT` tag with a list of countries, the developer may not check the submitted value as they expect it to be within their list of countries.
</div><div>
</div></div>

<hr class="sep-both">

## PHP $_REQUEST logic flaw

[![authenticationbypass](../../../_badges/thmp/authenticationbypass.svg)](https://tryhackme.com/room/authenticationbypass)

<div class="row row-cols-lg-2"><div>

The [PHP](/programming-languages/web/php/_general/index.md) variable `$_REQUEST` is sometimes used to access `$_GET` and `$_POST`. It's a merge of both, in case of conflict, `$_POST` values win.

It may be used for convenience, for instance, when chaining a `$_POST` form to a `$_GET` form. The problem is that if someone manually add key/values in `$_POST`, they can erase values in `$_GET`.

There is a logic flaw if the developer do not check previously checked values, such as the previous form `$_GET` values, and assume that after checking them once, they are "safe" now.
</div><div>

**Illustration** 🌺

The fist form is using GET. The developer check the parameter `n` ✅.

```
$ curl 'URL/step1?n=5'
```

In the second form, the user submit a value in a POST form. The developer only check the new value `square` ❌.

```bash
$ curl 'URL/step2?n=5' -d 'square=36'
```

But, if the user used:

```bash
$ curl 'URL/step2?n=5' -d 'square=36&n=6'
```

Then, in `$_REQUEST['n']` there would be `6`, an uncheck value.
</div></div>