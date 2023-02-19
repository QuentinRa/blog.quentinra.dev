# PHP

<div class="row row-cols-md-2"><div>

PHP <small>(PHP Hypertext preprocessor, a recursive acronym)</small> is still a quite used language to dynamically generate HTML pages. You can use

* 🍛 Expressions <small>(current date)</small>
* 🔁 Loops <small>(for, foreach, while...)</small>
* 🔀 Branching <small>(if, else)</small>
* 🥬 Fetch data from a database/... to render a page
* 🦄 Handle HTML forms that are submitted

</div><div>

To install PHP, you will need a webserver such as [Apache](/operating-systems/webservers/apache/index.md). ➡️ Well-known versions of PHP are: `5.6`, `7.*`, and `8` <small>(latest, since 2020)</small>.

Additionally, you may install extensions later:

```
sudo apt install php-curl
sudo apt install php-intl
sudo apt install php-ext-dom
sudo apt install php-dom
sudo apt install php-mbstring
sudo apt install php-mysql
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

</div><div>

```
sudo chown -R www-data:www-data folder/

sudo a2enconf php7.4-mbstring
sudo a2enmod php7.4-mbstring

sudo phpenmod mbstring
sudo phpenmod mod_rewrite
```
</div></div>