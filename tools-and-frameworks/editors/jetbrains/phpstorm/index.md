# PHPStorm

<div class="row row-cols-md-2"><div>

[PHPStorm](https://www.jetbrains.com/phpstorm/) is a **back-end** IDE <small>(PHP, PHP frameworks, Node.js, Databases, Composer)</small> powered by JetBrains only in a **paid** version.

<p class="text-center">
<img src="/courses/tools-and-frameworks/editors/jetbrains/phpstorm/_images/logo.png" width="100"/>
</p>
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

<div class="row row-cols-md-2"><div>

#### Remote development

🌱 You can code directly on a remote server. No need to install tools on your computer, but it means users may see your changes.

Press `CTRL+ALT+S` or `⚙️ > Settings`. Navigate to `Build...` then `Deployment`. From there, create a new configuration.

* enter your SFTP credentials
* the `root path` is the path to your project on the remote host
* the `webserver URL` isn't your website URL. If they are different, then you should set `mappings`
* in excluded paths, you can exclude some folders from upload

Navigate to `Options` within `Deployment`, and select a condition for uploading files, such as `Always`.
</div><div>

...
</div></div>