.. _java:

================================
JAVA
================================

| :math:`\color{grey}{Version \ 0.6.9}`
| :math:`\color{grey}{Dernière \ édition \ le \ 18/01/2021}`

1. Introduction  :code:`théorique`
===================================

Java est un langage dont le code fonctionne sur n'importe qu'elle machine
(Write once, run anywhere). La compilation d'une fichier java (.java)
produit un fichier au langage machine (.class).

.. toctree::
	 :maxdepth: 1

		Historique       <intro/historique>
		Vocabulaire      <intro/vocab>
		Installation     <intro/install>

2. Introduction :code:`code`
==============================

.. toctree::
	 :maxdepth: 1

		Compilation                    <base/compilation>
		Types                          <base/types>
		Structures et Opérateurs       <base/struct>
		Les instructions basiques      <base/inst>

La javadoc

	* JDK 7 : https://docs.oracle.com/javase/7/docs/api/overview-summary.html
	* JDK 10 : https://docs.oracle.com/javase/10/docs/api/overview-summary.html
	* JDK 14 : https://docs.oracle.com/en/java/javase/14/docs/api/index.html

sont des documentations des classes et des méthodes. N'hésitez pas à les utiliser
pour trouver les import a effectuer par exemple (qui sont manquants désolé!).

3. Implémentation de concepts (simple)
===============================================

Création d'une classe
Tableaux
Héritage et Substitution de liskov
Abstraction et Interfaces
Exceptions
Javadoc
Packages
Événements

4. Implémentation de concepts (avancé)
=========================================

.. toctree::
	 :maxdepth: 1

		Tableaux dynamiques   <code/a/sc2>
		Dictionnaires         <code/a/dic>
		Pile et Files         <code/a/sc>
		Généricité            <code/a/gen>
		Méthodes variadiques  <code/a/var>
		Énumérations          <code/a/enum>

5. Implémentation de concepts (pro)
=========================================

.. toctree::
	 :maxdepth: 1

		Threads                    <code/p/threads>
		Base de données (interne)  <code/p/bdi>
		Base de données (externe)  <code/p/bde>
		Réseau                     <code/p/net>

6. Autres concepts
======================

.. toctree::
	 :maxdepth: 1

		Manipulation de flux    <code/o/flux>
		Tris                    <code/o/tris>
		Récursivité             <code/o/rec>

7. Interfaces graphiques
===============================

.. toctree::
	 :maxdepth: 1

		JComponent et Composants graphiques  <code/i/jc>
		Mise en page (Layout)                <code/i/layout>
		Dessins                              <code/i/draw>

8. Les mystiques
========================

Ici, en vrac, quelques trucs que vous n'allez probablement jamais utiliser.

.. toctree::
	 :maxdepth: 1

		Annotations             <code/m/annotation>
		Constructeurs statique  <code/m/static>
		Caractères unicode      <code/m/unicode>
		Lambda expressions      <code/m/lambda>

-----

**Crédits**
	* Florent MADELAINE (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc HERNANDEZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune