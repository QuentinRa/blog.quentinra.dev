========================
Test-driven en Java (2)
========================

Cette méthode est plus longue mais je pense qu'elle est plus efficace.

Il existe un cours sur le site sur le model-driven development (MDD), on
va s'en inspirer avec le BDD pour faire un TDD efficace.

On va d'abord penser les usages de notre application

	* qui fait quoi
	* comment une interaction se fait
	* avec quels paramètres

Par exemple un :code:`utilisateur` se :code:`connect`
avec un :code:`nom d'utilisateur (string)` et un :code:`mot de passe (string)`. On lui
retourne un réponse :code:`ok/ko (boolean)`.

Il faut que vous testiez tous les comportements possibles afin de lister tous les roles
(utilisateur, ...) et toutes les méthodes avec leurs arguments. Une fois ce travail
fait, vous avez donc vos méthodes/classes à tester ainsi que des valeurs pour vos premiers
tests venant de vos scénarios.

En continuant et écrivant vos tests, vous verrez les méthodes manquantes et peaufinerez le tout.

Puis ensuite vous pourrez enfin commencer à valider vos tests un par un comme vu
dans la méthode TDD en java (1).