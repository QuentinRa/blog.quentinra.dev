# Code Igniter

<div class="row row-cols-md-2"><div>

[Code Igniter](https://codeigniter.com/) is a simple and easy-to-learn PHP framework following the Model-View-Controller (MVC) architectural pattern.

* [Documentation](https://codeigniter.com/user_guide/index.html) (⛪)
* [GitHub](https://github.com/codeigniter4/CodeIgniter4) (4.3k ⭐)

The best way to get started is to use [composer](/programming-languages/web/php/composer/index.md):

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

## File structure

<div class="row row-cols-md-2"><div>

Code Igniter files are split in 3 sections: **app**, **public**, and **writable**.

#### public

A modern secure practice is to not expose the website source (`app`...) to the public. You website [domain name](/programming-languages/web/_general/random/dn.md) such as `example.com` should be  configured to point to `/path/to/my_project/public/`. A user won't be able to write `example.com/../app/sensitive_file`.

☠️ Traditionally, `example.com` pointed to `/path/to/my_project/` that allowed us to do `example.com/app/sensitive_file`.

You will store in `public` any file that the user will be allowed to access using a URL. This includes:

* 🖼️ Images (ex: `public/assets/img/`)
* 🖌️ CSS (ex: `public/assets/css/`)
* 🤖 JavaScript (ex: `public/assets/js/`)
* ...

The path to this folder is stored in `PUBLICPATH` from the code.

#### writable

This directory contains files created by the application:

* 📄 Logs <small>(debug logs, errors in production)</small>
* 🚀 Cache files <small>(delete one to clear its page cache)</small>
* 🧵 Session files <small>(each user created session)</small>
* 🧑 Uploaded files <small>(any uploaded file that the user shouldn't access)</small>

The path to this folder is stored in `WRITEPATH` from the code.
</div><div>

#### app

The application folder is split inside more folders.

##### app/Config

The most important files are:

* `App.php` - edit `$baseURL` to match your domain name; or the path to the `public` folder during development

* `Routes.php` - ...

##### app/Controllers

A controller is a PHP script that can render multiple views or your application. We usually create one controller per set of related views.

```php!
<?php // Home.php
namespace App\Controllers;

class Home extends BaseController {
    public function index(): string
    {
        return view('welcome_message');
    }
}
```

##### app/Views

This folder contains PHP files that contain or generate the HTML that will be displayed to the user.

```php!
<?php // welcome_message.php
echo "Hello, World!";
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `Database.php` - if you use a database, edit `default` and/or test to match your database configuration
* `App/Config/Autoload.php` (autoload helpers)
* `App/Config/Routes.php` (default, 404, pattern, $n)
* `App/Models` (CI_MODEL, load model, db insert where set update delete result result_array row close query)
* Load view in controller
* Helpers (url|form|form_validation|html|download, anchor, set_heading, site_url, base_url, redirect, form_open/form_close/...set_value/set_rules...)
* library session, set_userdata, userdata, has_userdata, destroy
* library cookies, set_cookie, get_cookie, delete_cookie
* Controller routing

```php
public $baseURL = 'https://example.com/';
public $indexPage = '';
public $defaultLocale = 'fr';
public $negotiateLocale = true;
public $supportedLocales = ['en'];

'username' => 'xxx',
'password' => 'yyy',
'database' => 'zzz',

$mailType

$routes->setDefaultController('XXX');
$routes->set404Override('App\Controllers\XXX::xxx');
// {locale} (xxx/)?

$db = Database::connect();
$p = $db->prepare(function($db) {
    $sql = "SELECT id from user where email = ? LIMIT 0,1;";
    return (new Query($db))->setQuery($sql);
});
// try to fetch results
$r = ($p->execute($email))->getResultArray();
if(!isset($r[0])) return false;

$p->_execute([$email])

$db->query($sql)
```
</div><div>

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
redirect('xxx')
$this->redirect('error404')
redirect()->to("/xxx") # ?RedirectResponse
service('request')->getLocale()
$session = \Config\Services::session();

$throttler = Services::throttler();
// 10/day
$throttler->check("uniq_key_per_request", 10, DAY) === false
$this->request->getIPAddress()

echo view('folder/file.php');
```

</div></div>