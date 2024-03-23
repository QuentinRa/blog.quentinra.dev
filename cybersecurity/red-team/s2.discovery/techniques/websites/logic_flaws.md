# Logic flaws

[![owasptop10](../../../../_badges/thm/owasptop10.svg)](https://tryhackme.com/room/owasptop10)

<div class="row row-cols-lg-2"><div>

A logic flaw occurs when a programmer thinks a user will do always as they expect, and fail to handle scenario in which they don't.

* The user visit the page "payment" before the page "checkout"
* The user manually send a form and do not use the HTML form

A more concrete example is that if the developer used an HTML `SELECT` tag with a list of countries, the developer may not check the submitted value as they expect it to be within their list of countries.
</div><div>
</div></div>

<hr class="sep-both">

## PHP $_REQUEST logic flaw

[![authenticationbypass](../../../../_badges/thmp/authenticationbypass.svg)](https://tryhackme.com/room/authenticationbypass)

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

<hr class="sep-both">

## PHP Loose Comparison

[![type_juggling](../../../../_badges/poat/type_juggling.svg)](https://swisskyrepo.github.io/PayloadsAllTheThings/Type%20Juggling/)
[![php_type_juggling](../../../../_badges/rootme/web_server/php_type_juggling.svg)](https://www.root-me.org/en/Challenges/Web-Server/PHP-type-juggling)

<div class="row row-cols-lg-2"><div>

[PHP](/programming-languages/web/php/_general/index.md#operators) supports loose <small>(==, !=, <>)</small> and strict <small>(===, !===)</small> comparison. When using loose comparison, PHP uses Type Juggling to compare values. In PHP 5.6 and older, some results are quite surprising:

* `!NULL` or `NULL == 0` is `True`
* `"abc" == 0` is `True` <small>(<ignored_invalid> == 0)</small>
* `"1a2b3" == 1` is `True` <small>(1<ignored_invalid> == 1)</small>
* `"12abc3" == 12` is `True` <small>(12<ignored_invalid> == 12)</small>
* ...

You can install [PHP 5.6 using Docker](/programming-languages/web/php/_general/index.md) for local testing.
</div><div>

The `strcmp` function may be also vulnerable. In PHP 5.6, it returns an integer which indicates the number of different characters.

* `strcmp("abc", "abd") == 0` is `False`
* `strcmp("abc", "abc") == 0` is `True`
* `strcmp([], "abd") == 0` is `True`

📚 Try `password[]=` to transform a parameter in an array.

🪦 PHP Type Juggling/Loose comparison is difficult to exploit as usually GET/POST data are strings unless they are converted to JSON...
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

#### Client-Side Logic

[![http_post](../../../../_badges/rootme/web_server/http_post.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-POST)

While uncommon, if the logic is client-side and only the result is sent to the server, we can do whatever we want.

#### PHP Register Globals

[![php_register_globals](../../../../_badges/rootme/web_server/php_register_globals.svg)](https://www.root-me.org/en/Challenges/Web-Server/PHP-register-globals)

This feature is deprecated since PHP 5.3.0, and mostly present with PHP < 4.1 or if the development tried to reproduce this behavior. Basically, global variables such as `$_GET['param']` are mapped to a variable, e.g. `$param` in thise case. It means, we can override the value of a variable if we know the variable's name.

We can also directly edit variables `URL?_SESSION[xxx]=yyy`.
</div><div>

#### Execution After Redirect (EAR)

[![http_improper_redirect](../../../../_badges/rootme/web_server/http_improper_redirect.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Improper-redirect)

It occurs when a user is redirected, but if they don't follow the redirection, then they can still access the page.

In PHP, it would occur if the developper forgot to call `exit` as any code after the redirecting is still executed.

You can use `ncat` to read a page without being redirected.

```shell!
$ nc domain 80
GET /URI HTTP/1.1
Host: domain
```
</div></div>