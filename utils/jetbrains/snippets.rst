======================
Snippets
======================

Les snippets sont des bouts de code déjà codé par exemple lorsque
vous commencez à tapper :code:`for` puis appuyez sur tab et une boucle
for déjà codée apparait.

Vous pouvez créer des snippets pour chaque langage (user) ou directement
pour un langage.

On ouvre Settings > Editor > Live template.

Vous pouvez alors

	* cliquez sur un langage et faire + > live template (ajouter)
	* cliquez sur + > live template group puis l'appeler user par exemple et refaire l'étape plus haute mais sur user.

Dans un live template,

	* L'abréviation : nom utilisé dans le code (ex: for)
	* Description : affiche une description pour rappeler au moment de l'appel ce que fait ce snippet
	* Template Text : le code affiché après utilisation (ex: code du for)

Vous pouvez créer des variables, par exemple dans une boucle for on ne connait pas la condition à l'avance
donc on peut faire en sorte que le curseur soit mis ici pour que l'utilisateur complète puis
on le mets dans le bloc de code pour qu'il ajoute du code. On aurait donc 2 variables par exemple
condition et code. On peut aussi faire des variables pour des valeurs qui seront calculées au moment de l'appel.

On créé une variable en écrivant :code:`$nom_variable$` dans le code. On peut ensuite spécifier
le comportement (comme la remplir, si on met la souris de l'utilisateur dessus pour le forcer à remplir
ce champ) avec :code:`edit variables`.