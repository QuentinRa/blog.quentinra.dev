# wamp

AMP (Apache MySQL PHP) is a software installing the tools
you will need. You can download a version, usually,
we choose our OS Version like W=Windows, L=Linux
and M=MacOS.

* [Wamp](https://www.wampserver.com/) or here [Wamp](https://ampps.com/wamp)
* [Lamp](https://ampps.com/lamp)
* [Mamp](https://www.mamp.info/en/mamp/windows/)

When installing, if you need to add a browser
but do not know where the exe file is,

* right-click on the shortcut
* open ... folder
* right-click on the shortcut in the folder
* open ... folder
* done

**Note**: you may need to restart the software
at each startup.

Your server will be served at
[http://localhost/](http://localhost/).

To write some php, go to your server folder.

* Windows: ``C:\wamp64\www\index.php``
* Linux: ``/var/www/html/index.php``

The file shown at ``http://localhost/`` is
``index.php``. You can create a new folder like
``new_project\index.php`` and see open
it in your browser at ``http://localhost/new_project/``
or ``http://localhost/new_project/index.php``.

<hr class="sl">

## Wamp

Note that wamp on Windows will be available
in the system trail like where you have your
internet connection icon, sound icon, ...

If wamp is not present here then start it.

<hr class="sr">

## Change to MariaDB

If you, like me, will use ``MariaDB`` then
right-click on wamp in the system trail.

* Settings
* Disabled MySQL
* Enable MariaDB

Your database is at <http://localhost/phpmyadmin>.

* root
* no password

by default.

<hr class="sl">

## Change the lang

Right-click on wamp in the system trail
then in lang menu.

<hr class="sr">

## Change xxx version

Left-click on wamp in the system trail
You can enable and disabled PHP modules here too.

<hr class="sl">

## Postgre

* <https://www.enterprisedb.com/downloads/postgres-postgresql-downloads>

Don't forget to restart!

* ``psql -U user``
* ``pgadmin``