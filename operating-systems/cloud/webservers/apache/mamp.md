# MAMP Server

<div class="row row-cols-lg-2"><div>

[MAMP](https://www.mamp.info/en/mamp/mac/) is a macOS server running Apache, MySQL/MariaDB, and PHP. 

Beware of installing MAMP PRO ☠️ by mistake, because you most likely want the free MAMP 🐋.

Once started, click on the preference button, navigate to ports, and **select `"80 & 3306"` to use the default usual ports** <small>(8888 by default)</small>.

You can also navigate to "server", and click on `Open in Finder`. The folder opened is the web server root.

</div><div>

➡️ The associated URL is `http://localhost`.

➡️ The web server root path is shown when starting MAMP, in the middle of the screen. It's usually `Application > MAMP > httpdocs`.

#### Access the database

Navigate to `http://localhost/phpmyadmin`. You don't have to log in, but in your code, the credentials are `root`/`root`, and the port is `3306`.
</div></div>