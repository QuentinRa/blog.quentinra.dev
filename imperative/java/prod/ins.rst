================================
Créer un .exe et son installeur
================================

Dans certains cas, vous pouvez vouloir inclure le JRE dans le jar/exe que vous partagez
(mais l'utilisateur peut se retrouver avec x JRE sur sa machine, il faudra mettre vos JRE à jour, ...).
Vous pouvez customisez votre JRE depuis Java 11, voici un site pour le faire en ligne :
https://justinmahar.github.io/easyjre/ (`github <https://github.com/justinmahar/easyjre>`_).

Pour créer un installeur, vous pouvez utiliser :code:`install4j` (https://www.ej-technologies.com/products/install4j/overview.html)
qui est payant.

Vous pouvez générer un .exe d'un .jar avec :code:`launch4j` (http://launch4j.sourceforge.net/).
Attention si vous avez des problèmes, essayer de changer les options
de recherche d'un JRE (mettre une version min/... ou mettre "Prefer JDK, but use JRE" par exemple).

Pour créer un installeur pour votre .exe, vous pouvez utiliser :code:`innoDB`. C'est très
facile à utiliser si vous utilisez la création assistée.

Enfin il vous restera à acheter un certificat EV ou non pour déclarer votre .exe comme
sûr (search: code signing certificate).