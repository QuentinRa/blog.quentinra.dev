# WAMP Server

<div class="row row-cols-md-2"><div>

WAMP server is a Windows server running Apache, MySQL/MariaDB, and PHP.

* 🐓 [Official website](https://www.wampserver.com/)
* 🥡 [Download link](https://sourceforge.net/projects/wampserver/)

</div><div>

Once installed, and started, you will this icon in the system trail.

<div class="text-center">

![wamp icon](_images/wamp.png)
</div>

➡️ The webserver root is available in `C:\wamp64\www\`<br>
➡️ The associated URL is `http://localhost/`
</div></div>

<hr class="sep-both">

## Random notes

<div class="row row-cols-md-2"><div>

#### Access the database

Both MySQL and MariaDB are available, you can swap between them.

* Go to `http://localhost/phpmyadmin`
* Username: `root`
* Password: (leave empty)

#### Swap to MariaDB

If you're tired to swap between both, you can disable one.

* Right-click on Wamp Icon
* Settings
* Disabled MySQL
* Enable MariaDB

#### Install PostgreSQL

You can [download PostgreSQL here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). Beware that version 12+ needs PHP 7.4.0+. Don't forget to restart!

* Login: `psql -U user`
* Open the "phpmyadmin": `pgadmin`
</div><div>

#### Add Virtual Hosts

You can create a fake domain associated with a project on your machine.

* Left-click on Wamp Icon
* Virtual hosts
* Write any domain you want, and enter your project folder path
* Restart Wamp

➡️ If you used a real domain, your browser may try to load it...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Updates
* Add-ons
</div><div>

* Add PHP modules
* Change PHP version
</div></div>