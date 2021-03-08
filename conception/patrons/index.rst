.. _patrons:

================================
Patrons de conception
================================

| :math:`\color{grey}{Version \ 2.0.10}`
| :math:`\color{grey}{Dernière \ édition \ le \ 07/03/2020}`

Les patrons de conceptions sont des méthodes que d'autres programmeurs ont pensés
pour résoudre certains problèmes ou fournir des moyens de programmer
certains comportements. Il s'applique généralement à tous les langages orientés-objets OO.

Il existe 4 grandes familles de patrons :

	* **Patrons de création** : manières de créer des objets
	* **Patrons de structuration** : manières structurer le programme
	* **Patrons de comportement** : façons d’interagir entres objets
	* **Patrons d’architecture** : façon de programmer

Il existe également des anti-patrons donc des patrons à ne pas utiliser mais
que vous utilisez peut-être, donc il existe des solutions pour revenir à ces
mauvais codes typiques.

On note maintenant mais une astuce générale est que dans 100% des cas, si vous
copiez du code vous faites une bêtise et vous pourriez assez probablement faire autrement.

1. Patrons de création (creational)
======================================

	* **Factory** : délègue construction, passe par une interface appelée factory (Truc t = Factory.createTruc())
	* **AbstractFactory** : un ensemble de factory, on cache les factory utilisées, et pareil que factory, on cache les objets créés
	* **Singleton** : une seule instance (garde instance static, getInstance)
	* **Multiton** : uniquement n instances (garde liste d'instances static, getInstance)
	* **Prototype** : utilisation du clonage lorsque la création est complexe
	* **Builder** : sépare la création d'un objet en parties modulables
	* **Object Pool** : en gros, une classe génère les objets crées (ensemble fini: pool) et leur destruction.

.. toctree::
	 :maxdepth: 1

		Factory (method)    <c/factory>
		AbstractFactory     <c/a_factory>
		Singleton           <c/single>
		Multiton            <c/multi>
		Prototype           <c/prototype>
		Builder             <c/builder>

2. Patrons de structuration (structural)
=============================================

	* **Adaptor** : interface qui fait la liaison entre ce que le client veut et votre code
	* **Façade** : réalisation d'une api simplifiée de notre code
	* **Composite** : classe abstraite implémentée par parents et enfants
	* **Bridge** : faire en sorte d'interagir avec des interfaces plutôt que des réalisations concrètes
	* **Decorator** : modifier uniquement une méthode (pointeur sur un objet, redéfini de ses méthodes)
	* **Flyweight** : si vous avez des programmes avec 100000 instances d'un même trucs (soldats, ...)
	* **Proxy** : un objet qui appelle les méthodes d'un autre

.. toctree::
	 :maxdepth: 1

		Adaptor    <s/adaptor>
		Façade     <s/facade>
		Composite  <s/composite>
		Bridge     <s/bridge>
		Decorator  <s/decorator>
		Flyweight  <s/flyweight>
		Proxy      <s/proxy>

3. Patrons de comportement (behaviour)
=========================================

	* **Chain of Responsibility** : vous définissez une chaîne de personnes à qui demander un truc
	* **Iterator** : Le patron Iterator (+Iterable) permet d’itérer un objet sans connaitre son contenu. (parcours de façon générique, simultanée sans duplication).
	* **Observable** : Le patron Observable (+Observer) associe à un observer des objets observables qu’il peut actualiser s’il a changé (utile répercuter M->V).
	* **Memento** : charge et sauvegarde objet, ou utiliser fichiers xml, json, bd...
	* **NullObject** : classe dont les méthodes ne font rien
	* **Commande** : sépare celui qui utilise l'action de celui qui la fait
	* **Interpreter** : ...
	* **Template Method** : ...
	* **State** : ...
	* **Strategy** : ...
	* **Visitor** : ...
	* **Mediator** : ...

.. toctree::
	 :maxdepth: 1

		Chain of Responsibility  <b/cor>
		Iterator                 <b/iterator>
		Observable               <b/observable>
		Memento                  <b/memento>
		NullObject               <b/null_object>
		Commande                 <b/commande>
		Interpreter              <b/interpreter>
		Template Method          <b/template>
		State                    <b/state>
		Strategy                 <b/strategy>
		Visitor                  <b/visitor>
		Mediator                 <b/mediator>

4. (Patrons) d’architecture
===================================

	* **MVC** : Le Modèle MVC (modèle vue contrôleur)
	* **DOA** : Le DAO (data access objet).

5. Exercices
==============

aucun

-----

**Crédits**
	* David ROUSSEL (enseignant à l'ENSIIE)
	* Florent MADELAINE (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikibooks.org/wiki/Patrons_de_conception
	* https://www.javatpoint.com/design-patterns-in-java
	* https://www.geeksforgeeks.org/the-decorator-pattern-set-2-introduction-and-design/
	* https://www.gofpatterns.com/
	* https://www.geeksforgeeks.org/null-object-design-pattern/
	* https://www.tutorialspoint.com/design_pattern/null_object_pattern.htm
	* https://www.tutorialspoint.com/design_pattern/chain_of_responsibility_pattern.htm
	* https://www.baeldung.com/java-observer-pattern