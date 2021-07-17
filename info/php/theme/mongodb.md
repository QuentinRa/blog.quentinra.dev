# MongoDB

[Go back](..)

Here we are considering that you read the NoSQL
database so you know

* what are NoSQL databases
* what's MongoDB

And that you trying to learn how you could call your
MongoDB database in PHP.

<hr class="sr">

## Installation

**On Windows, you should**

* read the official tutorial [here](https://www.php.net/manual/en/mongodb.installation.windows.php)
* on this [page](https://pecl.php.net/package/mongodb)
    * find the line of the version you want like ``1.9.1``
    * click on the DDL icon
    * find the block with your phpversion
      * Wamp, http://localhost, 3rd line
      * or create a php script and call phpinfo() function
    * find your ThreadSafe property (TS)
      * Wamp, http://localhost/?phpinfo=-1
      * or phpinfo()
      * and look for ``Thread Safety`` value
    * download your version according to TS value
* you should have a ``php_mongodb.dll`` file
* on Wamp
  * find your php folder inside this folder ``C:\wamp64\bin\php``
  * inside, paste the ddl file in ``ext/``
  * edit php.ini, add `extension=mongodb.dll` or ``extension=mongodb`` (this is working too)
  * you may restart your server (recommended by me)
* you should see your extension on ``http://localhost/``, "mongodb"
* if not, what I had to do was
  * right-click on wamp
  * tools
  * change php cli version
  * and set it to the right php version