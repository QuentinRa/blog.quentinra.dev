# Code Igniter

<div class="row row-cols-md-2"><div>

[Code Igniter](https://codeigniter.com/) is a simple and easy-to-learn PHP framework following the Model-View-Controller (MVC) architectural pattern.

* [Documentation](https://codeigniter.com/user_guide/index.html) (⛪)
* [GitHub](https://github.com/codeigniter4/CodeIgniter4) (4.3k ⭐)

The best way to get started is to use [composer](/programming-languages/web/php/composer/index.md)

```shell!
$ composer create-project codeigniter4/appstarter my_project
```
</div><div>

Some features are:

* 🛣️ URI Routing
* 🔐️ Built-in security and input validation helper
* 🍪️ Built-in session management helper
* 🚀️ Built-in caching helper
* 🔤 Localization

**Code Igniter 4** is the current major version.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `App/Config/Database.php`
* `App/Config/Autoload.php` (autoload helpers)
* `App/Config/App.php` (base URL)
* `App/Config/Routes.php` (default, 404, pattern, $n)
* `App/Models` (CI_MODEL, load model, db insert where set update delete result result_array row close query)
* Load view in controller
* Helpers (url|form|form_validation|html|download, anchor, set_heading, site_url, base_url, redirect, form_open/form_close/...set_value/set_rules...)
</div><div>

* library session, set_userdata, userdata, has_userdata, destroy
* library cookies, set_cookie, get_cookie, delete_cookie
* Controller routing

```php
$email = Services::email(); // \Config\Services::email();
$email->setFrom('xxx@xxx.xxx', 'XXX xxx');
$email->setReplyTo('no-reply@xxx.xxx');
$email->setTo('yyy@xxx.xxx');
$email->setTo('yyy@xxx.xxx, zzz@xxx.xxx');
$email->setPriority(1);
$email->setSubject('[XXX] XXX');
$email->setMessage("<head>
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
    <title>send</title>
</head>
<body></body>");
$email->send();

log_message('info', 'message');

lang('File.key');site_url('XXX');base_url('xxx');

service('request')->getLocale()
```

</div></div>