.. _patrons:

================================
Patrons de conception
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/11/2020}`

Les patrons de conceptions sont des méthodes que d'autres programmeurs ont pensés
pour résoudre certains problèmes ou fournir des moyens de programmer
certains comportements.

Il existe 4 familles de patrons :

	* **Patrons de construction** : manières de créer des objets
	* **Patrons de structuration** : manières structurer le programme
	* **Patrons de comportement** : façons d’interagir entres objets
	* **Patrons d’architecture** : façon de programmer

.. note::

	Pour l'instant, ce cours présente explique et présente quelques patrons mais
	une mise à jour sera faite pour ajouter plus d'explications et d'exemples
	dans le futur. ~ Calistro

1. Patrons de construction
===================================

	* **Factory** : délègue construction, passe par une interface (Interface i = new Object())
	* **AbstractFactory** : délègue construction, on cache type (Interface i = Interface.getObject())
	* **Singleton** : une seule instance (garde instance static, getInstance)

2. Patrons de structuration
===================================

	* **Adaptor** : Le patron Adaptor permet de faire intéragir l’utilisateur avec une méthode, qui va exécuter d’autres méthodes en fonction d’où elle doit aller chercher l’information.
	* **Façade** : Api simplifiée, une méthode peut avoir plusieurs comportements
	* **Composite** : classe abstraite implémentée par parents et enfants

3. Patrons de comportement
===================================

	* **Iterator** : Le patron Iterator (+Iterable) permet d’itérer un objet sans connaitre son contenu. (parcours de façon générique, simultanée sans duplication).
	* **Observable** : Le patron Observable (+Observer) associe à un observer des objets observables qu’il peut actualiser s’il a changé (utile répercuter M->V).
	* **Décorateur** : pointeur sur un objet, rédéfini de ses méthodes
	* **Memento** : charge et sauvegarde objet, ou utiliser fichiers xml, json, bd...
	* **NullObjet** : classe dont les méthodes ne font rien

4. Patrons d’architecture
===================================

	* **MVC** : Le Modèle MVC (modèle vue contrôleur)
	* **DOA** : Le DAO (data access objet).

5. Exercices
==============

aucun

|

-----

**Crédits**
	* Florent Madelaine (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune