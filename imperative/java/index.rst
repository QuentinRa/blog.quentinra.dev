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

Java est un langage orienté objet ce qui veux dire que tout
(8 exceptions = 8 types primitifs) est représenté sous ce qu'on appelle une classe.

Le vocabulaire est requis avant de continuer. Avoir Java d'installé, ça aide.

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

.. toctree::
	 :maxdepth: 1

		Création d'une classe                 <code/s/start>
		Tableaux                              <code/s/tab>
		Héritage et Substitution de liskov    <code/s/legacy>
		Abstraction et Interfaces             <code/s/abs>
		Exceptions                            <code/s/except>
		Javadoc                               <code/s/doc>
		Packages                              <code/s/packages>

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
		Événements                           <code/i/event>

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
	* https://fr.wikibooks.org/wiki/Programmation_Java/Annotations
	* https://www.lwjgl.org/
	* https://libgdx.com/