=====================
PHPStorm (php)
=====================

PHPStorm vous permet principalement de coder du PHP mais HTML, CSS, JS (+NodeJS), Boostrap, ...
sont supportés.

Vous avez WebStorm, si vous n'allez pas faire de PHP (ni rien côté serveur
comme un accès à la base de données vu qu'en JS on utilise des API).

**Astuces**

Vous pouvez sélectionner la version php en bas à droite

Parfois phpstorm ne détecte pas que vous utilisez une méthode (il la mets en gris) ... si vous
n'avez pas explicitement écrit dans l'appel dans le code par exemple. Vous pouvez faire
de la phpdoc avec :code:`/** @see class::method() **/` par exemple pour lui faire
comprendre que la méthode est utilisée (et/ou la classe).

**Tutoriels**

.. toctree::
   :maxdepth: 1

		Configuration Remote      <pstorm/remote>
		Lancer son site (fast)    <pstorm/start>