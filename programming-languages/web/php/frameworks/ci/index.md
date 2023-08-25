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

* `Routes.php` - map a route (ex: `/`) to a controller (ex: `Home.php`)

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

## Controllers 🤖

<div class="row row-cols-md-2"><div>

A controller is a PHP class that extends `BaseController`. Each method corresponds to a page of your website. They should fetch data from the model, parse it, and pass it to the views.

For instance, imagine a page that displays the latest post of a website. 

* we will first fetch the latest post (**Model**)
* then we will display it (**View**)

```php!
public function index(): void {
    // Model
    // imagine that we load this from the model
    $latest_post = ['title' => '...', 'content' => '...'];
    
    // View
    echo view('header.php');
    echo view('latest.php', [ 'post' => $latest_post]);
    echo view('footer.php');
}
```
</div><div>

The `view(path)` method will execute the PHP in `app/Views/path`. We can pass variables to these PHP files. When executing `latest.php`, it will have access to the variable `$post` which was set to `$latest_post`.

You may redirect the user:

```php!
public function index(): ?\CodeIgniter\HTTP\RedirectResponse
{
    if ($is_connected) {
        // ...
        return null; // no redirect
    }
    // see also: redirect()->to("/xxx")
    return redirect('login'); // redirect
}
```
</div></div>

<hr class="sep-both">

## Views

<div class="row row-cols-md-2"><div>

Views are simply PHP files with the HTML to display.

```phpt!
<?php
if (!isset($post)) die('Missing required argument: $post');
?>

<h1>Latest Post</h1>

<p>Title: <?=$post['title']?></p>
<p>Content: <?=$post['content']?></p>
```
</div><div>

You will most likely use:

* `site_url('XXX')`: `https://example.com/index.php/XXX`, for links
* `base_url('XXX')`: `https://example.com/XXX`, for images
</div></div>

<hr class="sep-both">

## 🛣️ Routing 🛣️

<div class="row row-cols-md-2"><div>

By default, with file routing, you'll have URLs such as `https://example.com/toto.php` and one PHP per route (`/toto.php`).

Code Igniter use automatic routing. Every request is redirected to `public/index.php` using the `.htaccess` file.

Then, using `app/Config/Routes.php`, Code Igniter will call a method from a [Controller](#controllers) according to the routes we defined.

#### Auto Controller Routing

Before, code igniter was enabling auto routing, meaning that `https://example.com/Controller/method` would call `method` from `Controller`. **This is insecure, don't use it**.

```php!
$routes->setAutoRoute(true);
```

#### Default routing

You can edit these two to change the default controller/method used when there is none specified in the routes defined later.

```php!
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
```
</div><div>

#### Specify routing patterns

Routes are declared as follows:

```php!
$routes->get('/', 'XXXController::index');
```

➡️ `$base_url/` will load `XXXController#index()`.

You can pass arguments to your method:

```php!
$routes->get('/', 'XXXController::index/arg1/arg2');
```

You can create dynamic routes:

```php!
// the first argument will be the number matching (:num)
$routes->get('/products/:num', 'Products::show_product/$1');
// the first argument (:any) is optional
$routes->get('/xxx/(:any)?', 'XXX::xxx/$1');
```

➡️ You can replace `get(...)` with `post`, `put`, `delete`...

#### 404 page

If a route is not found, this controller/method will be called if set.

```php!
$routes->set404Override('App\Controllers\XXX::yyy');
```
</div></div>

<hr class="sep-both">

## Database

<div class="row row-cols-md-2"><div>

Define the database configuration in `apps/Config/Database.php`. To avoid writing SQL, Code Igniter has what we call [Models](#models) 🚀.

```php!
$db = \Config\Database::connect();
```

To create a non-prepared statement ❌ <small>(vulnerable)</small>:

```php!
$user_id = "5"; 
$r $db->query("SELECT * from user where id = ".$user_id." LIMIT 0,1;");
```

To create a prepared statement ✅:

```php!
$user_id = "";
$stmt = $db->prepare(function($db) {
    $sql = "SELECT * from user where id = ? LIMIT 0,1;";
    return (new \CodeIgniter\Database\Query($db))->setQuery($sql);
});
$r = $stmt->execute($user_id);
```
</div><div>

To get the results as an array:

```php!
$results = $r->getResultArray();
```

While it's **not** a good practice, you can use the driver specific execute and write code specific to mysqli/...

```php!
$res = $stmt->_execute([$user_id]);
// use the driver-specific functions
```
</div></div>

<hr class="sep-both">

## Models

<div class="row row-cols-md-2"><div>

Code Igniter implements a sort of **Object-Relational Mapping** (ORM) using [Models](https://codeigniter.com/user_guide/models/model.html). Each model corresponds to a table in the database.

```php!
<?php
namespace App\Models;

use CodeIgniter\Model;

class PostModel extends Model
{
    protected $table = 'posts';
    protected $primaryKey = 'id';
    protected $allowedFields = ['id', 'title', 'content'];
    protected $validationRules = [
        'title' => 'required|min_length[3]',
        'content' => 'required'
    ];
}
```
</div><div>

```php!
// créate
$postModel = new \App\Models\PostModel();         // normal
$postModel = model(\App\Models\PostModel::class); // shared

// Select id,title,content from posts;
$posts = $postModel->findAll();

// Select [...] from posts where id = some_id;
$post = $postModel->find('some_id');
// Select [...] where id in ['id_1', 'id_2', 'id_3']
$posts = $postModel->find(['id_1', 'id_2', 'id_3']);

// Select [...] from posts where key = value;
$posts = $postModel->where('key', 'value')->findAll();

// Update every record
$postModel->update(['key' => 'value']);
// you can also use "set"
$postModel->whereIn('id', [1, 2, 3])
    ->set(['banned' => 1])
    ->update();
```
</div></div>

<hr class="sep-both">

## Localization

<div class="row row-cols-md-2"><div>

To create apps supporting multiple languages, you need to create folders per locale (`en`, `fr`...) in `app/Language`.

Edit `app/Config/App.php` to set available locales and the default one.

```php!
public string $defaultLocale = 'en';
public bool $negotiateLocale = false;
public array $supportedLocales = ['en'];
// don't fallback to default if the locale is not found
$routes->useSupportedLocalesOnly(true);
```

For instance, let's say you have the file `en/Test.php`.

```php
<?php
return [
    // key => value
    'greeting' => 'Hello'
];
```

Inside the code, instead of a hard-coded text, use:

```diff
-<p>Hello</p>
+<p><?=lang('Test.greeting')?></p>
```
</div><div>

You'll create the same file in another language (ex: `fr/Test.php`):

```php
<?php
return [
    'greeting' => 'Bonjour'
];
```

Now, according to the locale loaded, the text will change.

* Use `{locale}` in routes (`en/home`, `fr/home`)
* Auto-detection if `negotiateLocale` is `true`
* From the code

```php
// Get the locale
$locale = $this->request->getLocale();
$locale = service('request')->getLocale();
// Set the locale
$this->request->setLocale('fr');
service('request')->setLocale('fr');
```

➡️ See [localization](https://codeigniter.com/user_guide/outgoing/localization.html) for more details.
</div></div>

<hr class="sep-both">

## Utilities

<div class="row row-cols-md-2"><div>

#### Services/email

You can define the default mail configuration in `apps/Config/Email.php`. Here is a list of methods you can use:

```php!
$email = \Config\Services::email();;
$email->setFrom('xxx@xxx.xxx', 'XXX xxx');
$email->setReplyTo('no-reply@xxx.xxx');
$email->setTo('yyy@xxx.xxx'); // one
$email->setTo('yyy@xxx.xxx, zzz@xxx.xxx'); // multiple
$email->setPriority(1);
$email->setSubject('[XXX] XXX');
$email->setMessage("<head>
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
    <title>send</title>
</head>
<body></body>");
$email->send();
```
</div><div>

#### Services/throttler

Using the throttler, you can enforce a limit/quota on webpages, such as only allowing an IP to access a page every X hours.

```php!
$throttler = Services::throttler();
// 10 times per day
if ($throttler->check("key", 10, DAY) === false) {
    // more than 10 this day
    return ...;
}
```

Each time `check` is called with `key`, the counter increases by one. You could create a key made of an IP to enforce a quota per client.

#### Logging

To log a message with a log level of `info`:

```php!
log_message('info', 'message');
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* .env
* Autoload
* Helpers
* Session
</div><div>
</div></div>