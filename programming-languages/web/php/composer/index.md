# Composer

<div class="row row-cols-md-2 mt-3"><div>

Composer is a popular package manager for PHP. It's used to install packages (libraries/frameworks/...) rather seamlessly.

* 📚 [Documentation](https://getcomposer.org/doc/01-basic-usage.md)
* 🔑 [Installation](https://getcomposer.org/download/)

```
$ sudo apt install composer
```

Composer uses a `composer.json` to track which libraries have to be installed, and which versions can be downloaded/installed, based on rules defined by the user (see [versions](https://getcomposer.org/doc/articles/versions.md)).

Downloaded packages are stored in `vendor/`.

To use libraries inside `vendor` in your script, you need to import them using the autoloader:

```
require_once __DIR__ . '/vendor/autoload.php;
```
</div><div>

* To create a `composer.json`, use `composer init`.

* To generate `vendor/` from an existing `composer.json`, use `composer install` without any arguments.

* To add new packages to `composer.json` and install them, use

```bash
$ composer install package
$ composer install vendor/package
$ composer install vendor/package:version
```

Installing packages will generate a `composer.json.lock`. This file keep track of the exact version of packages inside `vendor/`. You can use `composer update` to update them.

➡️ Note that packages are updated according to the ranges/rules defined in `composer.json`, so even if a package has updates, it may not be updated, if the update is not within the allowed range.
</div></div>