# Website Fingerprint

<hr class="sep-both">

## Architecture Analysis

<div class="row row-cols-lg-2"><div>
</div><div>

#### Manual Framework Identification

Common Frameworks/CMS:

* [WordPress](/programming-languages/web/others/cms/wordpress/index.md): most used content-management system (CMS)
* [Joomla](/programming-languages/web/others/cms/joomla/index.md): popular content-management system (CMS)
* [Drupal](/programming-languages/web/others/cms/drupal/index.md): content-management system (CMS)

Uncommon Frameworks/CMS:

* [phpBB](#php-bulletin-board-phpbb)
* [GetSimple CMS](#getsimple-cms)
* [Subrion CMS](#subrion-cms)
* [umbraco CMS](#umbraco-cms)
* [osCommerce](#oscommerce--ecommerce-framework)
</div></div>

<hr class="sep-both">

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### PHP Bulletin Board (phpBB)

[![catpictures](../../../../_badges/thm-p/catpictures.svg)](https://tryhackme.com/r/room/catpictures)
[![phpbb_install_files](../../../../_badges/rootme/web_server/phpbb_install_files.svg)](https://www.root-me.org/en/Challenges/Web-Server/Install-files)

When installing a framework, such as [phpBB](https://github.com/phpbb/phpbb), it's important to properly configure it and remove install files.

<br>

#### osCommerce — eCommerce Framework

[![blueprint](../../../../_badges/thm-p/blueprint.svg)](https://tryhackme.com/r/room/blueprint)

[osCommerce](https://www.oscommerce.com/) is a highly vulnerable [open-source](https://github.com/osCommerce) PHP eCommerce framework using a MySQL backend.

If install files were not removed, there is a RCE where we can inject code in the database field during install `/catalog/install/index.php` which is executed when visiting `/install/includes/configure.php`.

📚 Use `oscommerce_installer_unauth_code_exec` for easy exploitation.

<br>

#### Subrion CMS

[![techsupp0rt1](../../../../_badges/thm-p/techsupp0rt1.svg)](https://tryhackme.com/r/room/techsupp0rt1)

[subrion](https://github.com/intelliants/subrion) <small>(0.3k ⭐)</small> version can be identified on the manager panel located at `/panel/`. Once logged, to get a RCE:

* [Exploit File Upload CVE](https://nvd.nist.gov/vuln/detail/CVE-2018-19422): simply create and upload the usual PHP webshell but rename it as `xxx.phar`.

Upload at `/panel/uploads/` <small>(Right-click to upload)</small> and execute it at `/uploads/xxx.phar` <small>(URL encoding is not automatic!)</small>.

* [Exploit PHP Validation CVE](https://nvd.nist.gov/vuln/detail/CVE-2021-43464): Navigate to `Content>Fields>Select a field>Select Require Field>Write PHP Code`.
</div><div>

#### umbraco CMS

[![anthem](../../../../_badges/thm-p/anthem.svg)](https://tryhackme.com/r/room/anthem)

* [official documentation](https://umbraco.com/): it's a .NET CMS
* It is usually hosted on Windows with a MSSQL backend
* It (may?) uses Windows authentication <small>(xxx@domain:pass)</small>
* Config path? `C:\inetpub\wwwroot\Web\Web.config`
* Version 2.12.4 is vulnerable to [RCE](https://github.com/noraj/Umbraco-RCE/) <small>(0.1k ⭐, XSLT upload)</small>
* Once authenticated, click on 'Help' to find the version

<br>

#### GetSimple CMS

![getsimplecms](../../../../_badges/htb-p/getsimplecms.svg)

Getting access to an account

* There is no default credentials
* The username is `admin`
* You may try brute forcing the password <small>(ex: test `admin`)</small>

Pop a reverse shell

* You can try to upload a reverse shell as an image
* You can replace the template code with a reverse shell, and navigate to the template page shown when editing the template

<br>

#### Cmsimple

[![P0wn3d](../../../../_badges/rootme/realist/P0wn3d.svg)](https://www.root-me.org/en/Challenges/Realist/P0wn3d)

In version 3, you could find the [cmsimple](https://www.cmsimple.org/en/) version from `/content/content.htm`, `/2lang/content/content.htm`, or from the meta tag.

Version 3.1 had a LFI vulnerability at `/index.php?sl=./en`.
</div></div>