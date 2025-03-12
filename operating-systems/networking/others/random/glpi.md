# GLPi IT Management

<div class="row row-cols-lg-2"><div>

GLPi is a popular open-source it management platform. It can be used for a variety of use cases going from host management to ticketing.

* [Official website](https://glpi-project.org/) <small>(4.2k ⭐)</small>
* [Github](https://github.com/glpi-project/glpi) <small>(4.2k ⭐)</small>
* MySQL/MariaDB and PHP

GLPi is commonly found in french enterprises even if they have another solutions globally, often for a specific use case.
</div><div>

Default credentials are:

* `glpi:glpi` (Super Admin)
* `post-only:post-only` (Self-Service)
* `tech:tech` (Technician)
* `normal:normal` (Observer)

⚠️ Using this software may be dangerous as each [release](https://github.com/glpi-project/glpi/releases) usually has many patched vulnerabilities <small>(3-7 per release, excluding misconfigurations)</small>.
</div></div>

<hr class="sep-both">

## GLPI — Website Discovery

<div class="row row-cols-lg-2"><div>

#### GLPI Discovery — Forced Browsing

By default, GLPI webserver should be mapped to the `/public/` folder. It's often misconfigured, leading to internal files being web-accessible.

* [ ] `/files/` - critical sensitive files, protected by .htaccess
  * [ ] `/files/_log/` - server and application logs
  * [ ] `/files/_sessions/` - PHP sessions
  * [ ] `/files/_tmp/` or `/files/_uploads/` - uploaded files 
* [ ] `/version/` - directory listing may be enabled
* [ ] `/vendor/` - protected by .htaccess
</div><div>

#### GLPI Discovery — Fingerprint

GLPi version can be found in two places.

* [x] Check for a file such as `/version/10.0.10`
* [x] Check for the version once connected in `About`
</div></div>

<hr class="sep-both">

## GLPI — Website Exploitation

<div class="row row-cols-lg-2"><div>

#### GLPI Exploitation — .htaccess failure

By default, `.htaccess` are ignored by Apache unless `AllowOverride` is specified. This can lead to multiple security issues.

* [ ] Navigate to `/files/_session/` and try every cookie
* [ ] Upload a PHP script and run it from `/files/_tmp/`

🛡️ Only expose the `/public/` folder or use `AllowOverride` on Apache.
</div><div>
</div></div>