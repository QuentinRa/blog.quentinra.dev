=========
Bridge
=========

L'idée du bridge est que vous allez essayer d'utiliser des interfaces lorsque
c'est possible.

Par exemple, imaginons que vous faites un programme de documentation de code. Vous devez
pourvoir en compiler une version html, latex, ... Vous allez alors faire une interface Compilateur
et utiliser cette interface plutôt que CompilateurHTML par exemple.

Cela semble logique dit comme ça, mais voyez l'image en grand. Vous saviez ici que vous allez
faire une version latex ou autre en plus du HTML. Ce n'est pas toujours le cas, donc généralement
vous passez à côté, et lorsqu'il faut ajouter des options, bah il faut tout refaire.

More

	* :code:`➡️` : l'exemple plus haut
	* :code:`✅` : proposer plusieurs implémentations d'une classe, flexibilité pour étendre les fonctionnalités
	* :code:`🚫` : aucun ?

Aucun exemple.