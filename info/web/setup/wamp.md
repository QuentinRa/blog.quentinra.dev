# Virtual local server

[Go back](../index.md#webserver)

We are usually using **AMP** (Apache MySQL PHP), a software installing the **3** tools you will need. You got 3 version, according to your OS: W=Windows, L=Linux and M=MacOS giving us **WAMP** on Windows.

* [Wamp](https://www.wampserver.com/) or here [Wamp](https://ampps.com/wamp)
* [Lamp](https://ampps.com/lamp)
* [Mamp](https://www.mamp.info/en/mamp/windows/)

> Note: when installing, you will be prompted to pick a browser. If yours is not in the list,
> * write "Firefox" (example) in the search bar
> * right-click -> open file location
> * **again**, inside the folder, right-click -> open file location
> * you should have your PATH now

<hr class="sl">

## How do it works?

Once installed, you need to run it each time you start your computer (sometimes you don't have to). Check the trails icons (the icons next to your sound/battery/...). If AMP is started, you should see this

![wamp icon](images/wamp.png)

The location of your

* **webserver root**: `C:\wamp64\www\` (`/var/www/html/` on Linux)
  * for your path (if needed)
  * left-click on the icon
  * click on "www folder"
* **base/root url**: `http://localhost/`

<hr class="sr">

## Notes

<details class="details-border">
<summary>Change to MariaDB</summary>
<br>

If you, like me, will use `MariaDB` then right-click on wamp in the system trail.

* Settings
* Disabled MySQL
* Enable MariaDB

Your database is at `http://localhost/phpmyadmin`, with the credentials `root` and no password by default.
</details>

<details class="details-border">
<summary>Change the Lang</summary>
<br>

Right-click on wamp in the system trail then in lang menu.
</details>

<details class="details-border">
<summary>Change PHP/... version</summary>
<br>

Left-click on wamp in the system trail. You can enable and disabled PHP modules here too.
</details>

<details class="details-border">
<summary>Use PostgreSQL</summary>
<br>

* <https://www.enterprisedb.com/downloads/postgres-postgresql-downloads>

Don't forget to restart!

* `psql -U user`
* `pgadmin`
</details>

<details class="details-border">
<summary>Use <b>Virtual Hosts</b></summary>
<br>

Sometimes, you don't want to have the URL `http://localhost/.../`, but maybe, the real URL of your website?

Left-click on wamp in the system trail. Click on virtual hosts, and you will be able to add one easily.
</details>