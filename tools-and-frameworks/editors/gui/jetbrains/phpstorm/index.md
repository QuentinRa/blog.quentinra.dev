# PHPStorm

<div class="row row-cols-lg-2"><div>

[PHPStorm](https://www.jetbrains.com/phpstorm/) is a **back-end** IDE <small>(PHP, PHP frameworks, Node.js, Databases, Composer)</small> powered by JetBrains exclusively available in a **paid** version.

<p class="text-center">
<img src="_images/logo.png" width="100"/>
</p>

👉 JetBrains IDEs share many features [explained here](../_general/index.md).
</div><div>

**Features**

* 🌱 preview code in any browser with auto-refresh on change
* 🚀 recognize old code snippets and suggest upgrades
* 🔥 recognize simple mistakes and suggest fixes
* ⏳ can generate common code snippets <small>(equals, getters...)</small>
* ...
</div></div>

<hr class="sep-both">

## Product-specific features

<div class="row row-cols-lg-2"><div>

#### Remote development

🌱 You can code directly on a remote server. No need to install tools on your computer, but it means users may see your changes.

Press `CTRL+ALT+S` or `⚙️ > Settings`. Navigate to `Build...` then `Deployment`. From there, create a new configuration.

* enter your SFTP credentials
* the `root path` is the path to your project on the remote host
* the `webserver URL` isn't your website URL. If they are different, then you should set `mappings`
* in excluded paths, you can exclude some folders from upload

Navigate to `Options` within `Deployment`, and select a condition for uploading files, such as `Always`.
</div><div>

#### PHP CLI

You can set up the [PHP](/programming-languages/web/php/_general/index.md) interpreter that will be used to execute scripts or install tools when using some IDE features.

* Open the IDE Settings
* Click on the PHP section
* Click on `[...]` on the `PHP CLI interpreter` line
* Add a new interpreter
  * Set `PHP executable` to the PHP binary
  * Set `PHP configuration` to the `php.ini` file
* Go back and select your interpreter in the list

#### Composer install

Instead of installing [composer.phar](/programming-languages/web/php/composer/index.md), you can download `composer.phar` from the IDE and load it using your [PHP CLI](#php-cli).

* Open the IDE Settings
* Navigate to PHP > Composer
* Select "composer.phar" in "execution"
* Click on "download" and select your PHP interpreter
* Apply and exit
</div></div>