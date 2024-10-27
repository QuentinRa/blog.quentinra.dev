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

## Mass Assignment

[![api_mass_assignment](../../../../_badges/rootme/web_server/api_mass_assignment.svg)](https://www.root-me.org/en/Challenges/Web-Server/API-Mass-Assignment)

<div class="row row-cols-lg-2"><div>

In an effort to simplify database interactions, it's common to use ORM (Object-relational mapping) which are objects linked to the database <small>(erasing the SQL code behind)</small>.

They are often vulnerable to mass assigment in which we can update fields that we were not "supposed" to.

For instance, if we can change our username and add the field `status`, we may be able to change our status using this route.

```diff
-{"username":"toto"}
+{"username":"toto","status":"admin"}
```
</div><div>

👻 See also: Ruby/Rails.
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

```shell!
$ curl 'URL/step1?n=5'
```

In the second form, the user submit a value in a POST form. The developer only check the new value `square` ❌.

```shell!
$ curl 'URL/step2?n=5' -d 'square=36'
```

But, if the user used:

```shell!
$ curl 'URL/step2?n=5' -d 'square=36&n=6'
```

Then, in `$_REQUEST['n']` there would be `6`, an uncheck value.
</div></div>

<hr class="sep-both">

## PHP Loose Comparison And Type Juggling

[![type_juggling](../../../../_badges/poat/type_juggling.svg)](https://swisskyrepo.github.io/PayloadsAllTheThings/Type%20Juggling/)
[![php_type_juggling](../../../../_badges/rootme/web_server/php_type_juggling.svg)](https://www.root-me.org/en/Challenges/Web-Server/PHP-type-juggling)
[![deserialization_modifying_serialized_data_types](../../../../_badges/ps-lab/deserialization/deserialization_modifying_serialized_data_types.svg)](https://portswigger.net/web-security/deserialization/exploiting/lab-deserialization-modifying-serialized-data-types)

<div class="row row-cols-lg-2"><div>

[PHP](/programming-languages/web/php/_general/index.md#operators) supports loose <small>(==, !=, <>)</small> and strict <small>(===, !===)</small> comparison. When using loose comparison, PHP cast variables to the same type using Type Juggling before comparing their values. In PHP 5.6 ([docker](/programming-languages/web/php/_general/index.md#docker-and-php-)) and older, some results are quite surprising:

* `"abc" == 0` is `True` <small>(<ignored_invalid> == 0)</small>
* `"1a2b3" == 1` is `True` <small>(1<ignored_invalid> == 1)</small>
* `"12abc3" == 12` is `True` <small>(12<ignored_invalid> == 12)</small>
* ...

Additionally, `"abc" == True` is `True` for all versions.

🪦 PHP Type Juggling is difficult to exploit as usually GET/POST data are strings unless they are unserialized using JSON.

#### Loose Comparison — Exploiting STRCMP

The `strcmp` function may be also exploited. In PHP 5.6, it returns an integer which indicates the number of different characters.

* `strcmp("abc", "abd") == 0` is `False`
* `strcmp("abc", "abc") == 0` is `True`
* `strcmp([], "abd") == 0` is `True` <small>(Returns NULL, NULL==0 is True)</small>

📚 Refer to [HTTP Parameter Pollution](#http-parameter-pollution)
</div><div>

#### PHP Magic Hashes

[![php_loose_comparison](../../../../_badges/rootme/web_server/php_loose_comparison.svg)](https://www.root-me.org/en/Challenges/Web-Server/PHP-Loose-Comparison)

Even in PHP 8 and newer, the following equalities are TRUE:

```php!
"0e299969168079221277306999992834" == "0"
"0e66507019969427134894567494305185566735" == "0e1337"
"0e66507019969427134894567494305185566735" == "0e4242424242"
```

There are known plaintext that result in a hash starting with `0e`. Refer to [spaze/hashes](https://github.com/spaze/hashes/) <small>(0.7k ⭐)</small> repository.

* `hash("md2", 'Oq9wqi64') == "0"` is `True`
* `hash("sha1", 'aaroZmOk') == "0e1337"` is `True`
* ...

```php!
// Get A Magic Hash For Hash Type 'fnv164'
while (1) {
    $p = bin2hex(random_bytes(8));
    $h = hash('fnv164', $p);
    if ($h == "0") {
        echo "Found hash($p)=$h";
        break;
    }
}
```

⚠️ Fun note: `bcrypt` truncates input longer than 72 characters.
</div></div>

<hr class="sep-both">

## HTTP Parameter Pollution

[![parameter_pollution](../../../../_badges/hacktricks/pentesting_web/parameter_pollution.svg)](https://book.hacktricks.xyz/pentesting-web/parameter-pollution)

<div class="row row-cols-lg-2"><div>

Parameter parsing and prioritization vary based on the underlying web technology in use. This may be exploited in various ways.

Common examples are in PHP/Javascript that are dynamically typed and inferring the type of the parameter based on the use of `[]`.

```php!
// PHP
"https://example.com/?username=abc"     # String
"https://example.com/?username[]=abc"   # Array
// JavaScript
"https://example.com/?username=abc"     # String
"https://example.com/?username[0]=abc"  # Array
```

This can be very helpful to exploit type juggling such as explained [here for PHP](#php-loose-comparison-and-type-juggling) while in JS you can bypass size checks with that.
</div><div>
</div></div>

<hr class="sep-both">

## Python Werkzeug Debug Pin (Flask)

[![werkzeug](../../../../_badges/hacktricks/network_services_pentesting/pentesting_web/werkzeug.svg)](https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/werkzeug)
[![flask_development_server](../../../../_badges/rootme/web_server/flask_development_server.svg)](https://www.root-me.org/en/Challenges/Web-Server/Flask-Development-server)

<div class="row row-cols-lg-2"><div>

Flask is built on top of the Werkzeug webserver. It has a [debugger](https://werkzeug.palletsprojects.com/en/3.0.x/debug/) that can be exploited to gain RCE. Try to access `/console` to see if it's enabled. You will be prompted for a pin.

According to the documentation: *"If an incorrect PIN is entered too many times the server needs to be restarted."*.

We can compute the PIN on our machine assuming we manage to get the necessary information from the target.

```
private_bits = [
    # /proc/net/arp (ex: eth0) => /sys/class/net/eth0/address
    str(int('00:00:00:00:00:00'.replace(':', ''), 16)),
    'machine_identifier'
]
```

To get the machine identifier, concatenate the content of `/etc/machine-id` or `/proc/sys/kernel/random/boot_id` with the last value of the first line <small>(slash-separated, can be empty)</small> of `/proc/self/cgroup`.

</div><div>

```py
probably_public_bits = [
    # User running the app (/etc/passwd + /proc/self/status)
    'username_here',
    
    # Usually left unchanged
    'flask.app', 'Flask',
    # 'werkzeug.debug', 'DebuggedApplication',
    # 'flask.app', 'wsgi_app'
    
    # We are looking for "flask/app.py"
    # /usr/local/lib/pythonX/site-packages/
    # /home/<username>/.local/lib/pythonX/site-packages/
    '/usr/local/lib/python3.10/site-packages/flask/app.py'
]
```

Refer to [hacktricks](https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/werkzeug) for the script, while you need to update the two variables for the PIN to be the correct one.

📚 See also: `werkzeug_debug_rce` (secret exposed in HTML?)
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

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

#### PHP Register Globals

[![php_register_globals](../../../../_badges/rootme/web_server/php_register_globals.svg)](https://www.root-me.org/en/Challenges/Web-Server/PHP-register-globals)

When using `register_globals`, global variables such as `$_GET['param']` are automatically mapped to a global variable such as `$param`.

It applies to `$_GET`, `$_POST`, `$_COOKIE`, `$_REQUEST`, etc.

This feature is deprecated since PHP 5.3.0, while the `extract(ARRAY)` function is still present and maybe still be used.

**Exploitation**

* Set `$token`: use `URL/?token=xxx`.
* Set `$_SESSION['key']`: use `URL/?_SESSION[key]=xxx`.
</div><div>

#### Client-Side Logic

[![http_post](../../../../_badges/rootme/web_server/http_post.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-POST)

While uncommon, if the logic is client-side and only the result is sent to the server, we can do whatever we want.

<br>

#### PHP Remote Xdebug

[![php_remote_xdebug](../../../../_badges/rootme/web_server/php_remote_xdebug.svg)](https://www.root-me.org/en/Challenges/Web-Server/PHP-Remote-Xdebug)

[Xdebug](https://xdebug.org/) allows developers to remotely debug a PHP web application. This [gist](https://gist.github.com/hassansin/95e2da64e12ef613068a884a2433991e) provide multiple interesting details. If `remote_connect_back`, anyone can run PHP commands on the server.

* Create a file in your IDE <small>(ex: index.php, any name)</small>
* Add code <small>(e.g. `<?php\nphpinfo();`)</small> and a breakpoint
* Listen for PHP debug connections <small>(ex: PHPStorm>Bottom-right icon)</small>
* Load the page supporting Xdebug
* Go back to your IDE and enjoy

For PHPStorm, [refer to the debug tool window](https://www.jetbrains.com/help/phpstorm/debug-tool-window.html) overview.
</div></div>