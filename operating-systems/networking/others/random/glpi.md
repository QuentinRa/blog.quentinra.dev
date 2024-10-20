# GLPi IT Management

<div class="row row-cols-lg-2"><div>

GLPi is a popular open-source it management platform. It can be used for a variety of use cases going from host management to ticketing.

* [Official website](https://glpi-project.org/) <small>(4.2k ⭐)</small>
* [Github](https://github.com/glpi-project/glpi) <small>(4.2k ⭐)</small>
* MySQL/MariaDB and PHP

GLPi is commonly found in enterprises even if they have another solutions globally, often for a specific use case.
</div><div>

It often had critical vulnerabilities. Refer to [the release notes](https://github.com/glpi-project/glpi/releases). Default credentials may not have been changed/disabled:

* `glpi:glpi` (Super Admin)
* `post-only:post-only` (Self-Service)
* `tech:tech` (Technician)
* `normal:normal` (Observer)
</div></div>

<hr class="sep-both">

## GLPi Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### GLPi Enumeration

When properly configured, only the `/public/` route was exposed. Otherwise, you can navigate to `/version/` to find the GLPI version.

Once logged, you can also find the version in "about" or in the code.
</div><div>

#### GLPi Foothold

Try default accounts/credentials.

<br>

#### GLPi Exploitation

This [article](https://sensepost.com/blog/2024/from-a-glpi-patch-bypass-to-rce/) tackles a few CVEs in `GLPI < 10.0.16` to get a RCE.
</div></div>