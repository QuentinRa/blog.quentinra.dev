================================
Test avec JUnit (3,4 et 5)
================================

Pour faire simple, IntelliJ inclut automatiquement JUnit5
pour votre module de tests, donc généralement aucun problèmes.

Vous faites la flèche verte pour lancer un test ou
cette tout en haut pour lancer tous les tests

.. image:: /assets/utils/jetbrains/tests/test1.png

Vous aurez une vue comme suit, vous pouvez cacher les tests
validés ou facilement les relancer

.. image:: /assets/utils/jetbrains/tests/test4.png

**Vintage Junit Sous IntelliJ**

Dans le cas ou vous n'utiliseriez pas maven/gradle et voudriez
la legacy (a.k.a. vintage) version de JUnit, alors ouvrir
le menu de project structure, aller dans librairie, et cliquer sur le + puis maven

.. image:: /assets/utils/jetbrains/tests/test2.png

Remplissez le menu ci-dessous avec ces 5 lignes (vous pouvez changer les versions),
si c'est pas clair, il faut cliquer 5 fois sur + et répéter cette étape 5 fois

	*	:code:`org.junit.platform:junit-platform-suite-api:1.7.0`
	*	:code:`org.junit.jupiter:junit-jupiter-engine:5.7.0`
	*	:code:`org.junit.platform:junit-platform-launcher:1.7.0`
	*	:code:`org.junit.vintage:junit-vintage-engine:5.7.0`
	*	:code:`org.junit.platform:junit-platform-runner:1.7.0`

Si vous voulez chopper les .jar ou les mettre dans votre PC plutôt que
sur l'ordinateur actuel, vous pouvez avec download to, mais je l'ai jamais
fait donc je ne serait pas vous conseiller.

.. image:: /assets/utils/jetbrains/tests/test3.png