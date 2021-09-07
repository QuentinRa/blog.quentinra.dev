# public_html and permissions for Linux users

[Go back](../index.md#webserver)

Sometimes, you will work on Linux, and maybe on a shared server. It means that instead of having one "www" (root folder), and one root URL, each user will have their one in the home (**called public_html**), and they will have a URL looking like this `https://myorg.tld/~username`.

* create public_html

```bash
ls -la ~/public_html # check if repository exists
mkdir ~/public_html # create
# allows access to public_html to the web server
chmod 711 ~
chmod 711 ~/public_html
````

* notes

The root folder is `~/public_html`, meaning that `https://myorg.tld/~username/index.php` is the same as `~/public_html/index.php`.

* permissions for files

```bash
chmod 700 file.php # seems like the minimum for a .php
chmod 744 file.html # seems like the minimum for a .html
chmod 711 folder # seems like the minimum for a folder
```