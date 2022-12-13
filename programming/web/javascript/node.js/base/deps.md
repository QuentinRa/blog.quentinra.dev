# Dependencies

[Go back](../../../../../archives/info/very_old/node)

You should look at [https://www.npmjs.com/](https://www.npmjs.com/)
if you are looking for information about
a dependency (like when you want to "require" a library).

About the versioning,

* **^1.2.3** : same major version (1) but can change (2.3)
* **~1.2.3** : same major version (1.2) but can change (3)
* **>=version** : version greater or equals (you got **<=**, **<** and **>** too)
* **=version** : this version
* **version_from-version_to** : interval
* **a||b** : logical or, either rule a or rule b
* **latest** : use latest

You can install a dependency using ``npm install name_of_the_require```.