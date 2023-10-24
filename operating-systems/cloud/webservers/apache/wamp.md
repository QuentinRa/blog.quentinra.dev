# WAMP Server

<div class="row row-cols-md-2"><div>

WAMP server is a Windows server running Apache, MySQL/MariaDB, and PHP.

* 🐓 [Official website](https://www.wampserver.com/)
* 🥡 [Download link](https://sourceforge.net/projects/wampserver/)
* 🪄 [Download link](https://wampserver.aviatechno.net/) (new)
</div><div>

Once installed, and started, you will see this icon in the system tray.

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

If you're tired of swapping between both, you can disable one.

* Right-click on the wamp icon
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

* Left-click on the wamp icon
* Virtual hosts
* Write any domain you want, and enter your project folder path
* Restart Wamp

➡️ If you used a real domain, your browser may try to load it...

#### Update WAMP server

Use either of the download links and find the **update** section/folder. Download the updater, run it, and you're done.

⚠️ Ensure you're downloading the update and not the installer.

#### Install a new PHP version

Use either of the download links and find the **addons > PHP** section/folder. Download the PHP version you want and install it.

* Left-click on the wamp icon
* PHP
* Version
* Select yours
* Restart Wamp
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Updates
* Add-ons
</div><div>

* Add PHP modules
* Change the PHP version
</div></div>